using D424Capstone.Services;
using System.Runtime.InteropServices;
using BCrypt.Net;
using System.Threading.Tasks;
namespace D424CapstoneUnitTest
{
    public class UnitTests
    {
        public UnitTests()
        {
            DependencyService.Register<DummyFontNamedSizeService>();
        }
        [Fact]
        public async Task Test1()
            //Test to ensure that the "duplicate username" error message appears when a user attempts
            //to use the same username multiple times when registering
        {
            var testDb = new TestingDatabase();
            testDb.TestUsers.Add(new D424Capstone.Models.Users { Id = 1, Username = "TestUser", Password = "TestPassword" });

            var registrationPage = new TestingRegistration(testDb);

            registrationPage.usernameEntry.Text = "TestUser";
            registrationPage.passwordEntry.Text = "TestPassword";

            registrationPage.RegisterButton_Clicked(null, null);

            await Task.Delay(100);

            Assert.Equal("Username already exists.", registrationPage.LastAlertMessage);
        }

        [Fact]
        public async Task InvalidCreditials()
        {
            var testDb = new TestingDatabase();
            testDb.TestUsers.Add(new D424Capstone.Models.Users
            {
                Id = 1,
                Username = "ValidUser",
                Password = BCrypt.Net.BCrypt.HashPassword("ValidPassword")
            });

            var loginPage = new TestingLoginPage(testDb);
            loginPage.usernameEntry.Text = "ValidUser";
            loginPage.passwordEntry.Text = "IncorrectPassword";

            loginPage.loginButton_Clicked(null, null);
            await Task.Delay(100);

            Assert.Equal("Invalid username or password.", loginPage.LastAlertMessage);
        }

        [Fact]
        public async Task ValidCredentials()
        {
            var testDb = new TestingDatabase();
            testDb.TestUsers.Add(new D424Capstone.Models.Users
            {
                Id = 1,
                Username = "ValidUser",
                Password = BCrypt.Net.BCrypt.HashPassword("ValidPassword")
            });

            var loginPage = new TestingLoginPage(testDb);
            loginPage.usernameEntry.Text = "ValidUser";
            loginPage.passwordEntry.Text = "ValidPassword";

            loginPage.loginButton_Clicked(null, null);
            await Task.Delay(100);

            Assert.Equal("Success", loginPage.LastAlertTitle);
            Assert.Equal("You have successfully logged in.", loginPage.LastAlertMessage);
        }
    }
}