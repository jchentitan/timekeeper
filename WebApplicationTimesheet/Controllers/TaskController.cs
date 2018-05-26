using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLayer;

namespace WebApplicationTimesheet.Controllers
{
    public class TaskController : Controller
    {
        // GET: Task
        public ActionResult Index()
        {
            // prepare for data connection
            
            // get data and use search function to get data

            // add data and add it to the List<Task> task

            // send task to view to be displayed`

            TaskBusinessLayer taskBusinessLayer = new TaskBusinessLayer();
            IEnumerable<Task> tasks = taskBusinessLayer.Tasks.ToList();

            return View(tasks);
        }
    }
}