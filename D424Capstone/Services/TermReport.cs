using D424Capstone.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace D424Capstone.Services
{
    public class TermReport : Report
    {
        public List<Term> Terms { get; set; }

        public TermReport()
        {
            Title = "WGU STUDENT REPORT";
            Terms = new List<Term>();
            
        }

        public override async Task GenerateReport()
        {
            var databaseService = new DatabaseService();

            try
            {
                int userId = int.Parse(await SecureStorage.GetAsync("CurrentUserId"));
                var allTerms = await databaseService.GetTermsForUser(userId);

                List<Term> userTerms = new List<Term>();

                foreach (var term in allTerms)
                {
                    if (term.UserId == userId)
                    {
                        userTerms.Add(term);
                    }
                }

                foreach (var term in userTerms)
                {
                    Terms.Add(term);
                }

                foreach (var term in userTerms)
                {
                    var courses = await databaseService.GetCoursesForTerm(term.Id);

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error generating report: {ex.Message}");
            }
        }

        public async Task<string> GenerateReportTableAsync()
        {
            await GenerateReport();
            StringBuilder reportTable = new StringBuilder();
            reportTable.AppendLine($"<h2 style='text-align: center; font-weight: bold;'>{Title}</h2>");
            reportTable.AppendLine($"<p style='text-align: center;'>Report Generated on: {DateTimeStamp:MM/dd/yyyy hh:mm tt}</p>");
            reportTable.AppendLine("<table border='1'>");
            reportTable.AppendLine("<thead><tr><th>Term</th><th>Course</th><th>Start Date</th><th>End Date</th></tr></thead>");
            reportTable.AppendLine("<tbody>");

            if (Terms.Count == 0)
            {
                reportTable.AppendLine("<tr><td colspan='4'>No terms have been added.</td></tr>");
            }

            foreach (var term in Terms)
            {
                var courses = await new DatabaseService().GetCoursesForTerm(term.Id);
                foreach (var course in courses)
                {
                    reportTable.AppendLine($"<tr><td>{term.Name}</td><td>{course.Name}</td><td>{course.StartDate:MM/dd/yyyy}</td><td>{course.EndDate:MM/dd/yyyy}</td></tr>");
                }
            }

            reportTable.AppendLine("</tbody>");
            reportTable.AppendLine("</table>");

            return reportTable.ToString();
        }
        
    }
}
