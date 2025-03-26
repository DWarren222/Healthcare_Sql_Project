-- Identify patients with fasting blood sugar levels outside the normal range (70-100 mg/dL)

SELECT 
    p.patient_id,
    p.patient_name,
    l.test_date,
    l.test_name,
    l.result_value
FROM 
    patient_table AS p
INNER JOIN 
    outpatient_visits AS v ON p.patient_id = v.patient_id
INNER JOIN 
    lab_results AS l ON v.visit_id = l.visit_id
WHERE 
    l.test_name = 'Fasting Blood Sugar'
    AND (l.result_value < 70 OR l.result_value > 100)
ORDER BY 
    p.patient_id, l.test_date;

/* 

This query retrieves patients with fasting blood sugar levels outside the normal range (70-100 mg/dL). 
   It joins the patient_table, outpatient_visits, and lab_results tables to get the necessary information. 
   The results are ordered by patient_id and test_date. 
   
*/
    