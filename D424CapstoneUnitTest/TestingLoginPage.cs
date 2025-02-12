using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using D424Capstone.Services;
using D424Capstone.Views;
using Microsoft.Maui.Controls;

namespace D424CapstoneUnitTest
{
    public class TestingLoginPage : LoginPage
    {
        //public new Entry usernameEntry { get; set; } = new Entry();
        //public new Entry passwordEntry { get; set;} = new Entry();

        public string LastAlertTitle { get; private set; }
        public string LastAlertMessage { get; private set; }
        public string LastAlertCancel { get; private set; }

        public TestingLoginPage(DatabaseService dbService) : base ()
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
