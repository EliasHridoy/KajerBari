using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace KazerBariWeb.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderedServices = new HashSet<OrderedService>();
        }

        public int Id { get; set; }
        [Required(ErrorMessage="This field is required")]
        public string Name { get; set; }
        [Required(ErrorMessage="This field is required")]
        public string MobileNo { get; set; }
        [Required(ErrorMessage="This field is required")]
        public string Address { get; set; }
        [Required(ErrorMessage="This field is required")]
        public string Area { get; set; }
        [Required(ErrorMessage="This field is required")]
        public DateTime Date { get; set; }
        public decimal Subtotal { get; set; }
        public string Comment { get; set; }

        public virtual ICollection<OrderedService> OrderedServices { get; set; }
    }
}
