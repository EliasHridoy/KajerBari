using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace KazerBariWeb.Models
{
    public partial class Package
    {
        public int Id { get; set; }
        [Required]
        public int ServiceId { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public decimal Price { get; set; }
        public int? DiscountId { get; set; }

        public virtual Discount Discount { get; set; }
        public virtual Service Service { get; set; }
    }
}
