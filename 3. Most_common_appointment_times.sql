-- What are the most common appointment times and how do they vary by hour?

SELECT 
    EXTRACT(HOUR FROM appointment_time) AS appointment_hour,
    COUNT(*) AS appointment_count
FROM 
    appointment_data  
GROUP BY 
    EXTRACT(HOUR FROM appointment_time)
ORDER BY 
    appointment_count DESC;

/* 

This query will give you the most common appointment times by hour. Since time columns are without time zones, EXTRACT will work correctly. 
The results show that there is a higher number of appointments during 9 AM to 12 PM with 12 PM being the most common appointment time and 8 am being the 
least common appointment time.  

 */