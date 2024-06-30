/*
# Data quality tests

1. The data need to be 100 records of Youtube channels (row count test)
2. The data needs 4 fiels (column count test)
3. The chanel name column must be string format and the the other columns must be numerical data types (data type check)
4. Each record must be unique in the dataset (duplicate count check)


Row count - 100
columns count - 4

Data Types 

channel_name = VARCHAR
total_susbcribers, total_views, total_videos = INT

Duplicate count - 0

*/
-- 1. Row count check  ok

SELECT 
	COUNT(*) as no_of_rows
FROM 
	view_uk_youtubers_2024

-- 2. Column count check OK

SELECT 
	COUNT(*) as no_of_columns
FROM
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_uk_youtubers_2024'

-- 3. Data type check OK

SELECT 
	COLUMN_NAME,
	DATA_TYPE
FROM
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_uk_youtubers_2024'

-- 4. Duplicates count check OK

SELECT 
	channel_name,
	COUNT (*) AS duplicate_count
FROM 
	view_uk_youtubers_2024
GROUP BY 
	channel_name
HAVING 
	COUNT (*) > 1