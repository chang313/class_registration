class TableController < ApplicationController
  # if user wants 20 minutes class
  def class_20
    @current_time = DateTime.new(2022,11,20,0,0)
    @result = []

    # @result is a array that contains each time's "가능" or "불가능" value from sunday to saturday
    # It has 48 hashes for each time slot
    # Hash has start time value and "가능" or "불가능" value from sunday to saturday 
    for slot in 0..47 do
      row = []
      for day in 1..7 do
        # check whether available tutor exist for each time slot
        if Table.exists?(start_time: @current_time, active: 1)
          row << "가능"
        else
          row << "불가능"
        end
        @current_time += 1.day
      end
      hour_min = @current_time.strftime("%H:%M")
      result_row = { 
        time: hour_min,
        sun: row[0],
        mon: row[1],
        tue: row[2],
        wed: row[3],
        thu: row[4],
        fri: row[5],
        sat: row[6],
      }
      @result << result_row
      @current_time -= 7.day
      @current_time += 30.minutes
    end 
  end

  # if user wants 40 minutes class
  def class_40
    @current_time = DateTime.new(2022,11,20,0,0)
    @result = []
    
    # @result is a array that contains each time's "가능" or "불가능" value from sunday to saturday
    # It has 48 hashes for each time slot
    # Hash has start time value and "가능" or "불가능" value from sunday to saturday 
    for slot in 0..47 do
      row = []
      for day in 1..7 do
        data = Table.where(start_time: @current_time, active: 1)
        data_next = Table.where(start_time: @current_time + 30.minutes, active: 1)
        # check whether available tutor exists for current time slot and next time slot
        if data
          if data_next 
            possible = false
            data.each do |slot|
              next_data = Table.find_by(start_time: @current_time + 30.minutes, tutor_id: slot.tutor_id)
                if next_data
                  possible = true
                  break
                end
            end 

            if possible
              row << "가능"
            else
              row << "불가능"
            end

          else
            row << "불가능"
          end
  
        else
          row << "불가능"
        end
        @current_time += 1.day
      end
      hour_min = @current_time.strftime("%H:%M")
      
      result_row = { 
        time: hour_min,
        sun: row[0],
        mon: row[1],
        tue: row[2],
        wed: row[3],
        thu: row[4],
        fri: row[5],
        sat: row[6],
      }
      @result << result_row
      @current_time -= 7.day
      @current_time += 30.minutes
    end 
  end

  # show available tutor list for 20 min class
  def show_tutor_20
    @time = DateTime.new(2022,11,20,0,0) + (params[:time_index].to_i*30).minutes
    @available = Table.where(start_time: @time, active: 1)
    @tutors = [] # available tutor nickname array 
    @available.each do |data|
      tutor_id = data.tutor_id
      tutor = Tutor.find_by(id: tutor_id).nickname
      unless @tutors.include?(tutor)
        @tutors << tutor

      end
    end
  end

  # show available tutor list for 20 min class
  def show_tutor_40
    @time = DateTime.new(2022,11,20,0,0) + (params[:time_index].to_i*30).minutes
    time_next = @time + 30.minutes
    @available = Table.where(start_time: @time, active: 1)
    @tutors = [] # available tutor nickname array
    @available.each do |data|
      tutor_id = data.tutor_id
      tutor = Tutor.find_by(id: tutor_id).nickname

      next_available = Table.find_by(start_time: time_next, active: 1, tutor_id: tutor_id)
      if !@tutors.include?(tutor) && next_available
        @tutors << tutor

      end
    end
  end

  # enroll 20 min class of selected tutor
  def enroll_20
    @time = DateTime.new(2022,11,20,0,0) + (params[:time_index].to_i*30).minutes
    tutor_id = Tutor.find_by(nickname: params[:tutor_nickname])
    @data = Table.find_by(start_time: @time, tutor_id: tutor_id)

    # update selected tutor's data 
    # user_id, duration, active attributes are updated as below
    @data.update(user_id: params[:id], duration: 20, active: 2)

  end

  # enroll 40 min class of selected tutor
  def enroll_40
    @time = DateTime.new(2022,11,20,0,0) + (params[:time_index].to_i*30).minutes
    tutor_id = Tutor.find_by(nickname: params[:tutor_nickname])
    @data = Table.find_by(start_time: @time, tutor_id: tutor_id)
    @next_data = Table.find_by(start_time: @time+30.minutes, tutor_id: tutor_id)

    # update selected tutor's current and next time data
    # user_id, duration, active attributes are updated as below
    @data.update(user_id: params[:id], duration: 30, active: 2)
    @next_data.update(user_id: params[:id], duration: 10, active: 2)

  end
end
