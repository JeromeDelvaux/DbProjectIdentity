using ContactManagerWithIdentity.Model.Global.Entities;
using ContactManagerWithIdentity.Model.Repository;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ContactManagerWithIdentity.Identity.Stores
{
    public class UtilisateurStore : IUserStore<Utilisateurs>,
                                    IUserEmailStore<Utilisateurs>,
                                    IUserPasswordStore<Utilisateurs>,
                                    IUserRoleStore<Utilisateurs>,
                                    IUserLoginStore<Utilisateurs>,
                                    IQueryableUserStore<Utilisateurs>
    {
        private IUserRepository<Utilisateurs> _userRepository { get; set; }

        private IRoleRepository<Roles> _roleRepository { get; set; }

        private IUserRoleRepository _userRoleRepository { get; set; }

        public IQueryable<Utilisateurs> Users => _userRepository.GetUserList();

        public UtilisateurStore(IUserRepository<Utilisateurs> pUserRepository, IRoleRepository<Roles> pRoleRepository, IUserRoleRepository pUserRoleRepository)
        {
            this._userRepository = pUserRepository;
            this._roleRepository = pRoleRepository;
            this._userRoleRepository = pUserRoleRepository;
        }
         
        #region NotImplemented
        public Task<string> GetUserIdAsync(Utilisateurs user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }
        public Task SetEmailAsync(Utilisateurs user, string email, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }
        public Task<string> GetUserNameAsync(Utilisateurs user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task SetUserNameAsync(Utilisateurs user, string userName, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<string> GetNormalizedUserNameAsync(Utilisateurs user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task SetNormalizedUserNameAsync(Utilisateurs user, string normalizedName, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<IdentityResult> UpdateAsync(Utilisateurs user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<IdentityResult> DeleteAsync(Utilisateurs user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public Task<string> GetEmailAsync(Utilisateurs user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<bool> GetEmailConfirmedAsync(Utilisateurs user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task SetEmailConfirmedAsync(Utilisateurs user, bool confirmed, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }
        public Task<string> GetNormalizedEmailAsync(Utilisateurs user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task SetNormalizedEmailAsync(Utilisateurs user, string normalizedEmail, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }
        public Task SetPasswordHashAsync(Utilisateurs user, string passwordHash, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<string> GetPasswordHashAsync(Utilisateurs user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<bool> HasPasswordAsync(Utilisateurs user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task RemoveFromRoleAsync(Utilisateurs user, string roleName, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<IList<string>> GetRolesAsync(Utilisateurs user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<bool> IsInRoleAsync(Utilisateurs user, string roleName, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<IList<Utilisateurs>> GetUsersInRoleAsync(string roleName, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task AddLoginAsync(Utilisateurs user, UserLoginInfo login, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task RemoveLoginAsync(Utilisateurs user, string loginProvider, string providerKey, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<IList<UserLoginInfo>> GetLoginsAsync(Utilisateurs user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<Utilisateurs> FindByLoginAsync(string loginProvider, string providerKey, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }


        #endregion 
        public Task<IdentityResult> CreateAsync(Utilisateurs user, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            return Task.FromResult(_userRepository.CreateUser(user));
        }
        public Task<Utilisateurs> FindByIdAsync(string userId, CancellationToken cancellationToken)
        {
            return Task.FromResult(_userRepository.FindById(userId));
        }
        public Task<Utilisateurs> FindByEmailAsync(string Email, CancellationToken cancellationToken)
        {
            return Task.FromResult(_userRepository.FindByEmail(Email));
        }
        public Task AddToRoleAsync(Utilisateurs user, string roleName, CancellationToken cancellationToken)
        {
            var role = _roleRepository.FindByName(roleName.ToUpper());
            return Task.FromResult(_userRoleRepository.AddUserToRole(user.Id, role.Id));  
        }
        public Task<Utilisateurs> FindByNameAsync(string normalizedUserName, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        //    cancellationToken.ThrowIfCancellationRequested();

        //    return Task.FromResult(_roleRepository.FindByName(normalizedUserName));
        //
        }
    }
}
