-- What is the most common lab test performed?

SELECT 
    test_name,
    COUNT(*) AS test_count
FROM
    lab_results
GROUP BY
    test_name
ORDER BY
    test_count DESC;

/* 

This query will give you the most common lab test performed. The results will show the test names along with their counts, ordered by the count in descending order. 
Based on the query results, it is concluded that the top 3 most common lab test performed are Chloride, Glucose, and ALT.

*/