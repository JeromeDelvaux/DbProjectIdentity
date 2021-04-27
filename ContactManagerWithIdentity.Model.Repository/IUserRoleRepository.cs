using System;
using System.Collections.Generic;
using System.Text;

namespace ContactManagerWithIdentity.Model.Repository
{
    public interface IUserRoleRepository
    {
        bool AddUserToRole(int UserId, int RoleId);
    }
}
