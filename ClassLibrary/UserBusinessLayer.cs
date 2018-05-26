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
    public class UserBusinessLayer
    {
        /*
        public IEnumerable<User> Users
        {
            get
            { 
                string connectionString = ConfigurationManager.ConnectionStrings["UserContext"].ConnectionString;

                List<User> users = new List<User>();

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("spGetAllUsers", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    SqlDataReader rdr = command.ExecuteReader();

                    while (rdr.Read())
                    {
                        User user = new User();
                        user.ID = Convert.ToInt32(rdr["UUserId"]);
                        user.Name = rdr["UUserName"].ToString();
                        user.Gender = rdr["UUserGender"].ToString();
                        user.Email = rdr["UUserEmail"].ToString();
                        user.City = rdr["UUserCity"].ToString();
                        user.DateOfBirth = Convert.ToDateTime(rdr["UDateOfBirth"]);
                        user.SubmitDate = Convert.ToDateTime(rdr["USubmitDate"]);
                        user.TaskGroupId = Convert.ToInt32(rdr["UTaskGroupId"]);
                        users.Add(user);
                    }
                }

                return users;
            }
        }
        */
        public IEnumerable<Task> Tasks
        {
            get
            {
                // get all tasks 
                string connectionString = ConfigurationManager.ConnectionStrings["UserContext"].ConnectionString;

                List<Task> tasks = new List<Task>();

                // get all tasks and add it to the tasks object
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // set sqlcommand 
                    SqlCommand command = new SqlCommand("spGetAllTasks", connection);
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
                        task.TaskDescription = rdr["TDescription"].ToString();
                        task.TaskType = rdr["TType"].ToString();
                        task.TaskStartTime = Convert.ToDateTime(rdr["TStartTime"]);
                        task.TaskEndTime = Convert.ToDateTime(rdr["TEndTime"]);
                        task.TaskEnterDate = Convert.ToDateTime(rdr["TEnterDate"]);
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
