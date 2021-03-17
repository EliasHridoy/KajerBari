using System;
using System.Collections.Generic;

#nullable disable

namespace KazerBariWeb.Models
{
    public partial class Discount
    {
        public Discount()
        {
            Packages = new HashSet<Package>();
        }

        public int Id { get; set; }
        public string Code { get; set; }
        public int Value { get; set; }
        public DateTime ValidationDate { get; set; }
        public int UsedTime { get; set; }

        public virtual ICollection<Package> Packages { get; set; }
    }
}
