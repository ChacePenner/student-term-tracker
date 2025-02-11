using System.Collections.ObjectModel;
using D424Capstone.Models;
using D424Capstone.Services;
using BCrypt.Net;
using D424Capstone.Pages;
namespace D424Capstone.Views;


public partial class LoginPage : ContentPage
{
	private readonly DatabaseService _dbService;
    public LoginPage()
	{
		InitializeComponent();
        _dbService = new DatabaseService();
	}

    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await _dbService.InitializeDatabase();
    }

    private async void loginButton_Clicked(object sender, EventArgs e)
    {
        string username = usernameEntry.Text?.Trim();
        string password = passwordEntry.Text?.Trim();

        if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password))
        {
            await DisplayAlert("Error", "Please enter your username and password.", "Okay");
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
            await DisplayAlert("Error", "Invalid username or password.", "Okay");
            return;
        }

        bool correctPassword = BCrypt.Net.BCrypt.Verify(password, matchingUser.Password);
        if (!correctPassword)
        {
            await DisplayAlert("Login Failed", "Invalid username or password.", "Okay");
            return;
        }

        await SecureStorage.SetAsync("CurrentUserId", matchingUser.Id.ToString());
        await Navigation.PushModalAsync(new TermViewContentPage(_dbService));
        await DisplayAlert("Success", "You have successfully logged in.", "Okay");
    }
    private async void registerButton_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushModalAsync(new RegistrationPage());
    }
}