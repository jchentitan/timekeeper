using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using BusinessLayer;

namespace BusinessLayer
{
    class EmployeeBusinessLayer
    {
        protected IEnumerable<Employee> Employees
        {
            get
            { 
                string connectionString = ConfigurationManager.ConnectionStrings["EmployeeContext"].ConnectionString;

                List<Employee> employees = new List<Employee>();

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("spGetAllEmployees", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    SqlDataReader rdr = command.ExecuteReader();

                    while (rdr.Read())
                    {
                        Employee employee = new Employee();
                        employee.ID = Convert.ToInt32(rdr["Id"]);
                        employee.Name = rdr["Name"].ToString();
                        employee.Gender = rdr["Gender"].ToString();
                        employee.City = rdr["City"].ToString();
                        employee.DateOfBirth = Convert.ToDateTime(rdr["DateOfBirth"]);
                        employees.Add(employee);
                    }
                }

                return employees;
            }
        }


        protected IEnumerable<Task> Tasks
        {
            get
            {
                // get all tasks 
                string connectionString = ConfigurationManager.ConnectionStrings["EmployeeContext"].ConnectionString;

                List<Task> tasks = new List<Task>();

                // get all tasks and add it to the tasks object
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // set sqlcommand 
                    SqlCommand command = new SqlCommand("spGetTasks", connection);
                    // set configure command type
                    command.CommandType = CommandType.StoredProcedure;
                    // open connection
                    connection.Open();
                    // use data reader
                    SqlDataReader rdr = command.ExecuteReader();

                    while (rdr.Read())
                    {
                        Task task = new Task();
                        task.TaskId = Convert.ToInt32(rdr["TId"]);
                        task.TaskName = rdr["TName"].ToString();
                        task.TaskDescription = rdr["TGender"].ToString();
                        task.TaskType = rdr["TCity"].ToString();
                        task.TaskStartTime = Convert.ToDateTime(rdr["TDateOfBirth"]);
                        task.TaskEndTime = Convert.ToDateTime(rdr["TEndTime"]);
                        task.TaskEnterDate = Convert.ToDateTime(rdr["TEnteredDate"]);
                        //task.IsTaskActive = Convert.ToBoolean(rdr["TIsActive"]);
                        task.UUserId = Convert.ToInt32(rdr["UUserId"]);
                        tasks.Add(task);
                    }

                    // fetch hours

                    // 1 task to many hours

                    // 1 day to many hours

                    // loop through each task and add it to the tasks object
                }

                return tasks;
            }
        }
    }
}
