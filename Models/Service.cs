using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace KazerBariWeb.Models
{
    public partial class Service
    {
        public Service()
        {
            Packages = new HashSet<Package>();
        }

        public int Id { get; set; }
        [Required]
        public int CategoryId { get; set; }
        [Required(ErrorMessage="Required")]
        public string Name { get; set; }
        public string Image { get; set; }

        public virtual Category Category { get; set; }
        public virtual ICollection<Package> Packages { get; set; }
    }
}
