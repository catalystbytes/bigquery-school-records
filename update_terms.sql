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
