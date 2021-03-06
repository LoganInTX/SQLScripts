/*******************************
Author: Logan Boyd
Date: 01/01/2014

Description: Check to see if a Security Principal exists before modifying an object's permission
********************************/

IF EXISTS (SELECT * FROM sys.database_principals WHERE  name = N'{PrincipalName}')
BEGIN
	GRANT SELECT ON OBJECT TO PrincipalName;
	DENY SELECT ON OBJECT TO PrincipalName;
END
	