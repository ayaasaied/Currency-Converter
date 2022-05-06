using CurrencyConvertorAdmin.Core.common;
using CurrencyConvertorAdmin.Core.Dtos;
using CurrencyConvertorAdmin.Core.Models;
using CurrencyConvertorAdmin.Services.Services;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CurrencyConvertorAdmin.Infrastructure.Repositry
{

    public class CurrencyRepository : ICurrencyService

    {
        private readonly ApplicationDBContext _dbContext;
        public CurrencyRepository(ApplicationDBContext dbContext) => _dbContext = dbContext;

        public async Task<IEnumerable<CurrencyHIstoryDto>> GetAll()
        {
            try
            {
                var gettallcurrency = await _dbContext.Currency.Where(c => c.IsActive)
                    .Select(ExchangeHistory => new CurrencyHIstoryDto
                    {
                        Name = ExchangeHistory.Name,

                        Sign = ExchangeHistory.Sign,
                        Rate = ExchangeHistory.ExchangeHistory.OrderBy(r => r.ExchangeDate).LastOrDefault().Rate


                    }).ToListAsync();
                return gettallcurrency ?? null;
            }
            catch (Exception)
            {
                throw;
            }

        }


        public async Task<CurrencyHIstoryDto> GetById(int id)
        {
            try
            {
                if (id >= 1)
                {
                    var getcurr = await _dbContext.Currency.Where(c => c.IsActive).SingleOrDefaultAsync(c => c.Id == id);
                    if (getcurr != null)
                    {
                        return new CurrencyHIstoryDto
                        {
                            Name = getcurr.Name,
                            Sign = getcurr.Sign,
                            Rate = getcurr.ExchangeHistory.OrderByDescending(e => e.ExchangeDate)
                                  .Take(1).OrderBy(r => r.Rate).LastOrDefault().Rate,

                        };
                    }
                }

            }
            catch (Exception) { throw; }

            return null;
        }

        public async Task<CurrencyHIstoryDto> GetByName(string name)
        {
            try
            {
                if (name != null)
                {
                    var resulte = await _dbContext.Currency.Where(s => s.IsActive).SingleOrDefaultAsync(c => c.Name == name.ToLower());
                    if (resulte != null)
                    {
                        return new CurrencyHIstoryDto
                        {
                            Name = resulte.Name,
                            Sign = resulte.Sign,
                            Rate = resulte.ExchangeHistory.OrderByDescending(s => s.ExchangeDate).Take(1)
                                   .OrderBy(r => r.Rate).LastOrDefault().Rate,

                        };
                    }
                }
            }
            catch (Exception)
            { throw; }
            return null;
        }

        public async Task<int> AddAsync(CurrencyHIstoryDto currencyhistoryDto)
        {

            bool isvalible = await _dbContext.Currency.AllAsync(c => c.Name != currencyhistoryDto.Name);
            if (isvalible)
            {
                try
                {
                    var currency = new Currency()
                    {
                        Name = currencyhistoryDto.Name,
                        Sign = currencyhistoryDto.Sign,
                    };
                    await _dbContext.Currency.AddAsync(currency);

                    var Exchange = new ExchangeHistory()
                    {
                        Currency = currency,
                        Rate = currencyhistoryDto.Rate,

                    };
                    await _dbContext.ExchangeHistory.AddAsync(Exchange);

                    return 1;
                }
                catch (Exception) { return 0; }
            }
            return 0;

        }

        public async Task<CurrencyHIstoryDto> Update(int id, CurrencyHIstoryDto CurhistoryDto)
        {
            try
            {
                var curr = await GetById(id);
                curr.Name = CurhistoryDto.Name;
                curr.Sign = CurhistoryDto.Sign;
                var exchganehistory = new ExchangeHistory()
                {
                    CurId = id,

                    Rate = CurhistoryDto.Rate,
                };
                await _dbContext.ExchangeHistory.AddAsync(exchganehistory);
                return CurhistoryDto;
            }
            catch (Exception)
            {
                throw;
            }

        }

        //public Currency GetCurrencyById(int id)
        //{
        //    try
        //    {
        //        if (id != 0)
        //        {
        //            return _dbContext.Currency.Where(c => c.IsActive).SingleOrDefault(c => c.Id == id);
                           

        //        }
        //    }
        //    catch (Exception)
        //    { throw; }
        //    return null;
        //}

        public  async Task<int> Remove(int id)
        {
            try
            {
                var CurrIsActive = await _dbContext.Currency.Where(s => s.IsActive).FirstOrDefaultAsync(i => i.Id == id);

                if (CurrIsActive != null)
                {
                    CurrIsActive.IsActive = false;
                    return 1;
                }


            }
            catch { throw; }
                   
            return 0;

        }

        public async Task<IEnumerable<CurrencyHIstoryDto>> GetNCurrencies(int num, string order)
        {
            if (order == Order.Descending)
            {
                var gethigh = (await GetAll()).OrderByDescending(s => s.Rate).ToList();
                if (gethigh.Count >= num)
                {
                    return gethigh.Take(num);
                }
                return gethigh;

            }
            else
            {
                var getlow = (await GetAll()).OrderBy(s => s.Rate).ToList();
                if (getlow.Count >= num)
                {
                    return getlow.Take(num);
                }
                return getlow;
            }

        }

        private double GetLastRate(int id)
        {
            var rate = _dbContext.Currency.Where(s => s.IsActive).SingleOrDefault(c => c.Id == id)
                .ExchangeHistory.OrderBy(date => date.ExchangeDate).LastOrDefault().Rate;

            return rate;
        }
        public double ConvertCurrency(int idfrom, int idto, double num)

        {
            try
            {
                double Fcurrency =GetLastRate(idfrom);
                double Tcurrency = GetLastRate(idto);
                double resulte = (num * Fcurrency) / Tcurrency;
                return resulte;

            }
            catch (Exception)
            {
                throw;
            }

        }
        private double getRate(int currencyId, DateTime Startdate, DateTime enddate)
        {
            double rate = 0;
            var currency = _dbContext.ExchangeHistory.Where(w => w.CurId == currencyId).ToList();
            var nearestDate = currency.Where(s => s.ExchangeDate >= Startdate).Where(s => s.ExchangeDate <= enddate)
                .OrderBy(d => d.ExchangeDate).ToList();
            if (nearestDate.Count() != 0)
            {
                rate = nearestDate.LastOrDefault().Rate - nearestDate.FirstOrDefault().Rate;

            }

            return rate;
        }

        public List<Improvedcurrency> GetNImprovedCurrenciesByDate(int num, DateTime startDate, DateTime endDate, string order)
        {
            if (order == Order.Descending)
            {
                try
                {

                    var currency = new List<Improvedcurrency>();
                    var Currencies = _dbContext.Currency.Where(s => s.IsActive).ToList();
                    foreach (var curr in Currencies)
                    {

                        currency.Add(new Improvedcurrency()
                        {
                            currencyname = curr.Name,

                            rate = getRate(curr.Id, startDate, endDate),
                        });

                    }


                    return currency.Where(s => s.rate > 0).OrderByDescending(x => x.rate).Take(num).ToList();
                }
                catch (Exception)
                {
                    throw;
                }



            }

            else
            {
                try
                {
                    var currency = new List<Improvedcurrency>();
                    var Currencies = _dbContext.Currency.ToList();
                    foreach (var curr in Currencies)
                    {
                        currency.Add(new Improvedcurrency()
                        {
                            currencyname = curr.Name,
                            rate = getRate(curr.Id, startDate, endDate),
                        });

                    }


                    return currency.Where(s => s.rate < 0).OrderBy(x => x.rate).Take(num).ToList();

                }
                catch(Exception)
                {
                    throw;
                }
            }
        }



    }
}
