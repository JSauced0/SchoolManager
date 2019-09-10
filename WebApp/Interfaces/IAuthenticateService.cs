using WebApp.Models.Tokens;

namespace WebApp.Interfaces
{
    public interface IAuthenticateService
    {
        bool IsAuthenticated(TokenRequest request, out string token);
    }
}