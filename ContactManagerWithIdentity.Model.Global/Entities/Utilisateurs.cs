using System;
using System.Collections.Generic;
using System.Text;

namespace ContactManagerWithIdentity.Model.Global.Entities
{
    public class Utilisateurs
    {
        public int Id { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Email { get; set; }
        public bool IsValid { get; set; }
        public bool IsAdmin { get; set; }
        public char Genre { get; set; }
        public string Passwd { get; set; }
        public bool TwoFactorEnabled { get; set; }
        public DateTime CreationDate { get; set; }
    }
}
