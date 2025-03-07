*************************************
-- Analyzing Students Mental Health --
**************************************

---------------
-- Query SQL --
---------------

/* View a sample of the data */
SELECT * 
FROM students
LIMIT 5

/* Calculating customer concentrations for each state with the amount of revenue generated */
SELECT s.stay, 
	COUNT(*) count_int,
	ROUND(AVG(s.todep), 2) average_phq,
	ROUND(AVG(s.tosc), 2) average_scs,
	ROUND(AVG(s.toas), 2) average_as
FROM students s
WHERE s.inter_dom = 'Inter'
GROUP BY s.stay
ORDER BY stay DESC
