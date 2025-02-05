using System.Collections.ObjectModel;
using D424Capstone.Models;
using D424Capstone.Services;

namespace D424Capstone.Views
{
    public partial class AddCourse : ContentPage
    {
        private readonly DatabaseService _dbService;
        private readonly int _termId;
        private readonly Action _reloadCourses;
        public AddCourse(DatabaseService dbService, int termId, Action reloadCourses)
        {
            InitializeComponent();
            _dbService = dbService;
            _termId = termId;
            _reloadCourses = reloadCourses;
        }

        private async void saveCourseButton_Clicked(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(courseNameEntry.Text))
            {
                await DisplayAlert("Error", "Please provide a course name.", "Okay");
                return;
            }

            if (courseStartDatePicker.Date >= courseEndDatePicker.Date)
            {
                await DisplayAlert("Error", "The start date must be before the end date.", "Okay");
                return;
            }

            if (string.IsNullOrWhiteSpace(instructorNameEntry.Text))
            {
                await DisplayAlert("Error", "Please provide an instructor name.", "Okay");
                return;
            }

            if (string.IsNullOrEmpty(instructorPhoneEntry.Text) || !System.Text.RegularExpressions.Regex.IsMatch(instructorPhoneEntry.Text, @"^[\d-]+$"))
            {
                await DisplayAlert("Error", "Instructor phone number may only contain numbers and hyphens and cannot be empty.", "Okay");
                return;
            }

            if (string.IsNullOrEmpty(instructorEmailEntry.Text) || !System.Text.RegularExpressions.Regex.IsMatch(instructorEmailEntry.Text, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                await DisplayAlert("Error", "Instructor email must be valid and cannot be empty.", "Okay");
                return;
            }

            if (string.IsNullOrEmpty(courseNotes.Text))
            {
                courseNotes.Text = "No notes provided.";
            }

            var course = new Course
            {
                Name = courseNameEntry.Text.Trim(),
                StartDate = courseStartDatePicker.Date,
                EndDate = courseEndDatePicker.Date,
                InstructorName = instructorNameEntry.Text.Trim(),
                InstructorPhone = instructorPhoneEntry.Text.Trim(),
                InstructorEmail = instructorEmailEntry.Text.Trim(),
                Notes = courseNotes.Text.Trim(),
                TermId = _termId,
                Status = courseStatusPicker.SelectedItem.ToString(),
            };

            await _dbService.Create(course);
            await DisplayAlert("Success", "The course was successfully added.", "Okay");
            _reloadCourses?.Invoke();
            await Navigation.PopModalAsync();
        }

        private async void cancelButton_Clicked(object sender, EventArgs e)
        {
            await Navigation.PopModalAsync();
        }
    }
}