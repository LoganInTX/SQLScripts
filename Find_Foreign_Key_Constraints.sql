/*******************************
Author: Logan Boyd
Date: 01/01/2014

Description: Find any Foreign Key Constraints that reference a particular Table and Column
********************************/

SELECT	*
FROM	sys.foreign_keys FK
INNER JOIN sys.foreign_key_columns FKC
		ON FKC.constraint_object_id = FK.object_id
INNER JOIN sys.columns CRef
		ON FKC.referenced_object_id = CRef.object_id
			AND FKC.referenced_column_id = CRef.column_id
INNER JOIN sys.objects RO
		ON RO.object_id = FK.referenced_object_id
WHERE	SCHEMA_NAME(RO.schema_id) = N'dbo'
		AND OBJECT_NAME(RO.object_id) = N'TableName'
		AND CRef.name = N'ColumnName'