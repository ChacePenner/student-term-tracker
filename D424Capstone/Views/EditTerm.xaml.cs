using System.Collections.ObjectModel;
using D424Capstone.Models;
using D424Capstone.Services;

namespace D424Capstone.Views
{
    public partial class EditTerm : ContentPage
    {
        private readonly DatabaseService _dbService;
        private readonly Term _term;
        private readonly ObservableCollection<Term> _terms;
        //Passes values into Edit Term
        public EditTerm(DatabaseService dbService, ObservableCollection<Term> terms, Term term)
        {
            InitializeComponent();
            _dbService = dbService;
            _terms = terms;
            _term = term;

            TermNameEntry.Text = _term.Name;
            StartDatePicker.Date = _term.StartDate;
            EndDatePicker.Date = _term.EndDate;
        }

        private async void saveButton_Clicked(object sender, EventArgs e)
        {
            //Demonstration of task B - Validation
            if (string.IsNullOrWhiteSpace(TermNameEntry.Text))
            {
                await DisplayAlert("Error", "Please provide a term name.", "Okay");
                return;
            }
            //Demonstration of task B - Validation
            if (StartDatePicker.Date >= EndDatePicker.Date)
            {
                await DisplayAlert("Error", "The start date must be before the end date.", "Okay");
                return;
            }

            _term.Name = TermNameEntry.Text;
            _term.StartDate = StartDatePicker.Date;
            _term.EndDate = EndDatePicker.Date;

            await _dbService.Update(_term);

            int index = -1;
            for (int i = 0; i < _terms.Count; i++)
            {
                if (_terms[i].Id == _term.Id)
                {
                    index = i;
                    break;
                }
            }
            if (index >= 0)
            {
                _terms[index] = _term;
            }

            await DisplayAlert("Success", "The term was successfully updated.", "Okay");
            await Navigation.PopModalAsync();
        }

        private async void cancelButton_Clicked(object sender, EventArgs e)
        {
            await Navigation.PopModalAsync();
        }
    }
}