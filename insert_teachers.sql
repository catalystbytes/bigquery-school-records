-- Insert data into Teachers Table
INSERT INTO `dbt-learn-360010.school_records.Teachers` 
(teacher_id, first_name, last_name, phone, email, hire_date, department)
VALUES
  (1, 'Alice', 'Brown', '555-2345', 'alice.brown@example.com', '2020-08-15', 'Mathematics'),
  (2, 'Bob', 'White', '555-6789', 'bob.white@example.com', '2019-07-20', 'Science'),
  (12, 'Eva', 'Green', '555-6543', 'eva.green@example.com', '2021-03-22', 'History');
