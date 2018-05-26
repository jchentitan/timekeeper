using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using BusinessLayer;
using ClassLibrary;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace WebApplicationTimesheet.Controllers
{
    public class TimesheetController : Controller
    {
        // GET: Timesheet
        public ActionResult Index()
        {
            // Login and enter timesheet for user

            // Show current week list all task for current user
            return View();
        }

        public ActionResult List(int UserId)
        {
            // Check isLoggedIn && Login if not && access control layer

            // Show all active tasks assigned to current user in weekly view

            // get and set User and Task Object 
            UserBusinessLayer userBusinessLayer = new UserBusinessLayer();
            // check user login status 

            // get user information

            // get current time week
            
            // get week day per category information

            // create, update and delete tasks

            // create with unassign, assigned, start, finish date, IsActive

            // update task

            // delete task deletes all related weekly data and delete assigned user of all tasks

            // populate tasks object
            List<Task> tasks = userBusinessLayer.Tasks.Where(emp => emp.UUserId == UserId).ToList();
            // return tasks for display by inputted user
            return View(tasks);
        }

        public ActionResult Weekly(int id, DateTime? week, FormCollection formCollection)
        {
            //int UserId = 1;
            //match date and get data from database of week
           

            TaskBusinessLayer taskBusinessLayer = new TaskBusinessLayer();
            // Need to check isLoggedIn against UserId && active session in next phase
            List<Task> tasks = taskBusinessLayer.Tasks.Where(emp => emp.UUserId == id).ToList();

            DateTimeFormatInfo dfi = DateTimeFormatInfo.CurrentInfo;
            //DateTime date1 = new DateTime(2011, 1, 1);
            Calendar calendar = dfi.Calendar;
            //Console.WriteLine(calendar.ToString().Substring(calendar.ToString().LastIndexOf(".") + 1));

            string weekof = calendar.ToString().Substring(calendar.ToString().LastIndexOf(".") + 1);

            // create weekly object storing hours of any Sunday to Saturday

            // inside of weekly object sun-sat float hours
            DateTime currentOfWeek = DateTime.Today.AddDays(-1 * (int)(DateTime.Today.DayOfWeek));
            // create next week and previous week functionality
            DateTime nextOfWeek = currentOfWeek.AddDays(7);
            // previous week defintion
            DateTime previousOfWeek = currentOfWeek.Subtract(TimeSpan.FromDays(7));
            // next week definition
            return View();
        }

        public ActionResult Next()
        {
            DateTime currentOfWeek = DateTime.Today.AddDays(-1 * (int)(DateTime.Today.DayOfWeek));
            DateTime nextOfWeek = currentOfWeek.AddDays(7);
            return View();
        }

        public ActionResult Previous()
        {
            DateTime currentOfWeek = DateTime.Today.AddDays(-1 * (int)(DateTime.Today.DayOfWeek));
            DateTime previousOfWeek = currentOfWeek.Subtract(TimeSpan.FromDays(7));

            return View();
        }

        [HttpPost]
        public ActionResult SaveData(FormCollection formCollection)
        {
            // Get data from form collection

            // Establish database connectivity
            //TaskBusinessLayer taskBusinessLayer = new TaskBusinessLayer();

            string connectionString = ConfigurationManager.ConnectionStrings["UserContext"].ConnectionString;

            //List<Employee> employees = new List<Employee>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Get data from form collection 
                FormCollection fc = formCollection;
                // Check date and store into correct datetime and project name
                SqlCommand command = new SqlCommand("spSaveWeekOfData", connection);

                /*
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "spSaveWeekOfData";
                DbParameter parm = command.CreateParameter();
                */


                // Think of a way to store into the db
                /*
                parm.ParameterName = "@Id";
                parm.Value = "ANATR";
                command.Parameters.Add(parm);
                */

                //connection.Open();
                
                //command.ExecuteNonQuery(); 
            }


            // Store data into database

            // Close conection




            //WeeklyBusinessLayer weeklyBusinessLayer = new WeeklyBusinessLayer();
            //List<Weekly> weekly = weeklyBusinessLayer.Weeks.Where(emp => emp.TaskId == id).ToList();

            // get taskid

            // get taskid == weekly.taskid
            //List<Task> tasks = taskBusinessLayer.Tasks.Where(emp => emp.TaskId == id).ToList();

            /*
            foreach (Task task in tasks)
            {

            }
            */
            return View();
        }
    }
}