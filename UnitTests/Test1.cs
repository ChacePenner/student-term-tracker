using System;
using System.IO;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using D424Capstone.Services;

namespace UnitTests
{
    [TestClass]
    public sealed class Test1
    {
        [TestMethod]
        public async Task TestMethod1()
        {
            var test = new DatabaseService();
            var users = await test.GetUsers();
            Assert.IsNotNull(users);
        }
    }
}
