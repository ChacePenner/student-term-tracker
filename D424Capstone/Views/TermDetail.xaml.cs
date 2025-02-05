using System.Collections.ObjectModel;
using D424Capstone.Models;
using D424Capstone.Services;
using D424Capstone.Views;
using SQLite;

namespace D424Capstone.Views
{
    public partial class TermDetail : ContentPage
    {
        private readonly Term _term;
        private readonly DatabaseService _dbService;
        private string _termDetails;

        public ObservableCollection<Course> Courses { get; set; }

        public string TermDetails
        {
            get { return _termDetails; }
            set { _termDetails = value; }
        }
        public TermDetail(Term term, DatabaseService dbService)
        {
            InitializeComponent();
            _term = term;
            _dbService = dbService;

            TermDetails = _term.Name + $"\n{_term.DateRange}";
            BindingContext = this;

            Courses = new ObservableCollection<Course>();
            LoadCourses();
        }

        private async void LoadCourses()
        {
            var courses = await _dbService.GetCoursesForTerm(_term.Id);
            Courses.Clear();
            foreach (var course in courses)
            {
                Courses.Add(course);
            }

            coursesListview.ItemsSource = null;
            coursesListview.ItemsSource = Courses;
        }
        private async void addCourseButton_Clicked(object sender, EventArgs e)
        {
            var courseCount = await _dbService.GetCourseCountForTerm(_term.Id);

            if (courseCount >= 6)
            {
                await DisplayAlert("Error", "Each term may only have a maximum of six courses.", "Okay.");
                return;
            }

            var addCoursePage = new AddCourse(_dbService, _term.Id, LoadCourses);
            await Navigation.PushModalAsync(addCoursePage);
        }

        private async void backButton_Clicked(object sender, EventArgs e)
        {
            await Navigation.PopModalAsync();
        }

        private async void OnCourseSelected(object sender, SelectionChangedEventArgs e)
        {
            if (e.CurrentSelection.Count > 0)
            {
                var selectedCourse = e.CurrentSelection[0] as Course;
                if (selectedCourse != null)
                {
                    var viewCoursePage = new ViewCourse(selectedCourse, _dbService, Courses, LoadCourses);
                    await Navigation.PushModalAsync(viewCoursePage);

                    coursesListview.SelectedItem = null;
                }
            }
        }
    }
}