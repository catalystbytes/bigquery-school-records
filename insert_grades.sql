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
