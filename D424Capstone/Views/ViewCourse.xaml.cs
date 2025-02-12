using System.Collections.ObjectModel;
using System.Globalization;
using System.Security.Cryptography.X509Certificates;
//using Android.App;
using D424Capstone.Models;
using D424Capstone.Services;
using D424Capstone.Views;
//using Javax.Security.Auth;
using Microsoft.Maui.Layouts;
using Plugin.LocalNotification;
using SQLite;

namespace D424Capstone.Views
{
    public partial class ViewCourse : ContentPage
    {
        //private readonly Course _course;
        private readonly DatabaseService _dbService;
        private ObservableCollection<Course> _courses;
        private readonly Action _reloadCourses;
        public Course SelectedCourse { get; private set; }
        public Assessment SelectedObjectiveAssessment { get; private set; }
        public Assessment SelectedPerformanceAssessment { get; private set; }


        public ViewCourse(Course course, DatabaseService dbService, ObservableCollection<Course> courses, Action reloadCourses)
        {
            InitializeComponent();
            SelectedCourse = course;
            _dbService = dbService;
            _courses = new ObservableCollection<Course>();
            _reloadCourses = reloadCourses;
            BindingContext = this;
        }

        private async void onDelete_Clicked(object sender, EventArgs e)
        {
            bool confirm = await DisplayAlert("Delete Course", $"Are you sure you want to delete {SelectedCourse.Name}? This action cannot be undone.", "Yes", "No");

            if (confirm)
            {
                await _dbService.Delete(SelectedCourse);
                await DisplayAlert("Deleted", "The course has been permanently deleted.", "Okay");
                _reloadCourses?.Invoke();
                await Navigation.PopModalAsync();
            }
        }

        private async void onEdit_Clicked(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new EditCourse(SelectedCourse, _dbService, _courses, _reloadCourses));
        }

        private async void backButton_Clicked(object sender, EventArgs e)
        {
            await Navigation.PopModalAsync();
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();
            {
                base.OnAppearing();
                var assessments = await _dbService.GetAssessmentsForCourse(SelectedCourse.Id);
                SelectedObjectiveAssessment = assessments.FirstOrDefault(a => a.Type == "Objective");
                SelectedPerformanceAssessment = assessments.FirstOrDefault(a => a.Type == "Performance");
                //Gets the Objective Assessment associated with the SelectedCourse via shared ID.
                await UpdateButtonVisibility();
                BindingContext = null;
                BindingContext = this;
            }
        }

        private async void onObjectiveAdd_Clicked(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new AddObjectiveAssessment(_dbService, SelectedCourse, _reloadCourses));
        }

        private async void onObjectiveDelete_Clicked(object sender, EventArgs e)
        {

            if (SelectedObjectiveAssessment != null)
            {
                bool confirm = await DisplayAlert("Delete Assessment", $"Are you sure you want to delete the objective assessment for {SelectedCourse.Name}? This action cannot be undone.", "Yes", "No");

                if (confirm)
                {
                    await _dbService.Delete(SelectedObjectiveAssessment);
                    await DisplayAlert("Deleted", "The objective assessment has been deleted. You may add a new objective assessment if desired.", "Okay");

                    var assessments = await _dbService.GetAssessmentsForCourse(SelectedCourse.Id);
                    SelectedObjectiveAssessment = assessments.FirstOrDefault(a => a.Type == "Objective");
                    await UpdateButtonVisibility();
                    BindingContext = null;
                    BindingContext = this;

                    _reloadCourses?.Invoke();
                }
            }
            else
            {
                await DisplayAlert("No Assessment", "There is currently no objective assessment to delete.", "Okay");
            }
        }

        private async Task UpdateButtonVisibility()
        //Ensures only the appropriate buttons are displayed based on the status of the Objective Assessment.
        {
            if (SelectedObjectiveAssessment != null)
            {
                ObjectiveDeleteButton.IsVisible = true;
                ObjectiveDeleteButton.IsEnabled = true;
                ObjectiveAddButton.IsVisible = false;
                ObjectiveAddButton.IsEnabled = false;
                ObjectiveEditButton.IsVisible = true;
                ObjectiveEditButton.IsEnabled = true;
                ObjectiveReminderButton.IsVisible = true;
                ObjectiveReminderButton.IsEnabled = true;
            }
            else
            {
                ObjectiveDeleteButton.IsVisible = false;
                ObjectiveDeleteButton.IsEnabled = false;
                ObjectiveAddButton.IsVisible = true;
                ObjectiveAddButton.IsEnabled = true;
                ObjectiveEditButton.IsVisible = false;
                ObjectiveEditButton.IsEnabled = false;
                ObjectiveReminderButton.IsVisible = false;
                ObjectiveReminderButton.IsEnabled = false;
            }

            if (SelectedPerformanceAssessment != null)
            {
                PerformanceDeleteButton.IsVisible = true;
                PerformanceDeleteButton.IsEnabled = true;
                PerformanceAddButton.IsVisible = false;
                PerformanceAddButton.IsEnabled = false;
                PerformanceEditButton.IsVisible = true;
                PerformanceEditButton.IsEnabled = true;
                PerformanceReminderButton.IsVisible = true;
                PerformanceReminderButton.IsEnabled = true;
            }
            else
            {
                PerformanceDeleteButton.IsVisible = false;
                PerformanceDeleteButton.IsEnabled = false;
                PerformanceAddButton.IsVisible = true;
                PerformanceAddButton.IsEnabled = true;
                PerformanceEditButton.IsVisible = false;
                PerformanceEditButton.IsEnabled = false;
                PerformanceReminderButton.IsVisible = false;
                PerformanceReminderButton.IsEnabled = false;
            }
        }

        private async void onPerformanceAdd_Clicked(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new AddPerformanceAssessment(_dbService, SelectedCourse, _reloadCourses));
        }

        private async void onPerformanceDelete_Clicked(object sender, EventArgs e)
        {
            if (SelectedPerformanceAssessment != null)
            {
                bool confirm = await DisplayAlert("Delete Assessment", $"Are you sure you want to delete the performance assessment for {SelectedCourse.Name}? This action cannot be undone.", "Yes", "No");

                if (confirm)
                {
                    await _dbService.Delete(SelectedPerformanceAssessment);
                    await DisplayAlert("Deleted", "The performance assessment has been deleted. You may add a new performance assessment if desired.", "Okay");

                    var assessments = await _dbService.GetAssessmentsForCourse(SelectedCourse.Id);
                    SelectedPerformanceAssessment = assessments.FirstOrDefault(a => a.Type == "Performance");
                    await UpdateButtonVisibility();
                    BindingContext = null;
                    BindingContext = this;

                    _reloadCourses?.Invoke();
                }
            }
            else
            {
                await DisplayAlert("No Assessment", "There is currently no performance assessment to delete.", "Okay");
            }
        }

        private async void onObjectiveEditButton_Clicked(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new EditObjectiveAssessment(SelectedObjectiveAssessment, _dbService, _reloadCourses));
        }

        private async void onPerformanceEdit_Clicked(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new EditPerformanceAssessment(SelectedPerformanceAssessment, _dbService, _reloadCourses));
        }

        private async void onCourseNotificationButton_Clicked(object sender, EventArgs e)
        {
            bool isNotificationsPermitted = await LocalNotificationCenter.Current.AreNotificationsEnabled();

            if (isNotificationsPermitted == false)
            {
                await LocalNotificationCenter.Current.RequestNotificationPermission();
            }

            if (isNotificationsPermitted == true)
            {
                int startNotificationId = GenerateCourseNotificationId(SelectedCourse.Id, "start");
                int endNotificationId = GenerateCourseNotificationId(SelectedCourse.Id, "end");
                //Converts SelectedCourse.Id and "start" or "end" into a unique identifier Id

                var pendingNotifications = await LocalNotificationCenter.Current.GetPendingNotificationList();
                //Gets all the currently pending notificaitons.

                bool startNotificationExists = false;
                bool endNotificationExists = false;

                //Checks if the notification already exists.
                foreach (var notification in pendingNotifications)
                {
                    if (notification.NotificationId == startNotificationId)
                    {
                        startNotificationExists = true;
                    }
                    if (notification.NotificationId == endNotificationId)
                    {
                        endNotificationExists = true;
                    }
                }

                if (startNotificationExists || endNotificationExists)
                {
                    bool replaceNotifications = await DisplayAlert("Reminders already exist", $"Reminders already exist for {SelectedCourse.Name}. Would you like to delete the current reminders?", "Yes", "No");
                    if (replaceNotifications)
                    {
                        if (startNotificationExists)
                        {
                            LocalNotificationCenter.Current.Cancel(startNotificationId);
                        }
                        if (endNotificationExists)
                        {
                            LocalNotificationCenter.Current.Cancel(endNotificationId);
                        }
                        await DisplayAlert("Reminders deleted.", $"The reminders for {SelectedCourse.Name} have been deleted. You may now add new reminders if desired.", "Okay");
                    }
                    else
                    {
                        return;
                    }
                }

                if (DateTime.Now >= SelectedCourse.EndDate)
                {
                    await DisplayAlert("Unable to Create Reminder", $"{SelectedCourse.Name} ended on {SelectedCourse.EndDate.Date}. Unable to create a reminder in the past.", "Okay");
                    return;
                }

                DateTime? customStartReminderTime = await PromptUserForReminderTime($"Schedule reminder for {SelectedCourse.Name} beginning.", SelectedCourse.StartDate);
                if (customStartReminderTime.HasValue && customStartReminderTime.Value < SelectedCourse.StartDate)
                {
                    var startDateReminder = new NotificationRequest
                    {
                        NotificationId = startNotificationId,
                        Title = $"{SelectedCourse.Name} starts on {SelectedCourse.StartDate}!",
                        Schedule = new NotificationRequestSchedule
                        {
                            NotifyTime = customStartReminderTime
                        }
                    };
                    await LocalNotificationCenter.Current.Show(startDateReminder);
                }

                DateTime? customEndReminderTime = await PromptUserForReminderTime($"Schedule reminder for {SelectedCourse.Name} ending.", SelectedCourse.EndDate);
                if (customEndReminderTime.HasValue && customEndReminderTime.Value < SelectedCourse.EndDate)
                {
                    var endDateReminder = new NotificationRequest
                    {
                        NotificationId = endNotificationId,
                        Title = $"{SelectedCourse.Name} ends on {SelectedCourse.EndDate}!",
                        Schedule = new NotificationRequestSchedule
                        {
                            NotifyTime = customEndReminderTime
                        }
                    };
                    await LocalNotificationCenter.Current.Show(endDateReminder);
                }
            }
        }

        private async Task<DateTime?> PromptUserForReminderTime(string title, DateTime courseDate)
        {
            DateTime? reminderTime = null;

            while (reminderTime == null)
            //the while loop makes sure the user can't move on to the next question without inputting the correct format or canceling.
            {
                string result = await DisplayPromptAsync(title, $"Enter a date and time before {courseDate} (follow the format MM/dd/yyyy hh:mm AM/PM):", "Set", "Cancel", "MM/dd/yyyy hh:mm AM/PM", maxLength: 20, keyboard: Keyboard.Text);

                if (result == null)
                {
                    return null;
                    //Allows the user to click Cancel
                }

                if (string.IsNullOrWhiteSpace(result))
                {
                    await DisplayAlert("Invalid Input", "The input cannot be empty or whitespace. Please enter a date and time.", "Okay");
                    continue;

                }

                if (DateTime.TryParseExact(result, "MM/dd/yyyy hh:mm tt", CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime parsedReminderTime))
                {
                    if (parsedReminderTime < courseDate)
                    {
                        reminderTime = parsedReminderTime;
                    }
                    else
                    {
                        reminderTime = null;
                    }
                    if (reminderTime == null)
                    {
                        await DisplayAlert("Invalid Input", $"The entered time must be before {courseDate}. Please try again.", "Okay");
                    }
                }
                else
                {
                    await DisplayAlert("Invalid Input", "The entered date and time format is invalid. Please try again.", "Okay");
                }
            }
            return reminderTime;
        }
        private int GenerateCourseNotificationId(int courseId, string type)
        {
            return $"{courseId}_{type.GetHashCode()}".GetHashCode();
            //This will use the SelectedCourseId passed into it to ensure that each notification
            //has a unique value as an int. This'll make it easy to track and delete notifications and prevent duplicates.
        }

        private int GenerateObjectiveAssessmentNotificationId(int objectiveAssessmentId, string type)
        {
            return $"{objectiveAssessmentId}_{type.GetHashCode()}".GetHashCode();
        }

        private int GeneratePerformanceAssessmentNotificationId(int performanceAssessmentId, string type)
        {
            return $"{performanceAssessmentId}_{type.GetHashCode()}".GetHashCode();
        }

        private async void onShareButton_Clicked(object sender, EventArgs e)
        {
            string notesToShare = SelectedCourse.Notes;
            await ShareText(notesToShare);
        }

        public async Task ShareText(string text)
        {
            await Share.Default.RequestAsync(new ShareTextRequest
            {
                Text = $"Greetings Instructor {SelectedCourse.InstructorName}. Your student would like to share the following course notes with you for {SelectedCourse.Name}:\n\n {text}",
                Title = $"Notes for {SelectedCourse.Name}"
            });
        }

        private async void onObjectiveReminder_Clicked(object sender, EventArgs e)
        {
            //await LocalNotificationCenter.Current.AreNotificationsEnabled();
            bool isNotificationsPermitted = await LocalNotificationCenter.Current.AreNotificationsEnabled();

            if (isNotificationsPermitted == false)
            {
                await LocalNotificationCenter.Current.RequestNotificationPermission();
            }

            if (isNotificationsPermitted == true)
            {
                int startNotificationId = GenerateObjectiveAssessmentNotificationId(SelectedObjectiveAssessment.Id, "start");
                int endNotificationId = GenerateObjectiveAssessmentNotificationId(SelectedObjectiveAssessment.Id, "end");
                //Converts SelectedObjectiveAssessment.Id and "start" or "end" into a unique identifier Id

                var pendingNotifications = await LocalNotificationCenter.Current.GetPendingNotificationList();
                //Gets all the currently pending notificaitons.

                bool startNotificationExists = false;
                bool endNotificationExists = false;

                //Checks if the notification already exists.
                foreach (var notification in pendingNotifications)
                {
                    if (notification.NotificationId == startNotificationId)
                    {
                        startNotificationExists = true;
                    }
                    if (notification.NotificationId == endNotificationId)
                    {
                        endNotificationExists = true;
                    }
                }

                if (startNotificationExists || endNotificationExists)
                {
                    bool replaceNotifications = await DisplayAlert("Reminders already exist", $"Reminders already exist for {SelectedObjectiveAssessment.Name}. Would you like to delete the current reminders?", "Yes", "No");
                    if (replaceNotifications)
                    {
                        if (startNotificationExists)
                        {
                            LocalNotificationCenter.Current.Cancel(startNotificationId);
                        }
                        if (endNotificationExists)
                        {
                            LocalNotificationCenter.Current.Cancel(endNotificationId);
                        }
                        await DisplayAlert("Reminders deleted.", $"The reminders for {SelectedObjectiveAssessment.Name} have been deleted. You may now add new reminders if desired.", "Okay");
                    }
                    else
                    {
                        return;
                    }
                }

                if (DateTime.Now >= SelectedObjectiveAssessment.EndDate)
                {
                    await DisplayAlert("Unable to Create Reminder", $"{SelectedObjectiveAssessment.Name} ended on {SelectedObjectiveAssessment.EndDate.Date}. Unable to create a reminder in the past.", "Okay");
                    return;
                }

                DateTime? customStartReminderTime = await PromptUserForReminderTime($"Schedule reminder for start of {SelectedObjectiveAssessment.Name}.", SelectedObjectiveAssessment.StartDate);
                if (customStartReminderTime.HasValue && customStartReminderTime.Value < SelectedObjectiveAssessment.StartDate)
                {
                    var startDateReminder = new NotificationRequest
                    {
                        NotificationId = startNotificationId,
                        Title = $"{SelectedObjectiveAssessment.Name}'s anticipated start date is: {SelectedObjectiveAssessment.StartDate}!",
                        Schedule = new NotificationRequestSchedule
                        {
                            NotifyTime = customStartReminderTime
                        }
                    };
                    await LocalNotificationCenter.Current.Show(startDateReminder);
                }

                DateTime? customEndReminderTime = await PromptUserForReminderTime($"Schedule reminder for {SelectedObjectiveAssessment.Name}'s anticipated end date.", SelectedObjectiveAssessment.EndDate);
                if (customEndReminderTime.HasValue && customEndReminderTime.Value < SelectedObjectiveAssessment.EndDate)
                {
                    var endDateReminder = new NotificationRequest
                    {
                        NotificationId = endNotificationId,
                        Title = $"{SelectedObjectiveAssessment.Name}'s anticipated end date is {SelectedObjectiveAssessment.EndDate}!",
                        Schedule = new NotificationRequestSchedule
                        {
                            NotifyTime = customEndReminderTime
                        }
                    };
                    await LocalNotificationCenter.Current.Show(endDateReminder);
                }
            }
        }

        private async void onPerformanceReminder_Clicked(object sender, EventArgs e)
        {
            //await LocalNotificationCenter.Current.AreNotificationsEnabled();
            bool isNotificationsPermitted = await LocalNotificationCenter.Current.AreNotificationsEnabled();

            if (isNotificationsPermitted == false)
            {
                await LocalNotificationCenter.Current.RequestNotificationPermission();
            }

            if (isNotificationsPermitted == true)
            {
                int startNotificationId = GeneratePerformanceAssessmentNotificationId(SelectedPerformanceAssessment.Id, "start");
                int endNotificationId = GeneratePerformanceAssessmentNotificationId(SelectedPerformanceAssessment.Id, "end");
                //Converts SelectedPerformanceAssessment.Id and "start" or "end" into a unique identifier Id

                var pendingNotifications = await LocalNotificationCenter.Current.GetPendingNotificationList();
                //Gets all the currently pending notificaitons.

                bool startNotificationExists = false;
                bool endNotificationExists = false;

                //Checks if the notification already exists.
                foreach (var notification in pendingNotifications)
                {
                    if (notification.NotificationId == startNotificationId)
                    {
                        startNotificationExists = true;
                    }
                    if (notification.NotificationId == endNotificationId)
                    {
                        endNotificationExists = true;
                    }
                }

                if (startNotificationExists || endNotificationExists)
                {
                    bool replaceNotifications = await DisplayAlert("Reminders already exist", $"Reminders already exist for {SelectedPerformanceAssessment.Name}. Would you like to delete the current reminders?", "Yes", "No");
                    if (replaceNotifications)
                    {
                        if (startNotificationExists)
                        {
                            LocalNotificationCenter.Current.Cancel(startNotificationId);
                        }
                        if (endNotificationExists)
                        {
                            LocalNotificationCenter.Current.Cancel(endNotificationId);
                        }
                        await DisplayAlert("Reminders deleted.", $"The reminders for {SelectedPerformanceAssessment.Name} have been deleted. You may now add new reminders if desired.", "Okay");
                    }
                    else
                    {
                        return;
                    }
                }

                if (DateTime.Now >= SelectedPerformanceAssessment.EndDate)
                {
                    await DisplayAlert("Unable to Create Reminder", $"{SelectedPerformanceAssessment.Name} ended on {SelectedPerformanceAssessment.EndDate.Date}. Unable to create a reminder in the past.", "Okay");
                    return;
                }

                DateTime? customStartReminderTime = await PromptUserForReminderTime($"Schedule reminder for start of {SelectedPerformanceAssessment.Name}.", SelectedPerformanceAssessment.StartDate);
                if (customStartReminderTime.HasValue && customStartReminderTime.Value < SelectedPerformanceAssessment.StartDate)
                {
                    var startDateReminder = new NotificationRequest
                    {
                        NotificationId = startNotificationId,
                        Title = $"{SelectedPerformanceAssessment.Name}'s anticipated start date is: {SelectedPerformanceAssessment.StartDate}!",
                        Schedule = new NotificationRequestSchedule
                        {
                            NotifyTime = customStartReminderTime
                        }
                    };
                    await LocalNotificationCenter.Current.Show(startDateReminder);
                }

                DateTime? customEndReminderTime = await PromptUserForReminderTime($"Schedule reminder for {SelectedPerformanceAssessment.Name}'s anticipated end date.", SelectedPerformanceAssessment.EndDate);
                if (customEndReminderTime.HasValue && customEndReminderTime.Value < SelectedPerformanceAssessment.EndDate)
                {
                    var endDateReminder = new NotificationRequest
                    {
                        NotificationId = endNotificationId,
                        Title = $"{SelectedPerformanceAssessment.Name}'s anticipated end date is {SelectedPerformanceAssessment.EndDate}!",
                        Schedule = new NotificationRequestSchedule
                        {
                            NotifyTime = customEndReminderTime
                        }
                    };
                    await LocalNotificationCenter.Current.Show(endDateReminder);
                }
            }
        }
    }
}