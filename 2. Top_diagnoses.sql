-- Which diagnosis is most prevalent among patients and how does it vary by age group? 


WITH demographic AS (
    SELECT 
        p.patient_id, 
        p.gender, 
        v.diagnosis,
        CASE 
            WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.date_of_birth)) < 18 THEN 'Pediatric'
            WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.date_of_birth)) BETWEEN 18 AND 64 THEN 'Adult'
            ELSE 'Senior' 
        END AS age_group
    FROM 
        patient_table p 
    INNER JOIN 
        outpatient_visits v 
    ON 
        p.patient_id = v.patient_id
)
SELECT 
    gender, 
    age_group, 
    COALESCE(diagnosis, 'No Diagnosis') AS Diagnosis, 
    COUNT(*) AS patient_count
FROM 
    demographic
GROUP BY 
    gender, 
    age_group, 
    diagnosis
order by gender, age_group, patient_count desc;

/* This query will give you the count of patients for each diagnosis grouped by gender, age group, and diagnosis.
   
    1. It uses a Common Table Expression (CTE) to first create a demographic profile of patients based on their date of birth
    2. It then aggregates the results to provide the final count of patients for each diagnosis.
    3. The COALESCE function is used to handle cases where there is no diagnosis, labeling them as 'No Diagnosis'.
    4. The results are ordered by gender, age group, and patient count in descending order.

The final output will show the count of patients for each diagnosis, categorized. The data shows that the most prevalent diagnosis varies by age group.
The most prevalent diagnosis for adult females Diabetes, while for pediatric female patients it is ear infections. For senior female patients, it is respiratory illness.
For the male demographic, the most prevalent diagnosis is diabetes in adult males, bronchitis in pediatric males and respiratory illness in senior males.

*/ 