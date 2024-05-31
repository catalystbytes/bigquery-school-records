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

