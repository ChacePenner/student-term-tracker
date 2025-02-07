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
            Title = "Term Report";
            Terms = new List<Term>();
            
        }

        public override async Task GenerateReport()
        {
            var databaseService = new DatabaseService();

            var allTerms = await databaseService.GetTerms();
            //Debug console
            Console.WriteLine($"Total Terms Retrieved: {allTerms.Count()}");

            foreach (var term in allTerms)
            {
                Terms.Add(term);
            }

            foreach (var term in Terms)
            {
                var courses = await databaseService.GetCoursesForTerm(term.Id);
                //Debug Console
                Console.WriteLine($"Courses for Term {term.Name}: {courses.Count()}");

                foreach (var course in courses)
                {
                    Console.WriteLine($"{course.Name} ({course.DateRange})");
                }
            }
        }

        public async Task<string> GenerateReportTableAsync()
        {
            await GenerateReport();
            StringBuilder reportTable = new StringBuilder();
            reportTable.AppendLine($"<p>Report Generated on: {DateTimeStamp:MM/dd/yyyy hh:mm tt}</p>");
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
