using CurrencyConvertorAdmin.Core;
using CurrencyConvertorAdmin.Core.Models;
using CurrencyConvertorAdmin.Infrastructure.Repositry;
using CurrencyConvertorAdmin.Infrastructure.unitofwork;
using CurrencyConvertorAdmin.Services.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CurrencyConvertorAdmin.Infrastructure
{
    public class UnitofWorks : IUnitOfWorks
    {
        private readonly ApplicationDBContext _context;

        public ICurrencyService currency { get; private set; }


        public UnitofWorks(ApplicationDBContext context)
        {
            _context = context;

            currency = new CurrencyRepository(_context);
        }
        public int Complete()
        {
            return _context.SaveChanges();
        }
        public void Dispose()
        {
            _context.Dispose();
        }

    }
}
