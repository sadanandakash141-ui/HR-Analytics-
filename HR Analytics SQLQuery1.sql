#1.Average Attrition rate for all Departments
SELECT * 
FROM [HR analytics].[dbo].[HR_1 (1)];
SELECT * 
FROM [HR analytics].[dbo].[HR_1 (1)] h1
INNER JOIN [HR analytics].[dbo].[HR_2 (1)] h2
     ON CAST(h1.EmployeeNumber AS BIGINT) = CAST(h2.Employee_ID AS BIGINT);

SELECT 
    Department,
    AVG(CAST(Attrition AS FLOAT)) * 100 AS Attrition_Rate
FROM [HR analytics].[dbo].[HR_1 (1)] h1
INNER JOIN [HR analytics].[dbo].[HR_2 (1)] h2
     ON CAST(h1.EmployeeNumber AS BIGINT) = CAST(h2.Employee_ID AS BIGINT)
GROUP BY Department;

#2) Average Hourly rate of Male Research Scientist
SELECT 
    AVG(HourlyRate) AS Avg_Hourly_Rate
FROM [HR analytics].[dbo].[HR_1 (1)]
WHERE Gender = 'Male'
AND JobRole = 'Research Scientist';

#3)Attrition rate Vs Monthly income stats
SELECT 
    CASE 
        WHEN MonthlyIncome <= 10000 THEN 'Low'
        WHEN MonthlyIncome <= 20000 THEN 'Lower mid'
        WHEN MonthlyIncome <= 30000 THEN 'Mid'
        WHEN MonthlyIncome <= 40000 THEN 'Upper mid'
        ELSE 'High'
    END AS Income_Band,
       COUNT(h1.EmployeeNumber) AS Employee_Count,

 AVG(CAST(Attrition AS FLOAT)) * 100 AS Attrition_Rate
FROM [HR analytics].[dbo].[HR_1 (1)] h1
INNER JOIN [HR analytics].[dbo].[HR_2 (1)] h2
     ON CAST(h1.EmployeeNumber AS BIGINT) = CAST(h2.Employee_ID AS BIGINT)


GROUP BY 
    CASE 
        WHEN MonthlyIncome <= 10000 THEN 'Low'
        WHEN MonthlyIncome <= 20000 THEN 'Lower mid'
        WHEN MonthlyIncome <= 30000 THEN 'Mid'
        WHEN MonthlyIncome <= 40000 THEN 'Upper mid'
        ELSE 'High'
    END

ORDER BY Income_Band;


#4) Average working years for each Department
SELECT 
    Department,
    AVG(CAST(TotalWorkingYears AS FLOAT)) AS Avg_Working_Years
FROM [HR analytics].[dbo].[HR_1 (1)] h1
INNER JOIN [HR analytics].[dbo].[HR_2 (1)] h2
     ON CAST(h1.EmployeeNumber AS BIGINT) = CAST(h2.Employee_ID AS BIGINT)
GROUP BY Department;

#5) Job Role Vs Work life balance
SELECT
    JobRole,
    CASE
        WHEN WorkLifeBalance = 1 THEN 'Poor'
        WHEN WorkLifeBalance  = 2 THEN 'Average'
        WHEN WorkLifeBalance  = 3 THEN 'Good'
        ELSE 'Excellent'
    END AS worklifebalance_band,    
    COUNT(*) AS Employee_Count
    FROM [HR analytics].[dbo].[HR_1 (1)] h1
INNER JOIN [HR analytics].[dbo].[HR_2 (1)] h2
     ON CAST(h1.EmployeeNumber AS BIGINT) = CAST(h2.Employee_ID AS BIGINT)
GROUP BY
    JobRole,
    CASE
        WHEN WorkLifeBalance = 1 THEN 'Poor'
        WHEN WorkLifeBalance  = 2 THEN 'Average'
        WHEN WorkLifeBalance  = 3 THEN 'Good'
        ELSE 'Excellent'
    END
ORDER BY JobRole,worklifebalance_band;
    
#6)Attrition rate Vs Year since last promotion relation
SELECT 
    CASE 
        WHEN YearsSinceLastPromotion <= 5 THEN 'Recently Promoted'
        WHEN YearsSinceLastPromotion <= 10 THEN 'Moderate Gap'
        WHEN YearsSinceLastPromotion <= 20 THEN 'Long gap'
        ELSE 'Very Long Gap'
        
    END AS Promotion_Gap_Band,

    COUNT(*) AS Employee_Count,

    AVG(CAST(Attrition AS FLOAT)) * 100 AS Attrition_Rate

FROM [HR analytics].[dbo].[HR_1 (1)] h1
INNER JOIN [HR analytics].[dbo].[HR_2 (1)] h2
     ON CAST(h1.EmployeeNumber AS BIGINT) = CAST(h2.Employee_ID AS BIGINT)

GROUP BY 
    CASE 
        WHEN YearsSinceLastPromotion <= 5 THEN 'Recently Promoted'
        WHEN YearsSinceLastPromotion <= 10 THEN 'Moderate Gap'
        WHEN YearsSinceLastPromotion <= 20 THEN 'Long gap'
        ELSE 'Very Long Gap'
    END

ORDER BY Promotion_Gap_Band;