-- Update grade of 2 grade_id in Grades Table
UPDATE `dbt-learn-360010.school_records.Grades`
SET
  grade = CASE 
    WHEN grade is not null THEN 5
    WHEN grade is null THEN 5
    ELSE grade
  END
WHERE 
  grade_id IN (2532, 1152);
