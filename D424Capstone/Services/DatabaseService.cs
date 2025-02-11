using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using D424Capstone.Models;
using D424Capstone.Views;
using SQLite;

namespace D424Capstone.Services
{
    public class DatabaseService
    {

        private readonly SQLiteAsyncConnection _dbConnection;

        public DatabaseService()
        {
            try
            {
                string dbPath = Path.Combine(FileSystem.AppDataDirectory, "D424Capstone.db3");

                _dbConnection = new SQLiteAsyncConnection(dbPath);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                Console.WriteLine($"Stack Trace: {ex.StackTrace}");
            }
        }
        //Sets up Database Connection

        public async Task InitializeDatabase()
        {
            try
            {
                await _dbConnection.ExecuteAsync("PRAGMA foreign_keys = ON;");
                await CreateTablesAsync();

                var existingTerms = await GetTerms();
                if (!existingTerms.Any())
                {
                    await PreloadEvaluationData();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in initialization: {ex.Message}");
            }
            await SetCourseStatuses();
        }
        private async Task CreateTablesAsync()
        {
            await _dbConnection.CreateTableAsync<Term>();
            await _dbConnection.CreateTableAsync<Course>();
            await _dbConnection.CreateTableAsync<Assessment>();
            await _dbConnection.CreateTableAsync<CourseStatus>();
            await _dbConnection.CreateTableAsync<Users>();
        }
        public async Task<List<Term>> GetTerms()
        {
            return await _dbConnection.Table<Term>().ToListAsync();
        }

        //Returns all terms

        public async Task Create(Term term)
        {
            await _dbConnection.InsertAsync(term);
        }
        //Facilitates creating a new term.
        public async Task Update(Term term)
        {
            await _dbConnection.UpdateAsync(term);
        }
        //Facilitates updating the term.

        public async Task Delete(Term term)
        {
            await _dbConnection.DeleteAsync(term);
        }
        //Facilitates deleting a term

        public async Task Create(Course course)
        {
            await _dbConnection.InsertAsync(course);
        }

        public async Task Delete(Course course)
        {
            await _dbConnection.DeleteAsync(course);
        }

        public async Task Update(Course course)
        {
            await _dbConnection.UpdateAsync(course);
        }

        public async Task<List<Course>> GetCoursesForTerm(int termId)
        {
            var courses = await _dbConnection.Table<Course>().ToListAsync();
            var result = new List<Course>();

            foreach (var course in courses)
            {
                if (course.TermId == termId)
                {
                    result.Add(course);
                }
            }
            return result;
        }

        public async Task<int> GetCourseCountForTerm(int termId)
        {
            var courses = await _dbConnection.Table<Course>().ToListAsync();
            int count = 0;

            foreach (var course in courses)
            {
                if (course.TermId == termId)
                {
                    count++;
                }
            }
            return count;
        }

        public async Task Create(Assessment assessment)
        {
            await _dbConnection.InsertAsync(assessment);
        }

        public async Task Delete(Assessment assessment)
        {
            await _dbConnection.DeleteAsync(assessment);
        }

        public async Task Update(Assessment assessment)
        {
            await _dbConnection.UpdateAsync(assessment);
        }

        public async Task<List<Assessment>> GetAssessmentsForCourse(int courseId)
        {
            var assessments = await _dbConnection.Table<Assessment>().ToListAsync();
            var result = new List<Assessment>();

            foreach (var assessment in assessments)
                if (assessment.CourseId == courseId)
                {
                    result.Add(assessment);
                }
            return result;
        }
        private async Task PreloadEvaluationData()
        {
            var term = new Term
            {
                Name = "Student Term 1",
                StartDate = new DateTime(2025, 1, 1),
                EndDate = new DateTime(2025, 6, 30)
            };
            await Create(term);

            var course = new Course
            {
                Name = "C# and You",
                StartDate = new DateTime(2025, 2, 1),
                EndDate = new DateTime(2025, 2, 28),
                InstructorName = "Anika Patel",
                InstructorEmail = "anika.patel@strimeuniversity.edu",
                InstructorPhone = "555-123-4567",
                Notes = "C# and You is a beginner course for students who have no prior experience with C#. We recommend that students utilize Udemy.com to get started.",
                Status = "Not Started",
                TermId = term.Id
            };
            await Create(course);

            var objectiveAssessment = new Assessment
            {
                Name = "C# Zybooks",
                Type = "Objective",
                StartDate = new DateTime(2025, 2, 1),
                EndDate = new DateTime(2025, 2, 14),
                CourseId = course.Id
            };
            await Create(objectiveAssessment);

            var performanceAssessment = new Assessment
            {
                Name = "C# Snake Game",
                Type = "Performance",
                StartDate = new DateTime(2025, 2, 15),
                EndDate = new DateTime(2025, 2, 28),
                CourseId = course.Id
            };
            await Create(performanceAssessment);
        }

        public async Task<List<CourseStatus>> GetCourseStatuses()
        {
            return await _dbConnection.Table<CourseStatus>().ToListAsync();
        }

        private async Task SetCourseStatuses()
        {
            var statuses = await GetCourseStatuses();
            if (!statuses.Any())
            {
                await _dbConnection.InsertAsync(new CourseStatus { Name = "Not Started" });
                await _dbConnection.InsertAsync(new CourseStatus { Name = "In Progress" });
                await _dbConnection.InsertAsync(new CourseStatus { Name = "Completed" });
                await _dbConnection.InsertAsync(new CourseStatus { Name = "Dropped" });
            }
        }

        public async Task<List<Users>> GetUsers()
        {
            return await _dbConnection.Table<Users>().ToListAsync();
        }

        public async Task<int> Create(Users user)
        {
            return await _dbConnection.InsertAsync(user);
        }
    }
}

