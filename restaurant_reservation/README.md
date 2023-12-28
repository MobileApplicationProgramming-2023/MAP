Table Quest
Table Quest is a mobile application designed to streamline the table reservation process, making it convenient for both customers and restaurant manager. This app is built using Dart and Flutter for the frontend, and Firebase for backend services.

Features
Table Reservation: Allows users to browse available tables, select desired time slots, and make reservations seamlessly.

Real-time Updates: Utilize Firebase to provide real-time updates on table availability and reservation status.

User Authentication: Ensure secure access to the app with user authentication powered by Firebase Authentication.

Intuitive UI: Create a user-friendly interface with Flutter to enhance the overall user experience.

Technologies Used
Dart: The programming language used for building the application.

Flutter: The UI toolkit for developing natively compiled applications for mobile, web, and desktop from a single codebase.

Firebase: A comprehensive mobile and web app development platform that provides a variety of services including authentication, real-time database, and hosting.

Getting Started
Prerequisites

Make sure you have Flutter and Dart installed on your development machine.
Create a Firebase project and set up the necessary configurations.
Clone the Repository

bash
Copy code
git clone https://github.com/your-username/table-quest.git
Navigate to the Project Directory

bash
Copy code
cd table-quest
Install Dependencies

bash
Copy code
flutter pub get
Run the Application

bash
Copy code
flutter run
Configuration
Firebase Setup

Create a Firebase project: Firebase Console.
Configure Firebase for your Flutter project by adding the necessary configuration files.
Update Firebase Configurations

Open lib/config/firebase_config.dart and update the Firebase configurations with your own values.

Login Credentials

Customer Authority
Email: user@user.com
Password: user1234

Manager Authority
Email: owner@owner.com
Password: owner123
