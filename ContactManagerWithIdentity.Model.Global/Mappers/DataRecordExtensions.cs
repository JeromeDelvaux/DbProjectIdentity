using ContactManagerWithIdentity.Model.Global.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace ContactManagerWithIdentity.Model.Global.Mappers
{
    internal static class DataRecordExtensions
    {
        internal static Utilisateurs ToUtilisateur(this IDataRecord dataRecord)
        {
            return new Utilisateurs()
            {
                Id = (int)dataRecord["Id"],
                LastName = (string)dataRecord["LastName"],
                FirstName = (string)dataRecord["FirstName"],
                Email = (string)dataRecord["Email"],
                Passwd = (string)dataRecord["Passwd"],
                IsValid = (bool)dataRecord["IsValid"],
                IsAdmin = (bool)dataRecord["IsAdmin"],
                Genre = (char)dataRecord["Genre"],
                CreationDate = (DateTime)dataRecord["CreationDate"],
                TwoFactorEnabled = (bool)dataRecord["TwoFactorEnabled"]
            };
        }
        internal static Roles ToRole(this IDataRecord dataRecord)
        {
            return new Roles()
            {
                Id = (int)dataRecord["Id"],
                Name = (string)dataRecord["Name"],
                Description = (string)dataRecord["Description"],
                Created = (DateTime)dataRecord["Created"],
            };
        }
    }
}
