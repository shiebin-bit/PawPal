# PawPal(Assignment 2)

**Course:** STTGK3013 - Mobile Web Development  
**Assignment:** Assignment 2 - User Authentication Module  

## 📖 Project Overview
PawPal is a mobile platform.
This repository contains the source code for the **User Authentication Module**, which handles secure user sign-up, login and session management.

The project demonstrates the integration of a **Flutter** frontend with a custom **PHP/MySQL** backend REST API.

## ✨ Key Features
* **User Registration:** * Collects User Name, Email, Phone, and Password.
    * Validates input (Email format, Password length >= 6).
    * Prevents duplicate email registration.
* **User Login:**
    * Secure authentication using SHA1 password hashing.
    * Retrieves and displays user profile data upon success.
* **Session Management:**
    * **"Remember Me"** feature using Shared Preferences to store credentials locally.
    * Auto-login capability on app startup.
* **Guest Mode:** Allows limited access without logging in.

## 🛠️ Technology Stack
* **Frontend:** Flutter (Dart)
* **Backend:** Native PHP (No frameworks used)
* **Database:** MySQL / MariaDB (via XAMPP)
* **Architecture:** MVC Pattern (Model-View-Controller)
