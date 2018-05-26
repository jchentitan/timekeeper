using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using WebApplicationTimesheet;
using System.Data;
using System.Data.SqlClient;

namespace WebApplicationTimesheet.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        public ActionResult Index()
        {
            return View();
        }

        /*
        public ActionResult CreateEmployee()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["EmployeeContext"].ConnectionString;

            List<Employee> employees = new List<Employee>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("spAddEmployee", connection);
                
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
            return View();
        }
        */
    }
}