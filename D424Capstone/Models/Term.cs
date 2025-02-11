using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;

//Demonstration of task B - A database component to securely add, modify, and delete the data.
namespace D424Capstone.Models
{
    public class Term
    {
        [PrimaryKey]
        [AutoIncrement]
        [Column("id")]
        public int Id { get; set; }

        [Column("name")]
        [NotNull]
        public string Name { get; set; }

        [Column("start_date")]
        [NotNull]
        public DateTime StartDate { get; set; }
        [Column("end_date")]
        [NotNull]
        public DateTime EndDate { get; set; }

        [NotNull]
        public int UserId { get; set; }

        public string DateRange => $"{StartDate:MM/dd/yyyy} - {EndDate:MM/dd/yyyy}";
    }
}
