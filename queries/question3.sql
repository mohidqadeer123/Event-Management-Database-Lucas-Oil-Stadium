-- Question 3: Which events have generated ticket revenue from sold tickets 
-- that is higher than the average sold-ticket revenue across all events?

SELECT  
    e.EVENT_ID, 
    e.EVENT_NAME, 
    SUM(t.TICKET_PRICE) AS sold_ticket_revenue
FROM EVENT e 
JOIN TICKET t 
    ON e.EVENT_ID = t.EVENT_ID
WHERE t.TICKET_STATUS = 'Sold'
GROUP BY e.EVENT_ID, e.EVENT_NAME
HAVING SUM(t.TICKET_PRICE) > 
       (
           SELECT AVG(event_revenue)
           FROM (
               SELECT SUM(TICKET_PRICE) AS event_revenue
               FROM TICKET
               WHERE TICKET_STATUS = 'Sold'
               GROUP BY EVENT_ID
           ) AS sold_revenue_per_event
       );
