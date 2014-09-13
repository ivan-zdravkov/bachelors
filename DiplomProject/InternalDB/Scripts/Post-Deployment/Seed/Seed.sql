-- REQUIRES: none
:r .\IdentityTables\CreateIndexes.sql
:r .\IdentityTables\AspNetRoles.sql
:r .\SubscriptionPlan.sql
:r .\ProductType.sql
:r .\Contact.sql
:r .\Address.sql
----------------------------------------------

-- REQUIRES dbo.ProductType
:r .\Product.sql

-- REQUIRES dbo.SubscriptionPlan, dbo.Contact, dbo.Address
:r .\PersonalDetails.sql
----------------------------------------------

-- REQUIRES dbo.AspNetRoles, dbo.PersonalDetails
:r .\IdentityTables\AspNetUsers.sql
----------------------------------------------

-- REQUIRES dbo.AspNetRoles, dbo.AspNetUsers
:r .\IdentityTables\AspNetUserRoles.sql
----------------------------------------------

-- REQUIRES dbo.Contact, dbo.Address, dbo.AspNetUsers
:r .\Facility.sql
----------------------------------------------



