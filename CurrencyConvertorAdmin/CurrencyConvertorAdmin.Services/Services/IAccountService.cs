using CurrencyConvertorAdmin.Core.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CurrencyConvertorAdmin.Services.Services
{
    public interface IAccountService : ILoginService<LoginDto>, IRegisterService<RegistrationDto>
    {
    }
}
