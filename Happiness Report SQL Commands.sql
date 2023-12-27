--Selecting all the data from the dataset
SELECT * FROM [HappinessReport]..Happiness_report                    

--Selecting the Min and Max Happiness score of countries
--MAX
SELECT TOP 1 Country, hp.[Happiness Score] 
FROM [HappinessReport]..Happiness_report AS hp
ORDER BY 2 DESC 
--MIN
SELECT TOP 1 Country, hp.[Happiness Score] 
FROM [HappinessReport]..Happiness_report AS hp
ORDER BY 2 

--Grouping the data based on Region and Finding the average Happiness Score and Average GDP
SELECT  Region, AVG(hp.[Happiness Score]) AS 'Happiness Score', AVG(hp.[Economy (GDP per Capita)]) AS 'GDP'
FROM [HappinessReport]..Happiness_report AS hp
GROUP BY Region
--MAX
SELECT TOP 1 Region, AVG(hp.[Happiness Score]) AS 'Happiness Score', AVG(hp.[Economy (GDP per Capita)]) AS 'GDP'
FROM [HappinessReport]..Happiness_report AS hp
GROUP BY Region
ORDER BY 2 DESC
--MIN
SELECT TOP 1 Region, AVG(hp.[Happiness Score]) AS 'Happiness Score', AVG(hp.[Economy (GDP per Capita)]) AS 'GDP'
FROM [HappinessReport]..Happiness_report AS hp
GROUP BY Region
ORDER BY 2 




