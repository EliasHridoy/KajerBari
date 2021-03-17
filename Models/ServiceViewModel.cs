using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace KazerBariWeb.Models
{
    public class ServiceViewModel:Service
    {
        [Required(ErrorMessage="This fiedl is required!!")]
        public IFormFile ImageFile { get; set; } 
    }
}
