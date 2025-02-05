using System.Collections.ObjectModel;
using D424Capstone.Models;
using D424Capstone.Services;

namespace D424Capstone.Views
{
    public partial class EditObjectiveAssessment : ContentPage
    {
        private Assessment _selectedObjectiveAssessment;
        private readonly DatabaseService _dbService;
        private readonly Action _reloadCourses;
        public EditObjectiveAssessment(Assessment SelectedObjectiveAssessment, DatabaseService dbService, Action reloadCourses)
        {
            InitializeComponent();
            _selectedObjectiveAssessment = SelectedObjectiveAssessment;
            _dbService = dbService;
            _reloadCourses = reloadCourses;

            ObjectiveAssessmentNameEntry.Text = _selectedObjectiveAssessment.Name;
            ObjectiveAssessmentStartDatePicker.Date = _selectedObjectiveAssessment.StartDate;
            ObjectiveAssessmentEndDatePicker.Date = _selectedObjectiveAssessment.EndDate;
        }

        private async void cancelButton_Clicked(object sender, EventArgs e)
        {
            await Navigation.PopModalAsync();
        }

        private async void saveButton_Clicked(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(ObjectiveAssessmentNameEntry.Text))
            {
                await DisplayAlert("Error", "Please provide an assessment name.", "Okay");
                return;
            }

            if (ObjectiveAssessmentStartDatePicker.Date >= ObjectiveAssessmentEndDatePicker.Date)
            {
                await DisplayAlert("Error", "The start date must be before the end date.", "Okay");
                return;
            }

            _selectedObjectiveAssessment.Name = ObjectiveAssessmentNameEntry.Text.Trim();
            _selectedObjectiveAssessment.StartDate = ObjectiveAssessmentStartDatePicker.Date;
            _selectedObjectiveAssessment.EndDate = ObjectiveAssessmentEndDatePicker.Date;

            await _dbService.Update(_selectedObjectiveAssessment);
            await DisplayAlert("Success", "The objective assessment was successfully updated.", "Okay");
            _reloadCourses?.Invoke();
            await Navigation.PopModalAsync();
        }
    }
}