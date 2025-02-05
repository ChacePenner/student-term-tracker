using System.Collections.ObjectModel;
using D424Capstone.Models;
using D424Capstone.Services;

namespace D424Capstone.Pages
{
    public partial class AddTermContentPage : ContentPage
    {
        private readonly DatabaseService _dbService;
        private readonly ObservableCollection<Term> _terms;
        public AddTermContentPage(DatabaseService dbService, ObservableCollection<Term> terms)
        {
            InitializeComponent();
            _dbService = dbService;
            _terms = terms;
        }

        private async void closeButton_Clicked(object sender, EventArgs e)
        {
            await Navigation.PopModalAsync();
            //PopModalAsync will make the page drop down instead of dragging up a new instance of
            //the page before this one
        }

        private async void saveButton_Clicked(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TermNameEntry.Text))
            {
                await DisplayAlert("Error", "Please provide a term name.", "Okay");
                return;
            }

            if (StartDatePicker.Date >= EndDatePicker.Date)
            {
                await DisplayAlert("Error", "The start date must be before the end date.", "Okay");
                return;
            }

            var newTerm = new Term
            {
                Name = TermNameEntry.Text.Trim(),
                StartDate = StartDatePicker.Date,
                EndDate = EndDatePicker.Date
            };

            await _dbService.Create(newTerm);
            _terms.Add(newTerm);

            await DisplayAlert("Success", "The term was successfully added.", "Okay");

            await Navigation.PopModalAsync();
        }

        private async void cancelButton_Clicked(object sender, EventArgs e)
        {
            await Navigation.PopModalAsync();
        }
    }
}