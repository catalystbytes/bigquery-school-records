-- SQL to create all tables
CREATE TABLE `dbt-learn-360010.school_records.Students` (
  student_id INT64,
  first_name STRING,
  last_name STRING,
  phone STRING,
  email STRING,
  gender STRING,
  enrollment_date DATE,
  status STRING
);

CREATE TABLE `dbt-learn-360010.school_records.Teachers` (
  teacher_id INT64,
  first_name STRING,
  last_name STRING,
  phone STRING,
  email STRING,
  hire_date DATE,
  department STRING
);

CREATE TABLE `dbt-learn-360010.school_records.Classes` (
  class_id INT64,
  class_name STRING,
  teacher_id INT64,
  schedule STRING
);

CREATE TABLE `dbt-learn-360010.school_records.Terms` (
  term_id STRING,
  term_name STRING,
  start_date DATE,
  end_date DATE
);

CREATE TABLE `dbt-learn-360010.school_records.Grades` (
  grade_id INT64,
  student_id INT64,
  class_id INT64,
  grade NUMERIC,
  term_id STRING
);
