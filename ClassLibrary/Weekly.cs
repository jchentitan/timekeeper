using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    // Weeks 1 ~ 52.  One task to many weeks

    // weekly id, IsActive, taskend time, commited edited UserId
    public class Weekly
    {
        // Get current WeekId from active user and IsLoggedIn

        // Get weekly num weekly id locally compare with task end time

        // Get workday id and IsActive
        
        public int CurrentWeekId { get; set; }
        public double Sunday { get; set; }
        public double Monday { get; set; }
        public double Tuesday { get; set; }
        public double Wednesday { get; set; }
        public double Thursday { get; set; }
        public double Friday { get; set; }
        public double Saturday { get; set; }
        public int TaskId { get; set; }
    }
}
