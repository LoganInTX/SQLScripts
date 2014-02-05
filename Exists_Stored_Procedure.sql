/*******************************
Author: Logan Boyd
Date: 01/01/2014

Description: Check to see if a Stored Procedure exists
********************************/

IF EXISTS ( SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.ProcName') AND type IN ( N'P', N'PC' ) )
BEGIN
	
END