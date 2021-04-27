using ConnectionTools.DataBase;
using ContactManagerWithIdentity.Model.Repository;
using System;
using System.Collections.Generic;
using System.Text;

namespace ContactManagerWithIdentity.Model.Global.Services
{
    public class UserRoleService : IUserRoleRepository
    {
        private IConnection _connection;
        public UserRoleService(IConnection connection)
        {
            _connection = connection;
        }
        public bool AddUserToRole(int UserId, int RoleId)
        {
            Commands command = new Commands("identity_AddUserToRole", true);
            command.AddParameter("@UserId", UserId);
            command.AddParameter("@RoleId", RoleId);

            return _connection.ExecuteNonQuery(command)==1;

        }
    }
}
