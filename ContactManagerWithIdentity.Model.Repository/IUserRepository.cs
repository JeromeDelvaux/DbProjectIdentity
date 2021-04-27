using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ContactManagerWithIdentity.Model.Repository
{
    public interface IUserRepository<TUtilisateur>
    {
        IdentityResult CreateUser(TUtilisateur user);

        TUtilisateur FindByEmail(string normalizedEmail);

        TUtilisateur FindById(string userId);

        IQueryable<TUtilisateur> GetUserList();

    }
}
