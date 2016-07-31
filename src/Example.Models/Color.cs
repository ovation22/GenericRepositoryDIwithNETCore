using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Example.Models
{
    public class Color
    {
        public Color()
        {
            Horses = new HashSet<Horse>();
        }

        public byte Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        [Required]
        [StringLength(255)]
        public string Description { get; set; }

        public virtual ICollection<Horse> Horses { get; set; }
    }
}
