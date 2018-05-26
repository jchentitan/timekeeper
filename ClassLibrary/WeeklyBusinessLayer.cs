using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ClassLibrary
{
    public class WeeklyBusinessLayer
    {
        public IEnumerable<Weekly> Weeks
        {
            get
            {
                string connectionString = ConfigurationManager.ConnectionStrings["UserContext"].ConnectionString;

                List<Weekly> weeklys = new List<Weekly>();

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // set sqlcommand 
                    SqlCommand command = new SqlCommand("spGetCurrentWeek", connection);
                    // set configure command type
                    command.CommandType = CommandType.StoredProcedure;
                    // open connection
                    connection.Open();
                    // use data reader
                    SqlDataReader rdr = command.ExecuteReader();

                    while (rdr.Read())
                    {
                        Weekly week = new Weekly();
                        week.CurrentWeekId = Convert.ToInt32(rdr["CurrentWeekId"]);
                        week.Sunday = Convert.ToDouble(rdr["Sunday"]);
                        week.Monday = Convert.ToDouble(rdr["Monday"]);
                        week.Tuesday = Convert.ToDouble(rdr["Tuesday"]);
                        week.Wednesday = Convert.ToDouble(rdr["Wednesday"]);
                        week.Thursday = Convert.ToDouble(rdr["Thursday"]);
                        week.Friday = Convert.ToDouble(rdr["Friday"]);
                        week.Saturday = Convert.ToDouble(rdr["Saturday"]);
                        week.Saturday = Convert.ToInt32(rdr["TaskId"]);
                        weeklys.Add(week);
                    }
                }
                return weeklys;
            }
        }
    }
}
