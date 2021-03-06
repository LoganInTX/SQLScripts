/*******************************
Author: Logan Boyd
Date: 01/01/2014

Description: Dynamically drop any Foreign Key constraints on a given Table and Column.
	Plug in your Table and Column names below
********************************/

DECLARE	@SQL NVARCHAR(2000)
WHILE 1 = 1
	BEGIN
		SELECT TOP 1
				@SQL = N'ALTER TABLE [' + SCHEMA_NAME(PO.schema_id) + N'.' + OBJECT_NAME(PO.object_id) + N'] DROP CONSTRAINT [' + FK.name + N']'
		FROM	sys.foreign_keys FK
		INNER JOIN sys.foreign_key_columns FKC
				ON FKC.constraint_object_id = FK.object_id
		INNER JOIN sys.columns CPa
				ON FKC.parent_object_id = CPA.object_id
					AND fkc.parent_column_id = CPa.column_id
		INNER JOIN sys.columns CRef
				ON FKC.referenced_object_id = CRef.object_id
					AND FKC.referenced_column_id = CRef.column_id
		INNER JOIN sys.objects PO
				ON PO.object_id = FK.parent_object_id
		INNER JOIN sys.objects RO
				ON RO.object_id = FK.referenced_object_id
		WHERE	SCHEMA_NAME(RO.schema_id) = N'SchemaName'
				AND OBJECT_NAME(RO.object_id) = N'TableName'
				AND CRef.name = N'ColumnName';
		IF @@ROWCOUNT = 0
			BREAK
		EXEC (@SQL)

	END