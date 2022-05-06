using CurrencyConvertorAdmin.Core.Dtos;
using CurrencyConvertorAdmin.Infrastructure;
using CurrencyConvertorAdmin.Services.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace CurrencyConvertorAdmin.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {   private readonly IAccountService accountService;

        public AccountController(IAccountService accountService)
        { this.accountService = accountService;

        }




        [HttpPost("Login")]
        public async Task<IActionResult> Login([FromForm] LoginDto logindto)
        {
            if (logindto != null)
            {
                await accountService.LoginAsync(logindto);
                return Ok($"Done ,you are login now");

            }
            else
                return BadRequest("Email is already exist");

        }



    [HttpPost("Register")]
        public async Task<IActionResult> Register([FromForm] RegistrationDto registrationDto)
        {

            if (registrationDto != null)
            {
                await accountService.RegisterAsync(registrationDto);
                return Ok($"Done ,you are registerd now");

            }
            else
                    return BadRequest("Email is already exist");
            
        }



    }
}
