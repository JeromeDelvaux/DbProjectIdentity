using ConnectionTools.DataBase;
using ContactManagerWithIdentity.Model.Global.Entities;
using ContactManagerWithIdentity.Model.Global.Mappers;
using ContactManagerWithIdentity.Model.Repository;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ContactManagerWithIdentity.Model.Global.Services
{
    public class RoleServices : IRoleRepository<Roles>
    {
        private IConnection _connection;
        public RoleServices(IConnection connection)
        {
            _connection = connection;
        }
        public IdentityResult Create(Roles role)
        {
            Commands command = new Commands("identity_InsertRole", true);
            command.AddParameter("@Name ", role.Name);
            command.AddParameter("@Description ", role.Description);
            command.AddParameter("@Created", role.Created);

            _connection.ExecuteNonQuery(command);

            return IdentityResult.Success;
        }

        public IdentityResult Delete(Roles role)
        {
            throw new NotImplementedException();
        }

        public Roles FindById(string roleId)
        {
            throw new NotImplementedException();
        }

        public Roles FindByName(string normalizedRoleName)
        {
            Commands command = new Commands("identity_FindRoleByName", true);
            command.AddParameter("@NormalizedRoleName", normalizedRoleName);
 
            return _connection.ExecuteReader(command, sp => sp.ToRole()).SingleOrDefault();
        }

        public IdentityResult Update(Roles role)
        {
            throw new NotImplementedException();
        }
    }
}
