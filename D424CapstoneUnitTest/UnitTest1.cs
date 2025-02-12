using D424Capstone.Services;
using System.Runtime.InteropServices;
namespace D424CapstoneUnitTest
{
    public class UnitTest1
    {
        public UnitTest1()
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
    }
}