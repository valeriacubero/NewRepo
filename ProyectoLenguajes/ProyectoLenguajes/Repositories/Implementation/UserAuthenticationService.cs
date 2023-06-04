using Microsoft.AspNetCore.Identity;
using ProyectoLenguajes.Models;
using ProyectoLenguajes.Models.Domain;
using ProyectoLenguajes.Models.DTO;
using ProyectoLenguajes.Repositories.Abstract;
using System.Security.Claims;

namespace ProyectoLenguajes.Repositories.Implementation
{
    public class UserAuthenticationService : IUserAuthenticationService
    {
        private readonly SignInManager<ApplicationUser> signInManager;
        private readonly UserManager<ApplicationUser> userManager;
        private readonly RoleManager<IdentityRole> roleManager;
        private readonly MyUserManager myUserManager;

        public UserAuthenticationService(SignInManager<ApplicationUser> signInManager, UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager, MyUserManager myUserManager)
        {
            this.roleManager = roleManager;
            this.userManager = userManager;
            this.signInManager = signInManager;
            this.myUserManager = myUserManager;
        }
        public async Task<Status> LoginAsync(LoginModel model)
        {
            var status = new Status();
            var user = await userManager.FindByNameAsync(model.UserName);
            if (user == null)
            {
                status.StatusCode = 0;
                status.Message = "Invalid UserName";
                return status;
            }
            if (!await userManager.CheckPasswordAsync(user, model.Password))
            {
                status.StatusCode = 0;
                status.Message = "Invalid Password";
                return status;
            }

            var signInResult = await signInManager.PasswordSignInAsync(user, model.Password, false, true);
            if (signInResult.Succeeded)
            {
                var userRoles = await userManager.GetRolesAsync(user);
                var authClaims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, user.UserName)

                };
                foreach (var userRole in userRoles)
                {
                    authClaims.Add(new Claim(ClaimTypes.Role, userRole));
                }
                status.StatusCode = 1;
                status.Message = "Logged In Successfully";
                return status;
            }
            else if (signInResult.IsLockedOut)
            {
                status.StatusCode = 0;
                status.Message = "User Locked Out";
                return status;
            }
            else
            {
                status.StatusCode = 0;
                status.Message = "Error On Loggin In";
                return status;
            }
        }


        public async Task LogoutAsync()
        {
            await signInManager.SignOutAsync();
        }

        public async Task<Status> RegistrationAsync(RegistrationModel model)
        {
            var status = new Status();
            var userExists = await userManager.FindByNameAsync(model.UserName); //con el user manager busca si existe
            if (userExists != null)
            {
                status.StatusCode = 0;
                status.Message = "User Already Exists";
                return status;
            }

            ApplicationUser user = new ApplicationUser
            {
                SecurityStamp = Guid.NewGuid().ToString(),
                Name = model.Name,
                Email = model.Email,
                UserName = model.UserName,
                EmailConfirmed = true,

            };

            var result = await userManager.CreateAsync(user, model.Password);
            if (!result.Succeeded)
            {
                status.StatusCode = 0; //no funciono
                status.Message = "User Creation Failed";
                return status;
            }

            //Role Managment
            if (!await roleManager.RoleExistsAsync(model.Role))
            {
                await roleManager.CreateAsync(new IdentityRole(model.Role));
            }

            if (await roleManager.RoleExistsAsync(model.Role))
            {
                await userManager.AddToRoleAsync(user, model.Role);
            }

            status.StatusCode = 1;
            status.Message = "User Has Registered Successfully";
            return status;
        }

        public async Task<Status> UpdateUserAsync(ACCOUNT acc, string currentUsername)
        {
            var status = new Status();
            var user = await myUserManager.FindByUsernameAsync(currentUsername); // acc.userName

            if (user == null)
            {
                status.StatusCode = 0;
                status.Message = "User Not Found";
                return status;
            }

            // Actualizar los campos necesarios del usuario existente
            user.Name = acc.name;
            user.Email = acc.email;
            user.UserName = acc.userName;

            // Si se proporciona una contraseña no encriptada, encriptarla antes de actualizarla
            if (!string.IsNullOrEmpty(acc.password))
            {
                user.PasswordHash = userManager.PasswordHasher.HashPassword(user, acc.password);
            }

            var result = await userManager.UpdateAsync(user);
            if (!result.Succeeded)
            {
                status.StatusCode = 0;
                status.Message = "User Updated Failed";
                return status;
            }

            status.StatusCode = 1;
            status.Message = "User Updated Successfully";
            return status;
        }

        public async Task<Status> DeleteUserAsync(ACCOUNT acc)
        {
            var status = new Status();
            var user = await myUserManager.FindByUsernameAsync(acc.userName); // acc.userName

            if (user == null)
            {
                status.StatusCode = 0;
                status.Message = "User Not Found";
                return status;
            }

            var result = await userManager.DeleteAsync(user);
            if (!result.Succeeded)
            {
                status.StatusCode = 0;
                status.Message = "User Deletion Failed";
                return status;
            }

            status.StatusCode = 1;
            status.Message = "User Deleted Successfully";
            return status;
        }


    }
}
