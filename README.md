# BigQuery School Records Project

## Project Setup and Usage

### Prerequisites
- **Google Cloud Platform (GCP) Account**: If you don't have one, sign up for GCP.
- **BigQuery API Enabled**: Ensure that the BigQuery API is enabled in your GCP project.
- **BigQuery Dataset**: Create a dataset named `school_records` within your GCP project.

### Getting Started
1. **Clone the Repository**  
   Clone this repository to your local machine using:
   ```sh
   git clone https://github.com/yourusername/bigquery-school-records.git

2. **Navigate to the Project Directory**
   ```sh
   cd bigquery-school-records

3. **Open BigQuery Console**
Open the BigQuery console from the GCP dashboard.

4. **Execute SQL Scripts**
- Create Tables: Use the provided SQL scripts to create the necessary tables.
- Insert Data: Use the insert statements to populate the tables with sample data.
- Manage Data: Use the delete and update statements to manage the data within the tables.

### Creating Tables
Before inserting data, ensure that the tables are created within the school_records dataset. Below are the SQL statements to create the necessary tables.

## Create Students Table
```sql
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
```

## Create Teachers Table
```sql
CREATE TABLE `dbt-learn-360010.school_records.Teachers` (
  teacher_id INT64,
  first_name STRING,
  last_name STRING,
  phone STRING,
  email STRING,
  hire_date DATE,
  department STRING
);
```

## Create Classes Table
```sql
CREATE TABLE `dbt-learn-360010.school_records.Classes` (
  class_id INT64,
  class_name STRING,
  teacher_id INT64,
  schedule STRING
);
```

## Create Terms Table
```sql
CREATE TABLE `dbt-learn-360010.school_records.Terms` (
  term_id STRING,
  term_name STRING,
  start_date DATE,
  end_date DATE
);
```

## Create Grades Table
```sql
CREATE TABLE `dbt-learn-360010.school_records.Grades` (
  grade_id INT64,
  student_id INT64,
  class_id INT64,
  grade NUMERIC,
  term_id STRING
);
```
### SQL Script Files
To keep the project organized, create separate SQL files for different operations. Below is the suggested directory structure and the content of each SQL file.

### Directory Structure
```plaintext
bigquery-school-records/
├── create_tables.sql
├── insert_students.sql
├── insert_teachers.sql
├── insert_classes.sql
├── insert_terms.sql
├── insert_grades.sql
├── delete_grades.sql
├── update_terms.sql
├── update_grades.sql
```
### SQL File Contents

# create_tables.sql

```sql
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

# insert_students.sql

```sql
-- Insert data into Students Table
INSERT INTO `dbt-learn-360010.school_records.Students` 
(student_id, first_name, last_name, phone, email, gender, enrollment_date, status)
VALUES
  (1, 'John', 'Doe', '555-1234', 'john.doe@example.com', 'Male', '2021-09-01', 'Active'),
  (2, 'Jane', 'Smith', '555-5678', 'jane.smith@example.com', 'Female', '2021-09-01', 'Active'),
  (50, 'Chris', 'Johnson', '555-9876', 'chris.johnson@example.com', 'Non-binary', '2021-09-01', 'Active');
```

# insert_teachers.sql
```sql
-- Insert data into Teachers Table
INSERT INTO `dbt-learn-360010.school_records.Teachers` 
(teacher_id, first_name, last_name, phone, email, hire_date, department)
VALUES
  (1, 'Alice', 'Brown', '555-2345', 'alice.brown@example.com', '2020-08-15', 'Mathematics'),
  (2, 'Bob', 'White', '555-6789', 'bob.white@example.com', '2019-07-20', 'Science'),
  (12, 'Eva', 'Green', '555-6543', 'eva.green@example.com', '2021-03-22', 'History');
```

# insert_classes.sql
```sql
-- Insert data into Classes Table
INSERT INTO `dbt-learn-360010.school_records.Classes` 
(class_id, class_name, teacher_id, schedule)
VALUES
  (101, 'Algebra I', 1, 'Mon-Wed-Fri 09:00-10:00'),
  (102, 'Biology', 2, 'Tue-Thu 10:00-11:30'),
  (123, 'World History', 12, 'Mon-Wed-Fri 11:00-12:00');
```

# insert_terms.sql
```sql
-- Insert data into Terms Table
INSERT INTO `dbt-learn-360010.school_records.Terms` 
(term_id, term_name, start_date, end_date)
VALUES
  ('2021T1', 'Term 1 2021', '2021-01-01', '2021-04-30'),
  ('2022T1', 'Term 1 2022', '2022-01-01', '2022-04-30'),
  ('2022T2', 'Term 2 2022', '2022-05-01', '2022-08-31'),
  ('2022T3', 'Term 3 2022', '2022-09-01', '2022-12-31'),
  ('2023T1', 'Term 1 2023', '2023-01-01', '2023-04-30');
```

# insert_grades.sql
```sql
-- Insert data into Grades Table with 1 grade_id for each class_id and student_id
INSERT INTO `dbt-learn-360010.school_records.Grades` 
(grade_id, student_id, class_id, grade, term_id)
SELECT
  ROW_NUMBER() OVER () AS grade_id,
  student_id,
  class_id,
  SAFE_CAST((1.0 + (RAND() * 4)) AS NUMERIC) AS grade,
  term_id
FROM
  (SELECT student_id FROM `dbt-learn-360010.school_records.Students`) AS students
CROSS JOIN
  UNNEST(GENERATE_ARRAY(101, 123)) AS class_id
CROSS JOIN
  UNNEST(['2021T1', '2022T1', '2022T2', '2022T3', '2023T1']) AS term_id;
```

# delete_grades.sql
sql
Copy code
-- Delete all data from the Grades table
DELETE FROM `dbt-learn-360010.school_records.Grades`;
```

# update_terms.sql
```sql
-- Update term_id in Terms Table
UPDATE `dbt-learn-360010.school_records.Terms`
SET
  term_id = CASE 
              WHEN term_id = '2021T1' THEN '2022T1'
              WHEN term_id = '2022T1' THEN '2023T1'
              WHEN term_id = '2022T2' THEN '2023T2'
              WHEN term_id = '2022T3' THEN '2023T3'
              WHEN term_id = '2023T1' THEN '2024T1'
              ELSE term_id
            END,
  term_name = CASE 
                WHEN term_name = 'Term 1 2021' THEN 'Term 1 2022'
                WHEN term_name = 'Term 1 2022' THEN 'Term 1 2023'
                WHEN term_name = 'Term 2 2022' THEN 'Term 2 2023'
                WHEN term_name = 'Term 3 2022' THEN 'Term 3 2023'
                WHEN term_name = 'Term 1 2023' THEN 'Term 1 2024'
                ELSE term_name
              END,
  start_date = CASE 
                 WHEN start_date = '2021-01-01' THEN '2022-01-01'
                 WHEN start_date = '2022-01-01' THEN '2023-01-01'
                 WHEN start_date = '2022-05-01' THEN '2023-05-01'
                 WHEN start_date = '2022-09-01' THEN '2023-09-01'
                 WHEN start_date = '2023-01-01' THEN '2024-01-01'
                 ELSE start_date
               END,
  end_date = CASE 
               WHEN end_date = '2021-04-30' THEN '2022-04-30'
               WHEN end_date = '2022-04-30' THEN '2023-04-30'
               WHEN end_date = '2022-08-31' THEN '2023-08-31'
               WHEN end_date = '2022-12-31' THEN '2023-12-31'
               WHEN end_date = '2023-04-30' THEN '2024-04-30'
               ELSE end_date
             END
WHERE 
  term_id IN ('2021T1', '2022T1', '2022T2', '2022T3', '2023T1');
```

# update_grades.sql
```sql
-- Update grade of 2 grade_id in Grades Table
UPDATE `dbt-learn-360010.school_records.Grades`
SET
  grade = CASE 
              WHEN grade = 4 THEN 5
            END
WHERE 
  grade_id IN (2532, 1152);

```

### Running SQL Scripts
To run these scripts in BigQuery, you can use the BigQuery console, the bq command-line tool, or any BigQuery client library. Here’s how to run the scripts using the BigQuery console:

### Open BigQuery Console
Navigate to the BigQuery console in your GCP project.

### Select the Project and Dataset
Ensure you have selected the correct project and dataset where the tables will be created.

### Run the SQL Scripts
Copy the SQL commands from the script files and paste them into the query editor in the BigQuery console. Execute each script in the order provided to create tables, insert data, delete data, and update data as required.

### Conclusion
This project provides a comprehensive set of SQL scripts for managing school records in BigQuery. The scripts cover table creation, data insertion, data deletion, and data updates, enabling efficient management of the dataset. Customize these scripts based on your specific requirements and data schema.

