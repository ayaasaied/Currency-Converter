using CurrencyConvertorAdmin.Core.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CurrencyConvertorAdmin.Services.Services
{
    public interface ICurrencyService
    {
        Task<IEnumerable<CurrencyHIstoryDto>> GetAll();
        Task<int> AddAsync(CurrencyHIstoryDto CurhistoryDto);
        Task<CurrencyHIstoryDto> Update(int id, CurrencyHIstoryDto CurhistoryDto);
        Task<int> Remove(int id);
        Task<CurrencyHIstoryDto> GetById(int id);
        Task<CurrencyHIstoryDto> GetByName(string name);
        List<Improvedcurrency> GetNImprovedCurrenciesByDate(int num, DateTime startDate, DateTime endDate, string order);
        double ConvertCurrency(int Fcurrency, int TCurrency, double num);

        Task<IEnumerable<CurrencyHIstoryDto>> GetNCurrencies(int num, string order);
    }
}
