using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/**********************************************************
 *  Task Object
 *  
 *  Specification to describe a Task object 
 *  
 *  TaskType accepts
 *      Billable
 *      Retainer
 *      Miscellaneous
 *      Legacy
 *      
 *  TaskIsActive
 *      
 *  By James Chen
 * 
 * 
 * 
 * ********************************************************/

namespace BusinessLayer
{
    public class Task
    {
        public int TaskId { get; set; }
        public string TaskName { get; set; }
        public string TaskDescription { get; set; }
        public string TaskType { get; set; }
        public DateTime TaskStartTime { get; set; }
        public DateTime TaskEndTime { get; set; }
        public DateTime TaskEnterDate { get; set; }
        public int UUserId { get; set; }
    }
}
