/*******************************
Author: Logan Boyd
Date: 01/01/2014

Description: Dynamically drop any Default Constraints on a given Table and Column
	Plug in your Table and Column names below
********************************/

DECLARE	@SQL NVARCHAR(2000)
WHILE 1 = 1
	BEGIN
		SELECT TOP 1
				@SQL = N'ALTER TABLE TableName DROP CONSTRAINT [' + DF.name + N']'
		FROM	sys.default_constraints DF
		JOIN	sys.columns C
				ON C.default_object_id = DF.object_id
		WHERE	DF.parent_object_id = OBJECT_ID(N'TableName')
				AND C.name = N'ColumnName';

		IF @@ROWCOUNT = 0
			BREAK;

		EXEC (@SQL);
	END