using System;
using System.Collections.Generic;

namespace KazerBariWeb.Models
{
    public class OrderCreationDto
    {
        public string Name { get; set; }
        public string MobileNo { get; set; }
        public string Address { get; set; }
        public string Area { get; set; }
        public DateTime Date { get; set; }
        public decimal Subtotal { get; set; }
        public string Comment { get; set; }
        public IEnumerable<PackageInOrderDto> Packages { get; set; }

        public string PackId { get; set; }
        public string Quantity { get; set; }


    }
}