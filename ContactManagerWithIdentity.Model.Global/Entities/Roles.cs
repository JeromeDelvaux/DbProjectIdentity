using System;
using System.Collections.Generic;
using System.Text;

namespace ContactManagerWithIdentity.Model.Global.Entities
{
     public class Roles
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime Created { get; set; }
    }
}
