-- Insert data into Students Table
INSERT INTO `dbt-learn-360010.school_records.Students` 
(student_id, first_name, last_name, phone, email, gender, enrollment_date, status)
VALUES
  (1, 'John', 'Doe', '555-1234', 'john.doe@example.com', 'Male', '2021-09-01', 'Active'),
  (2, 'Jane', 'Smith', '555-5678', 'jane.smith@example.com', 'Female', '2021-09-01', 'Active'),
  (50, 'Chris', 'Johnson', '555-9876', 'chris.johnson@example.com', 'Non-binary', '2021-09-01', 'Active');
