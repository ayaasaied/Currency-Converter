using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CurrencyConvertorAdmin.Services.Services
{
    public interface IRegisterService<T> where T : class
    {
        Task<int> RegisterAsync(T register);
    }
}
