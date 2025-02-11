using D424Capstone.Pages;
using D424Capstone.Services;
using D424Capstone.Views;

namespace D424Capstone
{
    public partial class App : Application
    {
        public App(DatabaseService dbService)
        {
            InitializeComponent();

            MainPage = new NavigationPage(new LoginPage());
            //Designates the login page as the first page of the application.

        }
    }
}
