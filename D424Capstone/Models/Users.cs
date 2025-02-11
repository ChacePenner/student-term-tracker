using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;

namespace D424Capstone.Models
{
    public class Users
    {
        [PrimaryKey, AutoIncrement]
        public int Id { get; set; }

        [NotNull]
        public string Username { get; set; }

        [NotNull]
        public string Password { get; set; }
    }
}
