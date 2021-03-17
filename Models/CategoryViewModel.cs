using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace KazerBariWeb.Models
{
    public class CategoryViewModel:Category
    {
        [Required]
        public IFormFile Image { get; set; }
        [Required]
        public IFormFile IconPNG { get; set; }
    }
}
