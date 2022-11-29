# Class registration page

# About the Project


Class registration page for users and tutors. 

User can select your nickname and choose whether you take 20 min or 40 min class.
Then, you can see time table of available class. 
When you click the available time slot, you can see the list of available tutors for that time. 
Finally, if you click a tutor, then you can enroll the tutor’s class. 

Tutor can also select your nickname and check available class time table. 
Enrolled class information can be shown as well.

# Built with


- Ruby 2.7.2
- Rails 6.1.7

# Data schema


**User**

- id : integer (unique)
- nickname : string

**Tutor**

- id : integer (unique)
- nickname : string

**Table**

- id : integer (unique)
- tutor_id : integer
- start_time : datetime
- active: integer (1 : available, 2 : unavailable)
- user_id: integer
- duration: integer