-- Question 2: What is the name and phone number of the organizer for each event?

SELECT E.EVENT_NAME, 
       O.ORG_NAME, 
       O.ORG_PHONE_NUM 
FROM EVENT E 
JOIN ORGANIZER O 
    ON E.ORG_ID = O.ORG_ID;
