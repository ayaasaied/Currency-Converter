
using CurrencyConvertorAdmin.Core.Models;

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using CurrencyConvertorAdmin.Core;
using CurrencyConvertorAdmin.Core.Dtos;
using AutoMapper;
using System.Collections.Generic;
using System;
using CurrencyConvertorAdmin.Core.common;
using CurrencyConvertorAdmin.Infrastructure.unitofwork;

namespace CurrencyConvertorAdmin.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CurrencyController : ControllerBase
    {
        private readonly IUnitOfWorks unitOfWorks;


        public CurrencyController(IUnitOfWorks unitOfWorks)
        {
            this.unitOfWorks = unitOfWorks;
        }

        [HttpGet("GetAllCurrencies")]
        public async Task<ActionResult<CurrencyHIstoryDto>> GetAll()
        {
            var result = await unitOfWorks.currency.GetAll();
            return Ok(result);
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<CurrencyHIstoryDto>> GetbyId(int id)
        {
            if (id >=1)
            {
                var currency = await unitOfWorks.currency.GetById(id);
                if (currency == null)
                {
                    return NotFound("not found this id");
                }
                return Ok(currency);
            }
            else
                return BadRequest("not found this id");

        }

        [HttpGet("getname")]
        public async Task<ActionResult<CurrencyHIstoryDto>> GetbyName(string Name)
        {

            if (Name != null)
            {
                var currency = await unitOfWorks.currency.GetByName(Name);

                if (currency == null)
                {
                    return NotFound($"not found Name :{Name}");
                }

                return Ok(currency);
            }
            else
                return NotFound($"not found Name ,Enter Name agin");

        }
        [HttpPost]
        public async Task<IActionResult> CreateAsync([FromForm] CurrencyHIstoryDto dto)
        {
            if (dto != null)
            {
                await unitOfWorks.currency.AddAsync(dto);
                unitOfWorks.Complete();
                return Ok("Added successfully");
            }
            return BadRequest("invalid Data ,check and try again");

        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateCurrency(int id, [FromForm] CurrencyHIstoryDto dto)
        {
            if (id != 0&& id!=1 && dto!=null)
            {
                await unitOfWorks.currency.Update(id, dto);
                unitOfWorks.Complete();
                return Ok("Successfully Updated");
            }
            return NotFound($"no currency with this id {id} ");

        }

   

        [HttpDelete("{id}")]
        public  async Task<ActionResult<int>> Deletecurrency(int id)
        {
           if (id != 0 && id>1)
           {
              
                   
              await  unitOfWorks.currency.Remove(id);

                      unitOfWorks.Complete();
                return Ok("currency isnt found now");
            }
               
            return NotFound($"No currency was found with ID {id}"); 

        }


        [HttpGet("ConvertAmount")]
        public IActionResult ConvertCurrency(int currencyID, int currencyID2, double mount)
        {
            if (ModelState.IsValid)
            { if (currencyID != currencyID2 && currencyID>=1 && currencyID2>=1 && mount>=1)
                {
                    var resulte = unitOfWorks.currency.ConvertCurrency(currencyID, currencyID2, mount);
                    return Ok(resulte);
                }
               return BadRequest("invalid data ,check ID");
            }
            return BadRequest("invalid Data ,check and try again");
            
        }

        [HttpGet("GetHighestNCurrencies")]
        public async Task<ActionResult<IEnumerable<CurrencyHIstoryDto>>> GetHighestNCurrencies(int count)
        {
            if (count != 0 && count >= 1)
            {
                var GetHighest = await unitOfWorks.currency.GetNCurrencies(count, Order.Descending);
                return Ok(GetHighest);
            }
            else
                return BadRequest("invalid data");
        }


        [HttpGet("GetNLowCurrencies")]
        public async Task<IActionResult> GetNLowCurrencies(int count)
        {
            if (count != 0 && count >= 1)
            {
                var GetNLow = await unitOfWorks.currency.GetNCurrencies(count, Order.Ascending);
                return Ok(GetNLow);
            }
            return BadRequest("invalid Data ,check and try again");

        }


        [HttpGet("GetMostNImprovedCurrencies")]
        public ActionResult<List<Improvedcurrency>> GetMostNImprovedCurrenciesByDate(int num, DateTime startDate, DateTime endDate)

        {
            if (ModelState.IsValid)
            {
                if (num > 0)
                {
                    if (endDate > startDate)
                    {
                        var GetLeast = unitOfWorks.currency.GetNImprovedCurrenciesByDate(num, startDate, endDate, Order.Descending);
                        if (GetLeast != null)
                        {
                            return Ok(GetLeast);
                        }
                        return BadRequest("End Date mustbe bigger than Start Date");
                    }
                }
            }
            return BadRequest("invalid Data ");



        }
        
        [HttpGet("GetLeastNImprovedCurrencies")]
        public ActionResult<List<Improvedcurrency>> GetLeasetNImprovedCurrenciesByDate(int num, DateTime startDate, DateTime endDate)
        {
            if (ModelState.IsValid)
            {
                if (num > 0)
                {
                    if (endDate > startDate)
                    {
                        var GetLeast = unitOfWorks.currency.GetNImprovedCurrenciesByDate(num, startDate, endDate, Order.Ascending);
                        if (GetLeast != null)
                        {
                            return Ok(GetLeast);
                        }
                        return BadRequest("End Date mustbe bigger than Start Date");
                    }
                }
            }
            return BadRequest("invalid Data ");

        }


    }
}
