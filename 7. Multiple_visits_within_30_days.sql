-- Which patients had multiple outpatient visits within 30 days of their previous visit? 


SELECT 
    v1.patient_id, 
    v1.visit_date AS initial_visit, 
    v1.reason_for_visit AS reason_for_initial_visit,
    v2.visit_date AS readmission_date, 
    v2.reason_for_visit AS reason_for_readmission,
    (v2.visit_date - v1.visit_date) AS days_between_initial_and_readmission
FROM 
    outpatient_visits AS v1
INNER JOIN 
    outpatient_visits AS v2 ON v1.patient_id = v2.patient_id
WHERE 
    (v2.visit_date - v1.visit_date) <= 30
    AND v2.visit_date > v1.visit_date;

/* 

This query identifies patients who had multiple outpatient visits within 30 days of their previous visit. 
   It joins the outpatient_visits table with itself to find instances where the difference between two visit dates 
   for the same patient is 30 days or less. The results include the initial visit date, reason for the initial visit, 
   readmission date, reason for the readmission, and the number of days between the two visits. 

*/ 