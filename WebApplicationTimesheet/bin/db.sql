use dbMain
go
Create procedure spGetAllOccasions
as
Begin
	select * from tbl_occasion
End
go;

use dbPe7onalProggy
go
Create procedure spSaveWeekOfData
@TaskId int,
@ImageName nvarchar(120),
@ImagePath nvarchar(100),
@Caption nvarchar(500),
@Time datetime,
@Show int
as
Begin
	insert into tbl_occasion (OccasionId, ImageName, ImagePath, Caption, Time, Show)
	values (@OccasionId, @ImageName, @ImagePath, @Caption, @Time, @Show);
End
go;

-- First instinct
-- Extract all recorded number of hour and sum in db
-- Number of hours on each date per task 
-- Store datetime of each date for underlying task


-- Used to attach recording time per Task over time
use dbPe7onalProggy
go
CREATE TABLE tbl1Hour (    
	Hid int not null Primary Key,
    HHour datetime not null,
	HDateTime datetime not null
);


use dbMain
go
Create procedure spAddOccasion
@OccasionId int,
@ImageName nvarchar(120),
@ImagePath nvarchar(100),
@Caption nvarchar(500),
@Time datetime,
@Show int
as
Begin
	insert into tbl_occasion (OccasionId, ImageName, ImagePath, Caption, Time, Show)
	values (@OccasionId, @ImageName, @ImagePath, @Caption, @Time, @Show);
End
go;

use dbMain
go
Create procedure spAddOccasion
@OccasionId int,
@ImageName nvarchar(120),
@ImagePath nvarchar(100),
@Caption nvarchar(500),
@Time datetime,
@Show int
as
Begin
	insert into tbl_occasion (OccasionId, ImageName, ImagePath, Caption, Time, Show)
	values (@OccasionId, @ImageName, @ImagePath, @Caption, @Time, @Show);
End
go;

exec sp_rename 'tbl1Task.TUserId', 'UUserId', 'column';

use dbPe7onalProggy
go
Select convert (datetime, CURRENT_TIMESTAMP), 
SYSDATETIME(),
GETDATE(),
GETUTCDATE();

use dbPe7onalProggy
go
SELECT DATEDIFF(week, '1982-05-14 09:53:01.0376635', GETDATE() + 1)   

use dbPe7onalProggy
go
Begin
	DECLARE @db datetime
	DECLARE @web datetime
	select GETDATE()
End

-- get three weeks of data and load more upon request
use dbPe7onalProggy
go
Create procedure spGetCurrentWeek
@TId int,
@TToday datetime
as
Begin
	-- first prepared statement
	-- input parameter as datetime against db datetime
	select * from tbl1Task where TId = @Tid && CURRENT_TIMESTAMP = @TToday
End

use dbPe7onalProggy
go
Create procedure spGetAllTasks
as
Begin
	-- first prepared statement
	-- input parameter as datetime against db datetime
	select * from tbl1Task 
End

use dbPe7onalProggy
go
Create procedure spGetPreviousWeek
as
Begin
	-- previous prepared statement
	-- input parameter as datetime type against db datetime
End

use dbPe7onalProggy
go
Create procedure spGetNextWeek
as
Begin
	-- next prepared statement
End


use dbPe7onalProggy
go
create procedure spUpdateUser
@TId int,
@TName nvarchar(75),
@TDescription nvarchar(120),
@TType nvarchar(50),
@TStartTime datetime,
@TEndTime datetime,
@TEnterDate datetime,
@TIsTaskActive binary,
@TUserId int
as
Begin
	UPDATE tbl1Task SET TName = @TName, TType = @TType, TStartTime = @TStartTime, TEndTime = @TEndTime, TEnterDate = @TEnterDate, TIsTaskActive = @TIsTaskActive, TUserId = @TUserId

	Where TId = @Tid
End
-- guessable variable types are good for structure 24x7x365 ::yum:: bad taste

use dbPe7onalProggy
go
CREATE TABLE tbl1Task (    
	TId int not null Primary Key,
    TName nvarchar(75) not null,
    TDescription nvarchar(120) not null,
    TType nvarchar(50) not null,
    TStartTime datetime not null,
    TEndTime datetime not null,
    TEnterDate datetime not null,
    TIsTaskActive binary not null,
    TUserId int not null
);

use dbPe7onalProggy
go
drop table tbl1Task;

use dbPe7onalProggy
go 
CREATE TABLE tbl1User (  
	UUserId int not null Primary Key,
	UUserName nvarchar(100) not null,
	UUserGender nvarchar(20) not null,
	UUserEmail nvarchar(75) not null,
	UUserCity nvarchar(75) not null,
	UDateOfBirth datetime not null,
	USubmitDate datetime not null,
	UTaskGroupId int not null
);

use dbPe7onalProggy
go
Create procedure spGetAllTasks
as
Begin
	select * from tbl1Task
End

use dbPe7onalProggy
go
Create procedure spGetAllUsers
as
Begin
	select * from tbl1User
End

use dbPe7onalProggy
go 
Drop tbl1Task

-- Syntax for SQL Server and Azure SQL Database  

[ WITH <common_table_expression> [...n] ]  
UPDATE   
    [ TOP ( expression ) [ PERCENT ] ]   
    { { table_alias | <object> | rowset_function_limited   
         [ WITH ( <Table_Hint_Limited> [ ...n ] ) ]  
      }  
      | @table_variable      
    }  
    SET  
        { column_name = { expression | DEFAULT | NULL }  
          | { udt_column_name.{ { property_name = expression  
                                | field_name = expression }  
                                | method_name ( argument [ ,...n ] )  
                              }  
          }  
          | column_name { .WRITE ( expression , @Offset , @Length ) }  
          | @variable = expression  
          | @variable = column = expression  
          | column_name { += | -= | *= | /= | %= | &= | ^= | |= } expression  
          | @variable { += | -= | *= | /= | %= | &= | ^= | |= } expression  
          | @variable = column { += | -= | *= | /= | %= | &= | ^= | |= } expression  
        } [ ,...n ]   

    [ <OUTPUT Clause> ]  
    [ FROM{ <table_source> } [ ,...n ] ]   
    [ WHERE { <search_condition>   
            | { [ CURRENT OF   
                  { { [ GLOBAL ] cursor_name }   
                      | cursor_variable_name   
                  }   
                ]  
              }  
            }   
    ]   
    [ OPTION ( <query_hint> [ ,...n ] ) ]  
[ ; ]  

<object> ::=  
{   
    [ server_name . database_name . schema_name .   
    | database_name .[ schema_name ] .   
    | schema_name .  
    ]  
    table_or_view_name}


	-- Syntax for SQL Server and Azure SQL Database  


INSERT   
{  
    [BULK]  
    [ database_name . [ schema_name ] . | schema_name . ]  
    [ table_name | view_name ]  
    ( <column_definition> )  
    [ WITH (  
        [ [ , ] CHECK_CONSTRAINTS ]  
        [ [ , ] FIRE_TRIGGERS ]  
        [ [ , ] KEEP_NULLS ]  
        [ [ , ] KILOBYTES_PER_BATCH = kilobytes_per_batch ]  
        [ [ , ] ROWS_PER_BATCH = rows_per_batch ]  
        [ [ , ] ORDER ( { column [ ASC | DESC ] } [ ,...n ] ) ]  
        [ [ , ] TABLOCK ]  
    ) ]  
}  

[; ] <column_definition> ::=  
 column_name <data_type>  
    [ COLLATE collation_name ]  
    [ NULL | NOT NULL ]  

<data type> ::=   
[ type_schema_name . ] type_name   
    [ ( precision [ , scale ] | max ]  

Copy
-- Syntax for Azure SQL Data Warehouse and Parallel Data Warehouse  

INSERT INTO [ database_name . [ schema_name ] . | schema_name . ] table_name   
    [ ( column_name [ ,...n ] ) ]  
    {   
      VALUES ( { NULL | expression } )  
      | SELECT <select_criteria>  
    }  
    [ OPTION ( <query_option> [ ,...n ] ) ]  
[;]  



-- Syntax for SQL Server and Azure SQL Database  

[ WITH <common_table_expression> [ ,...n ] ]  
DELETE   
    [ TOP ( expression ) [ PERCENT ] ]   
    [ FROM ]   
    { { table_alias  
      | <object>   
      | rowset_function_limited   
      [ WITH ( table_hint_limited [ ...n ] ) ] }   
      | @table_variable  
    }  
    [ <OUTPUT Clause> ]  
    [ FROM table_source [ ,...n ] ]   
    [ WHERE { <search_condition>   
            | { [ CURRENT OF   
                   { { [ GLOBAL ] cursor_name }   
                       | cursor_variable_name   
                   }   
                ]  
              }  
            }   
    ]   
    [ OPTION ( <Query Hint> [ ,...n ] ) ]   
[; ]  

<object> ::=  
{   
    [ server_name.database_name.schema_name.   
      | database_name. [ schema_name ] .   
      | schema_name.  
    ]  
    table_or_view_name   
}  

Copy
-- Syntax for Azure SQL Data Warehouse and Parallel Data Warehouse  

DELETE FROM [database_name . [ schema ] . | schema. ] table_name    
    [ WHERE <search_condition> ]   
    [ OPTION ( <query_options> [ ,...n ]  ) ]  
[; ]  

CREATE TABLE  
    [database_name . [schema_name ] . | schema_name . ] table_name  
    ( { <column_definition>  
    | [ <table_constraint> ] [ ,... n ]  
    | [ <table_index> ]  
      [ ,... n ] }   
      [ PERIOD FOR SYSTEM_TIME ( system_start_time_column_name   
        , system_end_time_column_name ) ]  
)  
    [ WITH ( <table_option> [ ,... n ] ) ]  
 [ ; ]  

<column_definition> ::=  
column_name <data_type>  
    [ COLLATE collation_name ]  
    [ GENERATED ALWAYS AS ROW { START | END } [ HIDDEN ] ]   
    [ NULL | NOT NULL ]  
[  
    [ CONSTRAINT constraint_name ] DEFAULT memory_optimized_constant_expression ]  
    | [ IDENTITY [ ( 1, 1 ) ]  
]  
    [ <column_constraint> ]  
    [ <column_index> ]  

<data type> ::=  
 [type_schema_name . ] type_name [ (precision [ , scale ]) ]  

<column_constraint> ::=  
 [ CONSTRAINT constraint_name ]  
{   
  { PRIMARY KEY | UNIQUE }    
      {   NONCLUSTERED   
        | NONCLUSTERED HASH WITH (BUCKET_COUNT = bucket_count)   
      }   
  | [ FOREIGN KEY ]   
        REFERENCES [ schema_name . ] referenced_table_name [ ( ref_column ) ]   
  | CHECK ( logical_expression )   
}  

< table_constraint > ::=  
 [ CONSTRAINT constraint_name ]  
{    
   { PRIMARY KEY | UNIQUE }  
     {   
       NONCLUSTERED (column [ ASC | DESC ] [ ,... n ])  
       | NONCLUSTERED HASH (column [ ,... n ] ) WITH ( BUCKET_COUNT = bucket_count )   
                    }   
    | FOREIGN KEY   
        ( column [ ,...n ] )   
        REFERENCES referenced_table_name [ ( ref_column [ ,...n ] ) ]   
    | CHECK ( logical_expression )   
}  

<column_index> ::=  
  INDEX index_name  
{ [ NONCLUSTERED ] | [ NONCLUSTERED ] HASH WITH (BUCKET_COUNT = bucket_count)  }  

<table_index> ::=  
  INDEX index_name  
{   [ NONCLUSTERED ] HASH (column [ ,... n ] ) WITH (BUCKET_COUNT = bucket_count)   
  | [ NONCLUSTERED ] (column [ ASC | DESC ] [ ,... n ] )   
      [ ON filegroup_name | default ]  
  | CLUSTERED COLUMNSTORE [WITH ( COMPRESSION_DELAY = {0 | delay [Minutes]})]  
      [ ON filegroup_name | default ]  

}  

<table_option> ::=  
{  
    MEMORY_OPTIMIZED = ON   
  | DURABILITY = {SCHEMA_ONLY | SCHEMA_AND_DATA}  
  | SYSTEM_VERSIONING = ON [ ( HISTORY_TABLE = schema_name . history_table_name  
        [, DATA_CONSISTENCY_CHECK = { ON | OFF } ] ) ]   

}  

create procedure spUpdateEmployee
as
Begin
	UPDATE tblEmployee
	SET  
        Name = @Name     
    WHERE EmployeeId = @EmployeeId;
End

ALTER TABLE table_name
ADD column_name datatype; 

ALTER TABLE tblEmployee   
ADD DateOfBirth Datetime NULL;

ALTER DATABASE dbPersonalProggy 

/***************************************************************/

CREATE TABLE tblEmployee8 (
    EmployeeId int not null Primary Key,
    Name nvarchar(75) not null,
    Gender nvarchar(10) not null,
    City nvarchar(20) not null,
);

INSERT INTO tblEmployee8 (EmployeeId, Name, Gender, City) 
	VALUES (1, 'James', 'Male', 'New York');

INSERT INTO tblEmployee8 (EmployeeId, Name, Gender, City) 
	VALUES (2, 'John', 'Male', 'New York');

INSERT INTO tblEmployee8 (EmployeeId, Name, Gender, City) 
	VALUES (3, 'Hayley', 'Female', 'New York');

INSERT INTO tblEmployee8 (EmployeeId, Name, Gender, City) 
	VALUES (4, 'Roger', 'Male', 'Sydney');

use dbMain
go
select * from tblEmployee8;

drop table tblEmployee8;
/***************************************************************/

/***************************************************************/

CREATE TABLE tblDepartment10 (
    Id int not null Primary Key,
    Name nvarchar(75) not null
);

ALTER TABLE tblDepartment10 (
    ALTER Id DepartmentId int not null
);

ALTER database dbPersonalProggy
Modify Name = dbPe7onalProggy;
go

INSERT INTO tblDepartment10 (Id, Name) 
	VALUES (1, 'IT');

INSERT INTO tblDepartment10(Id, Name) 
	VALUES (2, 'HR');

INSERT INTO tblDepartment10 (Id, Name) 
	VALUES (3, 'Payroll');

CREATE TABLE tblEmployee10 (
    EmployeeId int not null Primary Key,
    Name nvarchar(75) not null,
    Gender nvarchar(10) not null,
    City nvarchar(20) not null,
	DepartmentId int not null
);

INSERT INTO tblEmployee10 (EmployeeId, Name, Gender, City, DepartmentId) 
	VALUES (1, 'James', 'Male', 'New York', 1);

INSERT INTO tblEmployee10 (EmployeeId, Name, Gender, City, DepartmentId) 
	VALUES (2, 'John', 'Male', 'New York', 1);

INSERT INTO tblEmployee10 (EmployeeId, Name, Gender, City, DepartmentId) 
	VALUES (3, 'Hayley', 'Female', 'New York', 1);

INSERT INTO tblEmployee10 (EmployeeId, Name, Gender, City, DepartmentId) 
	VALUES (4, 'Roger', 'Male', 'Sydney', 2);

INSERT INTO tblEmployee10 (EmployeeId, Name, Gender, City, DepartmentId) 
	VALUES (5, 'Steve', 'Male', 'New York', 2);

INSERT INTO tblEmployee10 (EmployeeId, Name, Gender, City, DepartmentId) 
	VALUES (6, 'Claus', 'Male', 'New York', 3);

INSERT INTO tblEmployee10 (EmployeeId, Name, Gender, City, DepartmentId) 
	VALUES (7, 'Sara', 'Female', 'New York', 1);

INSERT INTO tblEmployee10 (EmployeeId, Name, Gender, City, DepartmentId) 
	VALUES (8, 'Christie', 'Female', 'Sydney', 2);

use dbMain
go
select * from tblEmployee10;

use dbMain
go
select * from tblDepartment10;
select * from tblEmployee8;

/***************************************************************/
CREATE TABLE tblProject (
    ProjectId int not null Primary Key,
    ProjectTitle nvarchar(75) not null,
	ProjectOwner nvarchar(75) not null,
    ProjectStartDate Datetime not null,
	ProjectEndDate Datetime not null
);

CREATE TABLE tblAssign (
    AssignId int not null Primary Key,
    AssignWorker nvarchar(75) not null,
    AssignTotalHours decimal(38, 2) not null,
	ProjectId int not null
);

CREATE TABLE tblProcess (
	DateWorked Datetime not null,
	HoursWorked Decimal(38,2) not null,
	ProjectId int not null
);

CREATE TABLE tblWorker
(
	WorkerId int not null Primary Key,
	WorkerName nvarchar(75) not null,
	WorkerGender nvarchar(10) not null,
	WorkerCity nvarchar(20) not null,
	WorkerDepartmentId int not null
);

/***************************************************************/

use dbMyPlayGround
go

CREATE TABLE tblMPGUser (
    UserId int not null Primary Key,
    UserName nvarchar(50) not null,
	UserPassword nvarchar(160) not null,
);

CREATE TABLE tblMPGGallery (
    GalleryId int not null Primary Key,
    GalleryName nvarchar(75) not null,
);

CREATE TABLE tblMPGAlbum (
	AlbumId int not null Primary Key,
	AlbumTitle nvarchar(100) not null,
	AlbumOwner nvarchar(75) not null,
	AlbumIsActive bit not null,
	AlbumGalleryId int not null
);

CREATE TABLE tblMPGPhoto
(
	PhotoId int not null Primary Key,
	PhotoCaption nvarchar(100) not null,
	PhotoOwner nvarchar(75) not null,
	PhotoVirtualDirectory nvarchar(75) not null,
	PhotoLocation nvarchar(75) not null,
	PhotoSubmitDate Datetime not null,
	PhotoIsActive bit not null,
	PhotoAlbumId int not null
);

/************* Timesheet ************************/
Select EmployeeId, EmployeeName, EmployeeGender, EmployeeCity, DateOfBirth, SubmitDate
	from tbl1Employee;

use dbPe7onalProggy
go
Create procedure spGetAllEmployees
as
Begin
    EmployeeId int not null Primary Key,
	EmployeeName nvarchar(100) not null,
	EmployeeGender nvarchar(75) not null,
	EmployeeCity nvarchar(75) not null,
	DateOfBirth	datetime not null,
	SubmitDate datetime not null
End

use dbPe7onalProggy
go
create procedure spUpdateEmployee
as
Begin
	UPDATE tbl1Employee
	SET  
        EmployeeId = @EmployeeId, EmployeeGender, EmployeeCity, DateOfBirth, SubmitDate
End

INSERT INTO tbl1Employee (EmployeeId, EmployeeName, EmployeeGender, EmployeeCity, DateOfBirth, SubmitDate) 
	VALUES (1, 'James', 'Male', 'Mount Vernon', '2018-03-09 00:00:00', '2018-03-09 00:00:00');

INSERT INTO tblEmployee (EmployeeId, Name, Gender, City, DepartmentId) 
	VALUES (2, 'Alan', 'Male', 'New York', 1);

INSERT INTO tblEmployee (EmployeeId, Name, Gender, City, DepartmentId) 
	VALUES (3, 'Roger', 'Male', 'New York', 1);

INSERT INTO tblEmployee (EmployeeId, Name, Gender, City, DepartmentId) 
	VALUES (4, 'Steve', 'Male', 'New York', 1);

INSERT INTO tblEmployee (EmployeeId, Name, Gender, City, DepartmentId) 
	VALUES (5, 'Claus', 'Male', 'New York', 1);

INSERT INTO tblEmployee (EmployeeId, Name, Gender, City, DepartmentId) 
	VALUES (6, 'John', 'Male', 'New York', 2);

INSERT INTO tblEmployee (EmployeeId, Name, Gender, City, DepartmentId) 
	VALUES (7, 'Hayley', 'Female', 'New York', 2);

INSERT INTO tblEmployee (EmployeeId, Name, Gender, City, DepartmentId) 
	VALUES (8, 'Max', 'Male', 'New York', 2);

INSERT INTO tblEmployee (EmployeeId, Name, Gender, City, DepartmentId) 
VALUES (9, 'Lauren', 'Female', 'New York', 3);

INSERT INTO tblEmployee (EmployeeId, Name, Gender, City, DepartmentId) 
VALUES (10, 'Stephanie', 'Female', 'New York', 4);

INSERT INTO tblEmployee (EmployeeId, Name, Gender, City, DepartmentId) 
VALUES (11, 'Christie', 'Female', 'New York', 4);
