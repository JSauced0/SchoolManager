using Microsoft.AspNetCore.Mvc;

namespace server.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult Login()
        {
            return View();
        }
    }
}