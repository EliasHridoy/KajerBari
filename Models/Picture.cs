using System;
using System.Collections.Generic;

#nullable disable

namespace KazerBariWeb.Models
{
    public partial class Picture
    {
        public int Id { get; set; }
        public int BannerId { get; set; }
        public string ImageName { get; set; }
    }
}
