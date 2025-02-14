using System.Collections.ObjectModel;
using D424Capstone.Models;
using D424Capstone.Services;
using BCrypt.Net;
using D424Capstone.Pages;
namespace D424Capstone.Views;


public partial class LoginPage : ContentPage
{
	protected DatabaseService _dbService;

    public LoginPage() : this(new DatabaseService()) { }
    
    public LoginPage(DatabaseService dbService)
	{
		InitializeComponent();
        _dbService = new DatabaseService();
	}

    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await _dbService.InitializeDatabase();
    }

    public async void loginButton_Clicked(object sender, EventArgs e)
    {
        string username = usernameEntry.Text?.Trim();
        string password = passwordEntry.Text?.Trim();

        if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password))
        {
            await ShowAlert("Error", "Please enter your username and password.", "Okay");
            return;
        }

        List<Users> users = await _dbService.GetUsers();
        Users matchingUser = null;
        for (int i = 0; i < users.Count; i++)
        {
            if (string.Compare(users[i].Username, username, StringComparison.OrdinalIgnoreCase) == 0)
            {
                matchingUser = users[i];
                break;
            }
        }
        if (matchingUser == null)
        {
            await ShowAlert("Error", "Invalid username or password.", "Okay");
            return;
        }

        bool correctPassword = BCrypt.Net.BCrypt.Verify(password, matchingUser.Password);
        if (!correctPassword)
        {
            await ShowAlert("Login Failed", "Invalid username or password.", "Okay");
            return;
        }

        await ShowAlert("Success", "You have successfully logged in.", "Okay");
        await SecureStorage.SetAsync("CurrentUserId", matchingUser.Id.ToString());
        await Navigation.PushModalAsync(new TermViewContentPage(_dbService));
        
    }
    private async void registerButton_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushModalAsync(new RegistrationPage());
    }

    protected virtual Task ShowAlert(string title, string message, string cancel)
    {
        return DisplayAlert(title, message, cancel);
    }
}