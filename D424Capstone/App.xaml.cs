using D424Capstone.Pages;
using D424Capstone.Services;

namespace D424Capstone
{
    public partial class App : Application
    {
        public App(DatabaseService dbService)
        {
            InitializeComponent();

            MainPage = new NavigationPage(new TermViewContentPage(dbService));
            //Designates as the initial page of the application.

        }
    }
}
