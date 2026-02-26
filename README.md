# Student Course Management System (MySQL)

## 📌 Project Overview
A beginner-friendly database project built using MySQL.
This project demonstrates table creation, stored procedures, functions, and conditional logic using SQL.

## 🛠 Technologies Used
- MySQL 8.0
- MySQL Workbench
- SQL
- Stored Procedures
- Functions

## 📂 Database Structure
- courses table
- Stored Procedure: get_course_details
- Function: get_course_fee

## ⚙ Features
- Retrieve course name and fee using course_id
- Handle invalid course_id with default values
- Demonstrates use of IN and OUT parameters
- Conditional logic using IF statement

## 🗄 Sample Table Structure

| Column Name  | Data Type     |
|--------------|---------------|
| course_id    | INT (PK)      |
| course_name  | VARCHAR(100)  |
| course_fee   | DECIMAL(8,2)  |

## 🚀 How to Run
1. Import the SQL file into MySQL Workbench
2. Execute the script
3. Call the stored procedure:
   CALL get_course_details(101, @name, @fee);
   select @name as Course_Name, @fee as Course_Fee;

## 📸 Output Screenshot
![Output](student-course-management-mysql/Output.png)

## 👨‍💻 Author
Yasar Arafath Nabi
