/*

Data Cleaning steps

1. Remove unnecessary columns by only selcting the ones we need
2. Extract the Youtube channel names from the first column
3. Renames the headers

*/

-- 1
SELECT
	NOMBRE,
	total_subscribers,
	total_views,
	total_videos
FROM 
	top_uk_youtubers_2024;

-- 2. 
-- CHARINDEX function : find the starting position of one string inside another
SELECT 
	CHARINDEX('@',NOMBRE),
	NOMBRE
FROM
	top_uk_youtubers_2024;

-- SUBSTRING : 1st arg target column, 2nd the start of the string we want to extract from, the 3rd is the ending position
-- We need to confirm  that the column only takes strings with cast
-- We create a sql view so that we only show the data we want powerbi users to see

CREATE VIEW view_uk_youtubers_2024 AS

SELECT 
	CAST(SUBSTRING(NOMBRE,1,CHARINDEX('@',NOMBRE)-1) AS VARCHAR(100)) AS channel_name,
	total_subscribers,
	total_videos,
	total_views
FROM
	top_uk_youtubers_2024

