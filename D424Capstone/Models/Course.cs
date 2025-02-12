using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;
using ColumnAttribute = SQLite.ColumnAttribute;

//Demonstration of task B - A database component to securely add, modify, and delete the data.
namespace D424Capstone.Models
{
    public class Course
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

        [Column("notification")]
        [DefaultValue(false)]

        public Boolean Notification { get; set; }

        [Column("instructor_name")]
        public string InstructorName { get; set; }

        [Column("instructor_phone")]
        public string InstructorPhone { get; set; }

        [Column("instructor_email")]
        public string InstructorEmail { get; set; }

        [Column("notes")]
        [DefaultValue(null)]
        public string Notes { get; set; }

        [Column("share_notes")]
        [DefaultValue(false)]
        public Boolean ShareNotes { get; set; }

        [Column("status")]
        [NotNull]
        [DefaultValue("Not Started")]
        public string Status { get; set; }

        [Column("term_id")] //Foreign key to Term.id
        [ForeignKey("Term")]
        [NotNull]
        public int TermId { get; set; }

        [NotNull]
        public int UserId { get; set; }

        public string DateRange => $"{StartDate:MM/dd/yyyy} - {EndDate:MM/dd/yyyy}";
    }
}
