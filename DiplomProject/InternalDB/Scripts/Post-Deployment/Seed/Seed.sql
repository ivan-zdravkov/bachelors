-- REQUIRES: none
:r .\IdentityTables\CreateIndexes.sql
:r .\IdentityTables\AspNetRoles.sql
----------------------------------------------

-- REQUIRES dbo.AspNetRoles
:r .\IdentityTables\AspNetUsers.sql
----------------------------------------------

-- REQUIRES dbo.AspNetRoles, dbo.AspNetUsers
:r .\IdentityTables\AspNetUserRoles.sql
----------------------------------------------

