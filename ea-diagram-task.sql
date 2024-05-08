
Table "admissions" {
  "userid" int(11) 
  "course_id" int(11) 
  "admission_fees" varchar(25) 

  Indexes {
    (userid, course_id) [pk]
  }
}

Table "codekata" {
  "userid" int(11) 
  "solved_problem" varchar(25) 

  Indexes {
    (userid, solved_problem) [pk]
  }
}

Table "course" {
  "course_id" int(11) [pk, not null]
  "course_name" varchar(25) 
  "course_duration" varchar(255) 
  "course_fees" varchar(25) 
}

Table "leaderboard" {
  "userid" int(11) 
  "course_id" int(11) 
  "batch" varchar(25) 
  "submited_task" varchar(25) 
  "total_mark" varchar(25) 

  Indexes {
    (userid, course_id, submited_task) [pk]
  }
}

Table "mentor" {
  "userid" int(11) 
  "course_id" int(11) 
  "mentor_name" varchar(25) 

  Indexes {
    (userid, course_id) [pk]
  }
}

Table "queries" {
  "userid" int(11) 
  "topics" varchar(255) 
  "reasons_queries" varchar(255) 

  Indexes {
    (userid, topics) [pk]
  }
}

Table "studentsattendance" {
  "A_id" int(11) [pk]
  "userid" int(11) 
  "A_date" datetime [default: `current_timestamp()`]
  "status" tinyint(1) [default: 1]
}

Table "task" {
  "userid" int(11) 
  "course_id" int(11) 
  "submited_task" varchar(25) 
  "task_mark" varchar(25) 

  Indexes {
    (userid, submited_task) [pk]
  }
}

Table "user" {
  "userid" int(11) [pk]
  "username" varchar(25) 
  "useremail" varchar(255) 
  "usermobile" varchar(10) 
}

Ref "admissions_ibfk_1":"user"."userid" < "admissions"."userid"

Ref "admissions_ibfk_2":"course"."course_id" < "admissions"."course_id"

Ref "codekata_ibfk_1":"user"."userid" < "codekata"."userid"

Ref "leaderboard_ibfk_1":"user"."userid" < "leaderboard"."userid"

Ref "leaderboard_ibfk_2":"course"."course_id" < "leaderboard"."course_id"

Ref "mentor_ibfk_1":"user"."userid" < "mentor"."userid"

Ref "mentor_ibfk_2":"course"."course_id" < "mentor"."course_id"

Ref "queries_ibfk_1":"user"."userid" < "queries"."userid"

Ref "studentsattendance_ibfk_1":"user"."userid" < "studentsattendance"."userid"

Ref "task_ibfk_1":"user"."userid" < "task"."userid"

Ref "task_ibfk_2":"course"."course_id" < "task"."course_id"

Ref "task_ibfk_2":"leaderboard"."submited_task" < "task"."submited_task"

