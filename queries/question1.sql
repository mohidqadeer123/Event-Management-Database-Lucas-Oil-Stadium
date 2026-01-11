-- Question 1: What events are scheduled on December 12, 2025?

SELECT EVENT_ID, 
       EVENT_NAME, 
       EVENT_TYPE, 
       EVENT_DATE 
FROM EVENT 
WHERE DATE(EVENT_DATE) = '2025-12-12';
