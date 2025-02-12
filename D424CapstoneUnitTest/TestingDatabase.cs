using D424Capstone.Models;
using D424Capstone.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace D424CapstoneUnitTest
{
    public class TestingDatabase : DatabaseService
    {
        public List<Users> TestUsers { get; set; } = new List<Users>();

        public override Task<List<Users>> GetUsers()
        {
            return Task.FromResult(TestUsers);
        }

        public override Task<int> Create(Users user)
        {
            TestUsers.Add(user);
            return Task.FromResult(1);
        }
    }
}
