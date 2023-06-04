using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;

namespace ProyectoLenguajes.Models.Domain
{
    public class MyUserManager : UserManager<ApplicationUser>
    {
        public MyUserManager(IUserStore<ApplicationUser> store, IOptions<IdentityOptions> optionsAccessor, IPasswordHasher<ApplicationUser> passwordHasher, IEnumerable<IUserValidator<ApplicationUser>> userValidators, IEnumerable<IPasswordValidator<ApplicationUser>> passwordValidators, ILookupNormalizer keyNormalizer, IdentityErrorDescriber errors, IServiceProvider services, ILogger<UserManager<ApplicationUser>> logger) : base(store, optionsAccessor, passwordHasher, userValidators, passwordValidators, keyNormalizer, errors, services, logger)
        {
        }

        public async Task<ApplicationUser> FindByUsernameAsync(string username)
        {
            // Implementa la lógica para buscar el modelo basado en el nombre de usuario
            var user = await Users.SingleOrDefaultAsync(u => u.UserName == username);
            return user;
        }
    }
}
