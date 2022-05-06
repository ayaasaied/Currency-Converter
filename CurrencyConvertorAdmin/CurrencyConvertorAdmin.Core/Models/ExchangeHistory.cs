using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CurrencyConvertorAdmin.Core.Models
{
    public class ExchangeHistory
    {
        public int Id { get; set; }
        [ForeignKey("Currency")]
        public int CurId { get; set; }

        
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTime ExchangeDate { get; set; }= DateTime.Now;
    
        [Required]
        public double Rate { get; set; }    
        public virtual Currency Currency { get; set; }


    }
}
