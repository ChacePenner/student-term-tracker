using System.Collections.ObjectModel;
using D424Capstone.Models;
using D424Capstone.Services;

namespace D424Capstone.Views
{
    public partial class EditPerformanceAssessment : ContentPage
    {
        private Assessment _selectedPerformanceAssessment;
        private readonly DatabaseService _dbService;
        private readonly Action _reloadCourses;
        public EditPerformanceAssessment(Assessment SelectedPerformanceAssessment, DatabaseService dbService, Action reloadCourses)
        {
            InitializeComponent();
            _selectedPerformanceAssessment = SelectedPerformanceAssessment;
            _dbService = dbService;
            _reloadCourses = reloadCourses;

            PerformanceAssessmentNameEntry.Text = _selectedPerformanceAssessment.Name;
            PerformanceAssessmentStartDatePicker.Date = _selectedPerformanceAssessment.StartDate;
            PerformanceAssessmentEndDatePicker.Date = _selectedPerformanceAssessment.EndDate;
        }

        private async void cancelButton_Clicked(object sender, EventArgs e)
        {
            await Navigation.PopModalAsync();
        }

        private async void saveButton_Clicked(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(PerformanceAssessmentNameEntry.Text))
            {
                await DisplayAlert("Error", "Please provide an assessment name.", "Okay");
                return;
            }

            if (PerformanceAssessmentStartDatePicker.Date >= PerformanceAssessmentEndDatePicker.Date)
            {
                await DisplayAlert("Error", "The start date must be before the end date.", "Okay");
                return;
            }

            _selectedPerformanceAssessment.Name = PerformanceAssessmentNameEntry.Text.Trim();
            _selectedPerformanceAssessment.StartDate = PerformanceAssessmentStartDatePicker.Date;
            _selectedPerformanceAssessment.EndDate = PerformanceAssessmentEndDatePicker.Date;

            await _dbService.Update(_selectedPerformanceAssessment);
            await DisplayAlert("Success", "The performance assessment was successfully updated.", "Okay");
            _reloadCourses?.Invoke();
            await Navigation.PopModalAsync();
        }
    }
}