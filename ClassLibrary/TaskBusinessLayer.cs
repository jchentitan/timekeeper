using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using BusinessLayer;

namespace BusinessLayer
{
    public class TaskBusinessLayer
    {
        public IEnumerable<Task> Tasks
        {
            get
            {
                // get connection string
                string connectionString = ConfigurationManager.ConnectionStrings["UserContext"].ConnectionString;
                
                // create instance with main data variable type
                List<Task> tasks = new List<Task>();

                // connect to the database with established connection instance
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // set command 
                    SqlCommand cmd = new SqlCommand("spGetAllTasks", connection);

                    // set command type
                    cmd.CommandType = CommandType.StoredProcedure;

                    // open connection
                    connection.Open();

                    // create query variable
                    SqlDataReader rdr = cmd.ExecuteReader();

                    // read query result
                    // define local variable with query result
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

                    // add task to wrapper task variable
                    
                    // return sum data variable
                }

                return tasks;
            }
        }
    }
}
