/*******************************
Author: Logan Boyd
Date: 01/01/2014

Description: Check to see if a Table esists
********************************/

IF EXISTS ( SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.TableName', N'U') )
BEGIN
	
END