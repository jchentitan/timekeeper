Timesheet is under construction up to this initial commit

What's done:
1. TimesheetController accessible at  /Timesheet/Weekly?id=1
2. Trying to figure out a way for TimesheetController action "SaveData"; User experience is upon landing at localhost:####/Timesheet/Weekly?id=1 Click on ~Save to store user input into the database.  Now, there are projects/tasks that vary depending on user "id". 
3. The View of the timesheet controller is created with jQuery.  User experience is filling in each form input or in this case number of hours per week and per user.  See project TimesheetClientSide.
4. Database related snippets can be found within the "bin" folder file name db.sql.  Assuming that users already have SQL Server installed.  Just update the datasource and authentication information and it should work.
5. This application was written using FormCollection to accept post information.  I was not able to get a clean read of data passed within the formcollection object.  Another words, in need of a mechanism to read variable number of inputs. 

* It is recommended to design and implement your own algorithms.  As alternative, feel free to read through the comments within the controllers.

JChentitan
