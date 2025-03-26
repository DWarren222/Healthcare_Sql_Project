-- What is the demographic profile of the patient population?

WITH demographic AS (
    SELECT 
        patient_id, 
        gender,
        CASE 
            WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth)) < 18 THEN 'Pediatric'
            WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth)) BETWEEN 18 AND 64 THEN 'Adult'
            ELSE 'Senior' 
        END AS age_group
    FROM 
        patient_table  
SELECT 
    gender, 
    age_group, 
    COUNT(*) AS patient_count
FROM 
    demographic
GROUP BY 
    gender, 
    age_group;

/*This SQL query retrieves the count of patients grouped by their gender and age group (Pediatric, Adult, Senior). 
It uses a Common Table Expression (CTE) to first create a demographic profile of patients based on their date of birth
and then aggregates the results to provide the final count. */