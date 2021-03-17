using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace KazerBariWeb.Models
{
    public partial class Adminnara
    {
        public int Id { get; set; }
        [Required(ErrorMessage ="this is required")]
        public string Email { get; set; }

        [Required(ErrorMessage = "this is required")]
        public string Password { get; set; }
    }
}
