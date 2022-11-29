class TutorController < ApplicationController
  # show all tutor nickname list
  def index
    @tutors = Tutor.all
  end

  # show selected tutor's 'available' and 'enroll' selection page
  def select
    @tutor = Tutor.find_by(id: params[:id])
  end

  # show enrolled class information of the tutor
  def enroll
    @tutor = Tutor.find_by(id: params[:id])
    @list = Table.where(tutor_id: params[:id], active: 2)

    @class_list = []
    @list.each do |data|
      tutor_id = data.tutor_id
      start_time = data.start_time
      user_id = data.user_id
      duration = data.duration

      if duration == 10
        next
      end
      if duration == 30
        total_dur = 40
      else
        total_dur = 20 
      end

      tutor_nickname = Tutor.find_by(id: tutor_id).nickname
      user_nickname = User.find_by(id: user_id).nickname
      element = {
        tutor_nick: tutor_nickname, 
        user_nick: user_nickname, 
        duration: total_dur, 
        start_time: start_time.strftime("%m-%d %H:%M")
      }
      @class_list << element
    end
  end
  
  # show available time table of the tutor
  def available
    @current_time = DateTime.new(2022,11,20,0,0)
    @result = []
    @tutor = Tutor.find_by(id: params[:id])
    for slot in 0..47 do
      row = []
      for day in 1..7 do
        data = Table.find_by(start_time: @current_time, tutor_id: params[:id])
        if data
          if data.active == 1
            row << "가능"
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

end
