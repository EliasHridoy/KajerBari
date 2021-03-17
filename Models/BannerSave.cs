using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Http;

namespace KazerBariWeb.Models
{

    public partial class BannerSave
    {

        [Required]
        public IFormFile Banner { get; set; }

        

    }
}