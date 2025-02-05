using System.Collections.ObjectModel;
using D424Capstone.Models;
using D424Capstone.Services;

namespace D424Capstone.Views
{
    public partial class AddObjectiveAssessment : ContentPage
    {
        private readonly DatabaseService _dbService;
        private Course _selectedCourse;
        private readonly Action _reloadCourses;
        public AddObjectiveAssessment(DatabaseService dbService, Course selectedCourse, Action reloadCourses)
        {
            InitializeComponent();
            _dbService = dbService;
            _selectedCourse = selectedCourse;
            _reloadCourses = reloadCourses;
        }

        private async void saveButton_Clicked(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(ObjectiveAssessmentNameEntry.Text))
            {
                await DisplayAlert("Error", "Please provide an assesment name.", "Okay");
                return;
            }

            if (ObjectiveAssessmentStartDatePicker.Date >= ObjectiveAssessmentEndDatePicker.Date)
            {
                await DisplayAlert("Error", "The start date must be before the end date.", "Okay");
                return;
            }

            var newAssessment = new Assessment
            {
                Name = ObjectiveAssessmentNameEntry.Text.Trim(),
                StartDate = ObjectiveAssessmentStartDatePicker.Date,
                EndDate = ObjectiveAssessmentEndDatePicker.Date,
                CourseId = _selectedCourse.Id,
                Type = "Objective"
                //Objective vs Performance
            };

            await _dbService.Create(newAssessment);
            await DisplayAlert("Success", "The objective assessment was successfully added.", "Okay");
            _reloadCourses?.Invoke();
            await Navigation.PopModalAsync();
        }

        private async void cancelButton_Clicked(object sender, EventArgs e)
        {
            await Navigation.PopModalAsync();
        }
    }
}