using System.ComponentModel.DataAnnotations;

namespace Example.Web.Models
{
    public class HorseSummary
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Starts { get; set; }
        public int Win { get; set; }
        public int Place { get; set; }
        public int Show { get; set; }
        [DataType(DataType.Currency)]
        public int Earnings { get; set; }
    }
}