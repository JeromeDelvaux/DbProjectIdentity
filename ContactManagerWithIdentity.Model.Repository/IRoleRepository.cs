using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;

namespace ContactManagerWithIdentity.Model.Repository
{
    public interface IRoleRepository<TRole>
    {
        IdentityResult Create(TRole role);
        IdentityResult Delete(TRole role);
        TRole FindById(string roleId);
        TRole FindByName(string normalizedRoleName);
        IdentityResult Update(TRole role);
    }
}
