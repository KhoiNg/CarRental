using CarRental.Account;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarRental.DataModel
{
    public class UserRepository
    {
        private readonly UserManager<IdentityUser> userManager = new UserManager<IdentityUser>(new UserStore<IdentityUser>());
        private readonly RoleManager<IdentityRole> roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>());

        public UserRepository()
        {
            if (roleManager.Roles.Count() == 0)
            {
                foreach (var r in Enum.GetNames(typeof(RoleType)))
                {
                    roleManager.Create(new IdentityRole(r));
                }
            }
        }

        public List<UserInfo> GetAllUsers()
        {
            var users = userManager.Users.ToList();
            var roles = roleManager.Roles.ToList();
            var query = from user in users
                        join role in roles
                        on user.Roles.ToList()[0].RoleId equals role.Id
                        select new UserInfo
                        {
                            Id = user.Id,
                            Username = user.UserName,
                            Email = user.Email,
                            Role = role.Name
                        };
            return query.ToList();
        }

        public IdentityResult CreateUser(string username, string email, string password, string role = nameof(RoleType.User))
        {
            var user = new IdentityUser() { UserName = username, Email = email };
            IdentityResult result = userManager.Create(user, password);
            if (result.Succeeded)
            {
                var addRoleResult = userManager.AddToRole(user.Id, role);
                return addRoleResult;
            }
            return result;
        }

        public IdentityResult UpdateUserInfo(string id, string username, string email, string password, string role)
        {
            var user = userManager.FindById(id);
            user.UserName = username;
            user.Email = email;
            user.PasswordHash = userManager.PasswordHasher.HashPassword(password);
            var oldRoleId = user.Roles.SingleOrDefault().RoleId;
            var oldRoleName = roleManager.Roles.SingleOrDefault(r => r.Id == oldRoleId).Name;
            if (oldRoleName != role)
            {
                userManager.RemoveFromRole(user.Id, oldRoleName);
                userManager.AddToRole(user.Id, role);
            }
            var result = userManager.Update(user);
            return result;
        }

        public IdentityResult DeleteUser(string id)
        {
            var user = userManager.FindById(id);
            var result = userManager.Delete(user);
            return result;
        }
    }

    public class UserInfo
    {
        public string Id { get; set; }

        public string Username { get; set; }

        public string Email { get; set; }

        public string Role { get; set; }
    }
}