using System.Collections.ObjectModel;
using D424Capstone.Models;
using D424Capstone.Services;

namespace D424Capstone.Views
{
    public partial class EditCourse : ContentPage
    {
        private readonly ObservableCollection<Course> _courses;
        //Ensures the UI will automatically update after editing the course.
        private readonly Course _selectedCourse;
        private readonly DatabaseService _dbService;
        private readonly Action _reloadCourses;
        public EditCourse(Course course, DatabaseService dbService, ObservableCollection<Course> courses, Action reloadCourses)
        {
            InitializeComponent();
            _selectedCourse = course;
            _dbService = dbService;
            _courses = courses;
            _reloadCourses = reloadCourses;

            courseNameEntry.Text = _selectedCourse.Name;
            courseStartDatePicker.Date = _selectedCourse.StartDate;
            courseEndDatePicker.Date = _selectedCourse.EndDate;
            instructorNameEntry.Text = _selectedCourse.InstructorName;
            instructorPhoneEntry.Text = _selectedCourse.InstructorPhone;
            instructorEmailEntry.Text = _selectedCourse.InstructorEmail;
            courseNotes.Text = _selectedCourse.Notes;
            courseStatusPicker.SelectedItem = _selectedCourse.Status;
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();
            await LoadCourseStatuses();
        }
        private async void saveCourseButton_Clicked(object sender, EventArgs e)
        {
            //Demonstration of task B - Validation
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

            _selectedCourse.Name = courseNameEntry.Text.Trim();
            _selectedCourse.StartDate = courseStartDatePicker.Date.ToLocalTime();
            _selectedCourse.EndDate = courseEndDatePicker.Date.ToLocalTime();
            _selectedCourse.InstructorName = instructorNameEntry.Text.Trim();
            _selectedCourse.InstructorPhone = instructorPhoneEntry.Text.Trim();
            _selectedCourse.InstructorEmail = instructorEmailEntry.Text.Trim();
            _selectedCourse.Notes = courseNotes.Text.Trim();
            var selectedStatus = (CourseStatus)courseStatusPicker.SelectedItem;
            _selectedCourse.Status = selectedStatus.Name;

            await _dbService.Update(_selectedCourse);

            int index = -1;
            for (int i = 0; i < _courses.Count; i++)
            {
                if (_courses[i].Id == _selectedCourse.Id)
                {
                    index = i;
                    break;
                }
            }
            if (index >= 0)
            {
                _courses[index] = _selectedCourse;
            }

            await DisplayAlert("Success", "The course was successfully updated.", "Okay");
            _reloadCourses?.Invoke();
            await Navigation.PopModalAsync();
        }

        private async void cancelButton_Clicked(object sender, EventArgs e)
        {
            await Navigation.PopModalAsync();
        }

        private async Task LoadCourseStatuses()
        {
            try
            {
                var statuses = await _dbService.GetCourseStatuses();
                courseStatusPicker.ItemsSource = statuses;
                if (statuses.Count > 0)
                {
                    courseStatusPicker.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Unable to load course statuses: {ex.Message}", "Okay");
            }
        }
    }
}