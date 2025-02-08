using System.Collections.ObjectModel;
using D424Capstone.Models;
using D424Capstone.Services;
using D424Capstone.Views;
using SQLite;

namespace D424Capstone.Pages
{
    //Demonstration of task B - Encapsulation
    public partial class TermViewContentPage : ContentPage
    {
        private readonly DatabaseService _dbService;
        private ObservableCollection<Term> _terms;
        private List<Term> _allTerms;
        public TermViewContentPage(DatabaseService dbService)
        {
            InitializeComponent();
            _dbService = dbService;

            _terms = new ObservableCollection<Term>();
            _allTerms = new List<Term>();
            BindingContext = this;
            termsListView.ItemsSource = _terms;
        }

        protected override async void OnAppearing()
        //Initialize the database and ensure everything is loaded in the proper order.
        {
            base.OnAppearing();
            await _dbService.InitializeDatabase();
            LoadTerms();
            termsListView.SelectedItem = null;
        }

        private async void addTermButton_Clicked(object sender, EventArgs e)
        {
            var addTermPage = new AddTermContentPage(_dbService, _terms);
            //Pass the _dbService and _terms to allow the UI to automatically update.
            await Navigation.PushModalAsync(addTermPage);
        }

        private async void LoadTerms()
        {
            try
            {
                var terms = await _dbService.GetTerms();
                _allTerms.Clear();
                _allTerms.AddRange(terms);
                _terms.Clear();
                foreach (var term in _allTerms)
                {
                    _terms.Add(term);
                }
                ResultsLabel.IsVisible = false;
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Unable to load terms: {ex.Message}", "Okay");
            }
        }

        private async void editTermButton_Clicked(object sender, EventArgs e)
        {
            if (termsListView.SelectedItem is Term selectedTerm)
            {
                if (!_terms.Contains(selectedTerm))
                {
                    await DisplayAlert("Error", "The selected term is no longer available.", "Okay");
                    return;
                }

                var editTerm = new EditTerm(_dbService, _terms, selectedTerm);
                await Navigation.PushModalAsync(editTerm);
            }
            else
            {
                await DisplayAlert("Error", "Please select a term to edit.", "Okay");
            }
        }

        private async void deleteTermButton_Clicked(object sender, EventArgs e)
        {
            if (SelectedTerm != null)
            {
                bool confirm = await DisplayAlert("Delete", $"Are you sure you want to delete {SelectedTerm.Name}? All associated courses and assessments will also be deleted.", "Yes", "No");
                if (confirm)
                {
                    _terms.Remove(SelectedTerm);
                    await _dbService.Delete(SelectedTerm);
                    SelectedTerm = null;
                }
            }
        }

        private async void viewTermButton_Clicked(object sender, EventArgs e)
        {
            if (SelectedTerm != null)
            {
                var termDetail = new TermDetail(SelectedTerm, _dbService);
                //Pass the _dbService and _terms to allow the UI to automatically update.
                await Navigation.PushModalAsync(termDetail);
            }
        }

        private Term _selectedTerm;
        public Term SelectedTerm
        {
            get => _selectedTerm;
            set
            {
                _selectedTerm = value;
                OnPropertyChanged(nameof(SelectedTerm));
                OnPropertyChanged(nameof(IsTermSelected));
            }
        }
        public bool IsTermSelected
        {
            get
            {
                return SelectedTerm != null;
            }
        }

        private void OnTermSelected(object sender, SelectedItemChangedEventArgs e)
        {
            SelectedTerm = (Term)e.SelectedItem;
        }

        private async void generateReportButton_Clicked(object sender, EventArgs e)
        {
            var viewReport = new ViewReport();
            await Navigation.PushModalAsync(viewReport);
        }

        private async void termSearchBar_TextChanged(object sender, TextChangedEventArgs e)
        {
            string searchText = e.NewTextValue?.Trim() ?? string.Empty;

            if (string.IsNullOrWhiteSpace(searchText))
            {
                _terms.Clear();
                foreach (var term in _allTerms)
                {
                    _terms.Add(term);
                }
                ResultsLabel.IsVisible = false;
            }
            else
            {
                var filteredTerms = new List<Term>();
                var dbService = new DatabaseService();
                foreach (var term in _allTerms)
                {
                    var courses = await dbService.GetCoursesForTerm(term.Id);
                    if (courses.Any(c => c.Name.IndexOf(searchText, StringComparison.OrdinalIgnoreCase) >= 0))
                    {
                        filteredTerms.Add(term);
                    }
                }

                _terms.Clear();
                foreach (var term in filteredTerms)
                {
                    _terms.Add(term);
                }
                if (filteredTerms.Count > 0)
                {
                    ResultsLabel.Text = $"Now displaying all terms that contain a course named or partially named '{searchText}'.";
                    ResultsLabel.TextColor = Colors.Green;
                    ResultsLabel.IsVisible = true;
                }
                else
                {
                    ResultsLabel.Text = $"No terms contain a course with the name or partial name '{searchText}'.";
                    ResultsLabel.TextColor = Colors.Red;
                    ResultsLabel.IsVisible = true;
                }
                
            }
        }
    }
}