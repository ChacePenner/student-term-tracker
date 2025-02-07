using System.Collections.ObjectModel;
using D424Capstone.Models;
using D424Capstone.Services;
using D424Capstone.Views;
using SQLite;

namespace D424Capstone.Views;

public partial class ViewReport : ContentPage
{
	public ViewReport()
	{
		InitializeComponent();
	}

    private async void cancelButton_Clicked(object sender, EventArgs e)
    {
        await Navigation.PopModalAsync();
    }

    private async void generateReportButton_Clicked(object sender, EventArgs e)
    {
        var termReport = new TermReport();

        string reportHtml = await termReport.GenerateReportTableAsync();

        reportDisplay.Source = new HtmlWebViewSource
        {
            Html = reportHtml
        };
    }
}