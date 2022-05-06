using CurrencyConvertorAdmin.Services.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CurrencyConvertorAdmin.Infrastructure.unitofwork
{
    public interface IUnitOfWorks: IDisposable
    {
        ICurrencyService currency { get; }
        int Complete();
    }
}
