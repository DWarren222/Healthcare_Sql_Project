-- Assess the risk levels of patients

WITH patient_risk_category AS (
    SELECT 
        patient_id,
        CASE 
            WHEN smoker_status = 'Y' AND diagnosis IN ('Hypertension', 'Diabetes') THEN 'High Risk'
            WHEN smoker_status = 'N' AND diagnosis IN ('Hypertension', 'Diabetes') THEN 'Medium Risk'
            ELSE 'Low Risk' 
        END AS Risk_Category
    FROM 
        outpatient_visits 
)
SELECT 
    Risk_Category, 
    COUNT(*) AS patient_count
FROM 
    patient_risk_category
GROUP BY 
    Risk_Category
ORDER BY
    Risk_Category;

/*

This query assesses the risk levels of patients based on their smoking status and diagnosis. 
It categorizes patients into 'High Risk', 'Medium Risk', and 'Low Risk' groups. 
The results are grouped by risk category and ordered accordingly.

*/ 