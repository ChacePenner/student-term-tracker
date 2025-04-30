# Student Term Tracker - An Android application by Chace Penner

- [About ❓](#about-)
- [Setting Up the Application 📃](#setting-up-the-application-)
   * [Introduction](#introduction)
   * [Installation](#installation)
- [Using the Application 💻](#using-the-application-)
   * [Register and Login](#register-and-login)
   * [Adding, Editing, Deleting, and Viewing a Term](#adding-editing-deleting-and-viewing-a-term)
   * [Adding, Editing, Deleting, and Viewing a Course](#adding-editing-deleting-and-viewing-a-course)
   * [Setting Course Reminders and Sharing Notes](#setting-course-reminders-and-sharing-notes)
   * [Adding, Editing, and Deleting Course Assessments](#adding-editing-and-deleting-course-assessments)
   * [Setting Assessment Reminders](#setting-assessment-reminders)
   * [Searching for Courses](#searching-for-courses)
   * [Generating a Report](#generating-a-report)

# About ❓

The Student Term Tracker is an Android application that utilizes SQLite to allow users to create and track their terms, courses, and assessments. 
The SQLite database allows users to create multiple individual profiles on the same device using secure username and password storage. 
The mobile application offers a term report function to easily view all terms, their respective courses, and start and end dates.

# Setting Up the Application 📃

## Introduction

The user guide is separated into two parts. The first part explains how to download,
install, and test the mobile application with Android Studio. The second part explains how to
interact with the application from a user perspective.

The application may also be installed directly onto any Android device.

## Installation

1. Download the Application File

    a. Download .apk file labeled “student_term_tracker.apk”
       
    b. Save the file onto your desktop, where it can be accessed later. This file is the
       installable package for the mobile app.
   
2. Install Android Studio
   
    a. Download Android Studio from the official website.
   
    b. Follow the on-screen installation instructions to install Android Studio onto
       your computer. Android Studio is required to manage Android emulators.
   
3. Launch Android Studio and Access the Device Manager

    a. Click the hamburger menu (three horizontal lines) in the top left corner.
   
   ![image](https://github.com/user-attachments/assets/eab7d7f4-c031-42b0-8ade-756346c0d380)

   b. Navigate to Tools > Device Manager. This menu allows you to view and manage Android emulators.

   ![image](https://github.com/user-attachments/assets/f74dea71-2472-4118-9159-17fecde7b241)


4. Create a New Virtual Device

    a. In the Device Manager, click the + button and select Create New Virtual
       Device.

   ![image](https://github.com/user-attachments/assets/ec4b78d7-2d70-49d0-875a-33bbc296d6dd)

   b. Choose the Pixel 7 option and click Next.

   ![image](https://github.com/user-attachments/assets/a8a12b69-58d9-4d1b-a542-075108b3f70f)

   c. Select the VanillaIceCream API 35 option and click Next.

   ![image](https://github.com/user-attachments/assets/3977ed63-aa37-449b-925a-c7c1f091c481)

   d. Leave the default options unchanged and click Finish. This process sets up a new emulator configured with the desired device and API level.

5. Start the Emulator
   
    a. Locate the newly created virtual device in the Device Manager.
   
    b. Click the triangular start button (play icon) to the right of it.

   ![image](https://github.com/user-attachments/assets/cdbb4484-bae8-4f22-a421-14443dd35fb9)

   c. Wait for the emulator to launch and load the Android home screen.

6. Install the Application on the Emulator

    a. With the emulator running, locate the downloaded .apk file on your Desktop.
   
    b. Click and drop the .apk file onto the emulator window.
   
    c. Watch for an installation alert on the emulator.
   
7. Launch the Application
   
    a. Once the installation completes, swipe up from the bottom of the emulator
       screen by holding left click on your mouse and moving it up from the bottom
       of the emulator screen.
   
    b. Click on the purple icon labeled. NET C971.

   ![image](https://github.com/user-attachments/assets/53367ba6-77f6-4b5a-b75b-497f9fb09c22)

   c. The emulator has now been successfully installed and launched.

   
# Using the Application 💻

## Register and Login

You will be presented with the login page upon opening the application. First, you must
register a username and password to use to login. To do so, select the “Register” button, enter a
username and password, and select the green “Register” button to save your username and
password. After, you will be returned to the login page where you can enter the registered
username and password and select the “Login” button.

![image](https://github.com/user-attachments/assets/d33343d7-e50c-463d-af2a-22445451aa84)


## Adding, Editing, Deleting, and Viewing a Term

The application will navigate to the Term View page after a successful login. To add a
term, select the +Add Term button. You will be taken to the Add Term screen where you must
enter a term name and select the start date and end date of the term via a date picker. When you
are satisfied with your selection, select the green save button. The term will not save unless the
start date is set before the end date. Otherwise, the application will present you with an error
informing you to correct this mistake. Upon success, you will see the new term populated on the
Term View page.

![image](https://github.com/user-attachments/assets/9a5d0b6b-3d23-44cc-8b31-c08d7b65c276)


To edit a term, click the term in the view and select the Edit button. You will be taken to the Edit
Term page, where the term information will be pre-populated. You can change any details you
would like and cancel or save the term changes.

![image](https://github.com/user-attachments/assets/c08d469a-d998-4509-8a4e-46b82e4cbd88)



To delete a term, select the term in the term view and click Delete. Confirm or deny the deletion
via the confirmation window.

![image](https://github.com/user-attachments/assets/84aa83d0-ceee-4cd3-a03a-3b39401bbdff)


To view inside a term, select the term in the term view and click the View button.

![image](https://github.com/user-attachments/assets/11de312a-eb20-46e0-a4d2-cf7aa51666d6)


## Adding, Editing, Deleting, and Viewing a Course

You can now add a course on the term view page. To do so, select the +Add Course
button. You will be taken to a screen where you can enter the course name, start and end dates,
instructor name, instructor phone number, instructor email, course notes, and course status. By
default, the course status is set to “Not Started”. You must only provide the course name, start
date, and end date. If you wish to provide your instructor’s phone number and email, the phone
number field will only accept numbers and hyphens, and the email field must follow proper
email formatting. Press the Save button to save your course and automatically populate the
course in the term view.

![image](https://github.com/user-attachments/assets/5431dbec-132f-4eee-974a-7fd11333d05b)

![image](https://github.com/user-attachments/assets/a57ad8dc-cec8-45ee-899e-5c3ddc9c4f7c)



To view a course, select it. You will be taken to the course details page. At the top will be
the course name, indicating which course you are viewing. The course details will be displayed.
To edit the course, select the Edit Course button and change any details about the course. To
delete the course, select the Delete Course button. Confirm your deletion via the confirmation
dialogue.

![image](https://github.com/user-attachments/assets/56eb2237-09c0-44a4-92ec-c098559c9726)

![image](https://github.com/user-attachments/assets/feb2c804-7b1c-4d63-a0d8-d75e6c0f3f30)


## Setting Course Reminders and Sharing Notes

You may set a course reminder by selecting the bell icon above the delete button. The
first time you utilize this feature, you will be asked if you would like to allow the application to
send you notifications. Select “Allow” and then select the bell button again. You will be asked to
select the first reminder for the course. This reminder is when you would like to be reminded
about the course beginning. The reminder must be before the actual start date of the course. Enter
your desired date by following the format MM/dd/yyyy hh:mm AM/PM. For example,
02/17/2025 08:00 AM for February 17th, 2025 at 8:00 AM. After, you will be asked to provide
the date and time for the second reminder. This reminder is for when you would like to be
reminded about the course ending. The reminder must be set before the actual end date of the
course. Follow the same format as the first reminder.

![image](https://github.com/user-attachments/assets/1a316ec0-465b-40d0-82e0-4ac47127943b)


To share your notes with your instructor, select the share icon above the edit course button. You
may share your notes however your device allows. For instance, you can select the double
rectangle button to copy the sharing text, or you may select the messages icon to share your notes
via your messages app.

![image](https://github.com/user-attachments/assets/f7299877-056f-4215-a1f0-c2b93ce94aab)

![image](https://github.com/user-attachments/assets/84f53c73-0c7a-4053-9508-e15b8643ba9c)

## Adding, Editing, and Deleting Course Assessments

You are able to add one objective assessment and one performance assessment to each
course. To do so, navigate to the course details screen. From there, scroll down and select the
“Add” button underneath the respective assessment. Enter the assessment name and start and end
dates and click Save. After adding an assessment, the Add button will be replaced with a Delete
and Edit button. Select the Delete button to delete the assessment. Select the Edit button to
navigate to the Edit Assessment screen. Change any details you wish and select save.

![image](https://github.com/user-attachments/assets/59df5519-5ed7-4ff7-849a-e5f249518c63)

![image](https://github.com/user-attachments/assets/2d34199b-2285-4d8b-8177-ae1add5d4c86)

![image](https://github.com/user-attachments/assets/153b7447-25b9-492b-8de7-bc5d651f817c)


## Setting Assessment Reminders

After you have added an assessment, a bell icon will appear next to it. You can select the
bell icon to set a reminder for the assessment. Follow the prompt on the screen to set a reminder
for when the assessment begins and a second reminder for when the assessment ends. You cannot
set reminders in the past. Ensure that each reminder takes place on a date later than the current
date.

![image](https://github.com/user-attachments/assets/56d3718c-e5ba-4aa8-917c-3dcde4fe2cda)


## Searching for Courses

To search for a course, navigate to the Term View page. Find the text box with the text
“Search for a course within a term...” Select in the text box and type in the name or partial name
of a course. The list of terms will now be filtered to only show the term or terms that contain a
course with the provided text. To stop searching for a course, delete the text or select the X
button within the text field.

![image](https://github.com/user-attachments/assets/db568f7f-f565-4fb7-999d-43d56abb9329)



## Generating a Report

To generate a report that displays every term and course within a term, navigate to the
Term View page. Select the purple Generate Report option to navigate to the Generate Report
page. Select the green Generate Report button to generate a table of each term and their
respective courses. If a term does not contain any courses, it will not show up on the generated
table. The table will generate a date time stamp of the current date and time when the report was
generated. To navigate back, select the Cancel button.

![image](https://github.com/user-attachments/assets/4ef169ab-5aec-47e9-9797-2c74d054d4db)
