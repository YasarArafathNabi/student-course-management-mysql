-- Create Database
Create database student_db;
use student_db;

-- Create Students Table and Data
create table students (
	student_id int primary key,
    name varchar(100) not null,
    email varchar(100) unique,
    created_date datetime default current_timestamp
);
insert into students values (1,'Arun','arun@gmail.com', now()), (2,'Kumar','kumar@gmail.com',NOW()), (3,'Rahul','rahul@gmail.com',NOW());
select * from students;

-- Create Courses Table and Data
create table courses (
	course_id int primary key,
    course_name varchar(100) not null,
    course_fee decimal(8,2)
);
insert into courses values (101,'Python',5000), (102,'Java',7000), (103,'SQL Basics',6000);
select * from courses;

-- Create Enrollments Table and Data
create table enrollments (
	enroll_id int primary key,
    student_id int,
    course_id int,
    enroll_date datetime default current_timestamp,
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id)
);
insert into enrollments values (1,1,101,now()), (2,2,102,now()), (3,3,103,now());
select * from enrollments;

-- Stored Procedure for Student Add
delimiter //
create procedure add_student(in p_id int, in p_name varchar(100), in p_email varchar(100))
begin
insert into students(student_id, name, email) values(p_id,p_name,p_email);
end //
delimiter;

call add_student(4,'Vijay','vijay@gmail.com');

-- Stored Procedure for Student-Course Enroll
delimiter //
create procedure enroll_student(in p_roll_id int, in p_student_id int, in p_course_id int)
begin
insert into enrollments(enroll_id,student_id,course_id) values (p_roll_id,p_student_id,p_course_id);
end //
delimiter;

call enroll_student(4,4,101);

-- Function for Course fee
delimiter //
create function get_course_fee(p_course_id int) returns decimal(8,2)
deterministic
begin
declare v_fee decimal(8,2);
select ifnull(course_fee, 0) into v_fee from courses
where course_id = p_course_id;
return ifnull(v_fee, 0);
end //
delimiter;

select get_course_fee(102);

-- Stored Procedure for Course Details
delimiter //
create procedure get_course_details(in p_course_id int, out p_course_name varchar(100), out p_course_fee decimal(8,2))
begin
select course_name, course_fee into p_course_name, p_course_fee from courses where course_id = p_course_id;
if p_course_name is null then
set p_course_name = 'Not Found';
set p_course_fee = 0;
end if;
end //
delimiter;

call get_course_details(101, @name, @fee);
select @name as Course_Name, @fee as Course_Fee;
