using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;
using ColumnAttribute = SQLite.ColumnAttribute;

namespace D424Capstone.Models
{
    public class Assessment
    {
        [PrimaryKey]
        [AutoIncrement]
        [Column("id")]

        public int Id { get; set; }

        [Column("name")]
        [NotNull]
        public string Name { get; set; }

        [Column("type")]
        [NotNull]
        public string Type { get; set; }

        [Column("start_date")]
        [NotNull]
        public DateTime StartDate { get; set; }

        [Column("end_date")]
        [NotNull]
        public DateTime EndDate { get; set; }

        [Column("notification")]
        [DefaultValue(false)]

        public Boolean Notification { get; set; }

        [Column("course_id")]
        [ForeignKey("Course")]
        [NotNull]
        public int CourseId { get; set; }

        public string DateRange => $"{StartDate:MM/dd/yyyy} - {EndDate:MM/dd/yyyy}";
    }
}