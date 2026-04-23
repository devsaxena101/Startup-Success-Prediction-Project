/*1. Overall Success Rate?*/
SELECT 
    COUNT(*) AStotal_startups,
    SUM(success) AS successful_startups,
	(SUM(success) * 100 / COUNT(*)) AS success_rate
FROM startup;	

/*2. Industry-Wise Success Rate?*/
SELECT 
    industry,
	COUNT(*) AS total,
	SUM(success) AS successful,
	(SUM(success) * 100 / COUNT(*)) AS success_rate
FROM startup
GROUP BY industry
ORDER BY success_rate DESC;

/*3 Average Funding of Successful vs Failed Startups*/
SELECT 
    success,
	AVG(funding) AS avg_funding
FROM startup
GROUP BY success;	

/*4. Location-wise Startup Count & Success Rate*/
SELECT
    location,
	COUNT(*) AS total,
	SUM(success) AS successful,
	(SUM(success) * 100 / COUNT(*)) AS success_rate
FROM startup
GROUP BY location
ORDER BY success_rate DESC;

/*5 Funding VS success*/
SELECT
     CASE
        WHEN funding < 100000 THEN 'Low'
        WHEN funding BETWEEN 100000 AND 1000000 THEN 'Medium'
        ELSE 'High'
     END AS funding_category,
     COUNT(*) AS total,
     (SUM(success) * 100.0 / COUNT(*)) AS success_rate
FROM startup
GROUP BY funding_category;

/*6 Age VS Success Rate*/
SELECT
     age,
     COUNT(*) AS total,
     (SUM(success) * 100.0 / COUNT(*)) AS success_rate
FROM startup
GROUP BY age
ORDER BY age;

/*7 Revenue Impact on Success*/
SELECT
    success,
    AVG(revenue) AS avg_revenue
FROM startup
GROUP BY success;

/*8 Top 10 Startups BY Revenue*/
SELECT
    startup_name,
    revenue
FROM startup
ORDER BY revenue DESC
LIMIT 10;

/*9 Funding Efficiency*/
SELECT startup_name,
funding,
revenue,
(revenue / funding) AS efficiency
FROM startup
WHERE funding > 0
ORDER BY efficiency DESC
LIMIT 5;

/*10. Employees vs Revenue*/
SELECT employees,
AVG(revenue) AS avg_revenue
FROM startup
GROUP BY employees
LIMIT 5;













  