using D424Capstone.Services;
using D424Capstone.Views;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace D424CapstoneUnitTest
{
    public class TestingRegistration : RegistrationPage
    {
        public string LastAlertTitle { get; private set; }
        public string LastAlertMessage { get; private set; }
        public string LastAlertCancel { get; private set; }

        public TestingRegistration(DatabaseService dbService) : base()
        {
            _dbService = dbService;
        }

        protected override Task ShowAlert(string title, string message, string cancel)
        {
            LastAlertTitle = title;
            LastAlertMessage = message;
            LastAlertCancel = cancel;
            return Task.CompletedTask;
        }
    }
}
