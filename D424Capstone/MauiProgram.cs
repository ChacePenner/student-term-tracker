using D424Capstone.Models;
using D424Capstone.Pages;
using D424Capstone.Services;
using D424Capstone.Views;
using Microsoft.Extensions.Logging;
using Plugin.LocalNotification;

namespace D424Capstone
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .UseLocalNotification()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

            builder.Services.AddTransient<TermViewContentPage>();
            builder.Services.AddTransient<AddTermContentPage>();
            builder.Services.AddTransient<EditTerm>();
            builder.Services.AddTransient<TermDetail>();
            builder.Services.AddTransient<AddCourse>();
            builder.Services.AddSingleton<DatabaseService>();
            builder.Services.AddTransient<Course>();
            builder.Services.AddTransient<ViewCourse>();
            builder.Services.AddTransient<EditCourse>();
            builder.Services.AddTransient<Term>();
            builder.Services.AddTransient<ViewReport>();
            builder.Services.AddTransient<Assessment>();
            builder.Services.AddTransient<CourseStatus>();
            builder.Services.AddTransient<AddObjectiveAssessment>();
            builder.Services.AddTransient<AddPerformanceAssessment>();
            builder.Services.AddTransient<EditObjectiveAssessment>();
            builder.Services.AddTransient<EditPerformanceAssessment>();

            //Add builder services for each new content page.

#if DEBUG
            builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
