using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace KazerBariWeb.Models
{
    public partial class Category
    {
        public Category()
        {
            Services = new HashSet<Service>();
        }

        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        public string Icon { get; set; }
        public string Banner { get; set; }
        [Required]
        public string WhatIncluded { get; set; }
        [Required]
        public string WhatExcluded { get; set; }

        public virtual ICollection<Service> Services { get; set; }
    }
}
