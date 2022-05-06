using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CurrencyConvertorAdmin.Core.Models
{
    public class Currency
    {
        public int Id { get; set; }
        [Required]
        [StringLength(100, MinimumLength = 2)]
        public string Name { get; set; }
        [Required]
        [StringLength(5,MinimumLength = 1)]
        public string Sign { get; set; }
        public bool IsActive { get; set; } = true;
        public virtual List<ExchangeHistory> ExchangeHistory { get; set; }

    }
}
