using CurrencyConvertorAdmin.Core.Dtos;
using CurrencyConvertorAdmin.Services.Services;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CurrencyConvertorAdmin.Infrastructure.Repositry
{
    public class AccountRepository : IAccountService
    {
     private readonly UserManager<IdentityUser> userManager;
        private readonly SignInManager<IdentityUser> signInManager;
        public AccountRepository(UserManager<IdentityUser> userManager, SignInManager<IdentityUser> signInManager)
        {
            this.userManager = userManager;
            this.signInManager = signInManager;
        }
        public async Task<int> LoginAsync(LoginDto logindto)
        {
            try
            {
                if (logindto != null)
                {
                    var user = await userManager.FindByNameAsync(logindto.Email);
                    user = (user != null) ? user : await userManager.FindByEmailAsync(logindto.Email);
                    if (user != null)
                    {
                        var passwordChecked = await userManager.CheckPasswordAsync(user, logindto.Password);
                        if (passwordChecked)
                        {
                            var response = await signInManager.PasswordSignInAsync(user, logindto.Password, false, false);
                            if (response.Succeeded)
                            {
                                return 1;
                            }
                        }
                    }
                }
            }
            catch (Exception )
            {
                throw;
               
            }
           return 0;
        }

        public async Task<int> RegisterAsync(RegistrationDto registrationDto)
        {
            try
           {

               var userByEmail = await userManager.FindByEmailAsync(registrationDto.Email);

                if (userByEmail == null)
                {
                    var newUser = new IdentityUser()
                    {
                        UserName = registrationDto.UserName,
                        PasswordHash = registrationDto.Password,
                        PhoneNumber = registrationDto.PhoneNumber,

                        Email = registrationDto.Email
                    };
                    var response = await userManager.CreateAsync(newUser, registrationDto.Password);
                    if (response.Succeeded)
                    {
                        await userManager.AddToRoleAsync(newUser, "ADMIN");
                        await signInManager.SignInAsync(newUser, true);
                    }

                    return 1;
              }
         }
           catch (Exception)
          {
                throw;
           }
            return 0;
            
         
        }
    }
}
