using ConnectionTools.DataBase;
using ContactManagerWithIdentity.Model.Global.Entities;
using ContactManagerWithIdentity.Model.Global.Mappers;
using ContactManagerWithIdentity.Model.Repository;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ContactManagerWithIdentity.Model.Global.Services
{
    public class UtilisateurService : IUserRepository<Utilisateurs>
    {
        private IConnection _connection;
        public UtilisateurService(IConnection connection)
        {
            _connection = connection;
        }

        public IdentityResult CreateUser(Utilisateurs user)
        {
            Commands command = new Commands("Identity_InsertUser", true);
            command.AddParameter("@Lastname", user.LastName);
            command.AddParameter("@FirstName", user.FirstName);
            command.AddParameter("@Email", user.Email);
            command.AddParameter("@Passwd", user.Passwd);
            command.AddParameter("@Genre", user.Genre);

            _connection.ExecuteNonQuery(command);

            return IdentityResult.Success;
        }
        public Utilisateurs FindByEmail(string normalizedEmail)
        {
            Commands command = new Commands("identity_FindByEmail", true);
            command.AddParameter("@Email", normalizedEmail);
            return _connection.ExecuteReader(command, sp => sp.ToUtilisateur()).SingleOrDefault();
        }

        public Utilisateurs FindById(string userId)
        {
            Commands command = new Commands("identity_FindById", true);
            command.AddParameter("@Id", Convert.ToInt32(userId));
            return _connection.ExecuteReader(command, sp => sp.ToUtilisateur()).SingleOrDefault();
        }

        public IQueryable<Utilisateurs> GetUserList()
        {
            Commands command = new Commands("GetAllUsers", true);
            return (IQueryable<Utilisateurs>)_connection.ExecuteReader(command, sp => sp.ToUtilisateur());
        }
    }
}
