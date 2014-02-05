/*******************************
Author: Logan Boyd
Date: 01/01/2014

Description: Check to see if an Index exists
********************************/

IF EXISTS ( SELECT * FROM sys.indexes WHERE name = 'IndexName' AND object_id = OBJECT_ID(N'TableName') )
BEGIN
	
END