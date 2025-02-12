using System.Collections.ObjectModel;
using D424Capstone.Models;
using D424Capstone.Services;
using BCrypt.Net;
namespace D424Capstone.Views;

public partial class RegistrationPage : ContentPage
{
	protected DatabaseService _dbService;
	public RegistrationPage()
	{
		InitializeComponent();
		_dbService = new DatabaseService();
	}

	public async void RegisterButton_Clicked(object sender, EventArgs e)
	{
		string username = usernameEntry.Text?.Trim();
		string password = passwordEntry.Text;

		if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password))
		{
			await ShowAlert("Error", "Please enter a username and password.", "Okay");
			return;
		}

		List<Users> users = await _dbService.GetUsers();
		bool userExists = false;
		for (int i = 0; i < users.Count; i++)
		{
			if (string.Compare(users[i].Username, username, StringComparison.OrdinalIgnoreCase) == 0)
			{
				userExists = true;
				break;
			}
		}

		if (userExists)
		{
			await ShowAlert("Error", "Username already exists.", "Okay");
			return;
		}

		string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password);

		Users newUser = new() { Username = username, Password = hashedPassword };
		await _dbService.Create(newUser);

		await ShowAlert("Success", "Registration successful. You may now login with your username and password.", "Okay");
		await Navigation.PopModalAsync();
	}
    private async void cancelButton_Clicked(object sender, EventArgs e)
    {
		await Navigation.PopModalAsync();
    }

	protected virtual Task ShowAlert(string title, string message, string cancel)
	{
		return DisplayAlert(title, message, cancel);
	}

}