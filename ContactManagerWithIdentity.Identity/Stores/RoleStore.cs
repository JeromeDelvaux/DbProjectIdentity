using ContactManagerWithIdentity.Model.Global.Entities;
using ContactManagerWithIdentity.Model.Repository;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ContactManagerWithIdentity.Identity.Stores
{
    public class RoleStore : IRoleStore<Roles>
    {
        private IRoleRepository<Roles> _roleRepository;

        public RoleStore(IRoleRepository<Roles> siteRoleRepository)
        {
            _roleRepository = siteRoleRepository;
        }
        public Task<IdentityResult> CreateAsync(Roles role, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();
            return Task.FromResult(_roleRepository.Create(role));
        }

        public Task<IdentityResult> DeleteAsync(Roles role, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public Task<Roles> FindByIdAsync(string roleId, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<Roles> FindByNameAsync(string normalizedRoleName, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();
            return Task.FromResult(_roleRepository.FindByName(normalizedRoleName));
        }

        public Task<string> GetNormalizedRoleNameAsync(Roles role, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<string> GetRoleIdAsync(Roles role, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<string> GetRoleNameAsync(Roles role, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task SetNormalizedRoleNameAsync(Roles role, string normalizedName, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task SetRoleNameAsync(Roles role, string roleName, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<IdentityResult> UpdateAsync(Roles role, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }
    }
}

