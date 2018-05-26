﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationTimesheet.Models
{
    public class Employee
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public string City { get; set; }
        public DateTime DateOfBirth { get; set; }
    }
}