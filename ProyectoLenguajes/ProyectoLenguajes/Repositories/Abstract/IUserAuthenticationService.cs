using ProyectoLenguajes.Models;
using ProyectoLenguajes.Models.DTO;

namespace ProyectoLenguajes.Repositories.Abstract
{
    public interface IUserAuthenticationService
    {
        Task<Status> LoginAsync(LoginModel model);

        Task<Status> RegistrationAsync(RegistrationModel model); 
        Task<Status> DeleteUserAsync(ACCOUNT model);
        Task<Status> UpdateUserAsync(ACCOUNT model, string currentUsername);

        //tareas asincronicas o varias tareas a la vez
        Task LogoutAsync();
    }
}
