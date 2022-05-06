using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CurrencyConvertorAdmin.Services.Services
{
    public interface ILoginService<T> where T : class
    {
        Task<int> LoginAsync(T login);
    }
}
