using System;
using System.Collections.Generic;

#nullable disable

namespace KazerBariWeb.Models
{
    public partial class OrderedService
    {
        public int Id { get; set; }
        public int OderId { get; set; }
        public int PackageId { get; set; }
        public int Quantity { get; set; }  

        public virtual Order Oder { get; set; }
        public virtual Package  Package { get; set; }
    }
}
