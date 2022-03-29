Last login: Tue Mar 29 22:25:42 on ttys000
Jeffs-Air:~ jeffkayombo$ psql
psql (14.2)
Type "help" for help.

jeffkayombo=# CREATE DATABASE clinic_database;
CREATE DATABASE
jeffkayombo=# \c clinic_database
You are now connected to database "clinic_database" as user "jeffkayombo".
clinic_database=# CREATE TABLE medical_histories;
ERROR:  syntax error at or near ";"
LINE 1: CREATE TABLE medical_histories;
                                      ^
clinic_database=# CREATE TABLE medical_histories(
clinic_database(# ID PRIMARY KEY SERIAL,
clinic_database(# admitted_at TIMESTAMP,
clinic_database(# patient_id INT,
clinic_database(# status VARCHAR(30)
clinic_database(# );
ERROR:  syntax error at or near "PRIMARY"
LINE 2: ID PRIMARY KEY SERIAL,
           ^
clinic_database=# CREATE TABLE medical_histories(
clinic_database(# id PRIMARY KEY SERIAL,
clinic_database(# admitted_at TIMESTAMP,
clinic_database(# patient_id INT,
clinic_database(# status VARCHAR(30)
clinic_database(# );
ERROR:  syntax error at or near "PRIMARY"
LINE 2: id PRIMARY KEY SERIAL,
           ^
clinic_database=# CREATE TABLE medical_histories(
clinic_database(# ID PRIMARY KEY INT GENERATED ALWAYS AS IDENTITY,
clinic_database(# admitted_at TIMESTAMP,
clinic_database(# patient_id INT,
clinic_database(# status VARCHAR(30)
clinic_database(# );
ERROR:  syntax error at or near "PRIMARY"
LINE 2: ID PRIMARY KEY INT GENERATED ALWAYS AS IDENTITY,
           ^
clinic_database=# CREATE TABLE medical_histories(
clinic_database(# ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
clinic_database(# admitted_at TIMESTAMP,
clinic_database(# patient_id INT,
clinic_database(# status VARCHAR(30)
clinic_database(# );
CREATE TABLE
clinic_database=# ALTER TABLE medical_histories
clinic_database-# ;
ERROR:  syntax error at or near ";"
LINE 2: ;
        ^
clinic_database=# CREATE TABLE patients(
clinic_database(# id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
clinic_database(# name VARCHAR(30),
clinic_database(# date_of_birth DATE
clinic_database(# );
CREATE TABLE
clinic_database=# ALTER TABLE medical_histories
clinic_database-# ADD CONSTRAINT patient_id FOREIGN KEY(patient_id) REFERENCIES patients(id);
ERROR:  syntax error at or near "REFERENCIES"
LINE 2: ADD CONSTRAINT patient_id FOREIGN KEY(patient_id) REFERENCIE...
                                                          ^
clinic_database=# ALTER TABLE medical_histories
clinic_database-# ADD CONSTRAINT patient_id FOREIGN KEY(patient_id) REFERENCES patients(id);
ALTER TABLE
clinic_database=# CREATE TABLE treatments(
clinic_database(# id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
clinic_database(# type VARCHAR(30),
clinic_database(# name VARCHAR(30)
clinic_database(# );
CREATE TABLE
clinic_database=# 