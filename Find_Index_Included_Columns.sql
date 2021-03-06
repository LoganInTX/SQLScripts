/*******************************
Author: Logan Boyd
Date: 01/01/2014

Description: Find all Indexes for a given table to reveal their Total Columns and Total Included Columns counts
********************************/

SELECT	i.name AS IndexName ,
		i.type_desc AS IndexType ,
		i.is_unique AS UniqueIndex ,
		i.is_primary_key AS PK ,
		COUNT(c.column_id) AS AllColumns ,
		COUNT(CASE c.is_included_column
				WHEN 1 THEN 1
				ELSE NULL
				END) AS IncludedColumns
FROM	sys.indexes i
INNER JOIN sys.index_columns c
		ON i.object_id = c.object_id
			AND i.index_id = c.index_id
WHERE	i.object_id = OBJECT_ID('dbo.TABLE')
GROUP BY i.name ,
		i.type_desc ,
		i.is_unique ,
		i.is_primary_key
ORDER BY COUNT(*) DESC