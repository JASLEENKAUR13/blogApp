# ✍️ Blog App - A Clean Architecture Project

A modern Flutter application designed to showcase a robust implementation of **Clean Architecture**. This project serves as a practical example of building scalable, maintainable, and testable mobile apps using best practices. The app allows users to authenticate, browse a feed of blogs, and create their own posts with images, rich content, and multiple topics.

## 🚀 Features

- **🔒 Secure Authentication**: Full user sign-up and sign-in flows powered by Supabase Auth.
- **🌐 Global Blog Feed**: A central `BlogPage` where users can view all blogs created by the community.
- **✍️ Create & Upload Blogs**: An `Add New Blog` page that allows users to:
  - Add a captivating title and detailed content.
  - Upload a feature image for each blog post.
  - Select one or more relevant topics from a predefined list.
- **👤 User Profile**: A dedicated `ProfilePage` for user-specific information.
- **👁️ Persistent User Session**: The app uses a central `AppUserCubit` to manage the global authentication state, automatically navigating users based on whether they are logged in or out.

---

## 📲 Download & Test the App

You can install the latest version of the app directly on your Android device by downloading the APK file.

**[➡️ Download the latest APK here ⬅️]([https://github.com/JASLEENKAUR13/blogApp/releases/download/v1.0.0/app-release.apk]))**

**How to Install:**
1. Download the `app-release.apk` file from the link above on your Android device.
2. Open your file manager and tap on the downloaded file.
3. You may need to **"allow installation from unknown sources"** in your device settings.
4. Follow the prompts to install the app.

---

## 🛠️ Tech Stack & Architectural Decisions

This project was built with a strong emphasis on creating a professional-grade, scalable architecture.

- **Architecture**: **Clean Architecture**
  - **Data Layer**: Manages data from Supabase (network) and is responsible for repository implementations.
  - **Domain Layer**: The core business logic, containing entities and repository contracts. It is completely independent of other layers.
  - **Presentation Layer**: The UI, built with Flutter widgets and managed by Bloc/Cubit.

- **State Management**: **Bloc & Cubit**
  - Enables a clear separation between UI and business logic.
  - **Global Auth State Management**: A singleton `AppUserCubit` is used to manage and provide the current user's authentication state throughout the entire app. This allows different parts of the UI to react instantly to login or logout events.

- **Backend-as-a-Service (BaaS)**: **Supabase**
  - Handles user authentication (email/password).
  - Provides a Postgres database for storing blog data.
  - Manages storage for uploaded blog images.

- **Dependency Injection**: **`get_it`**
  - Decouples classes and layers by providing dependencies from a central service locator.
  - Makes the app easier to test and maintain.

- **Core Principles**:
  - **SOLID**: The entire architecture is designed around the SOLID principles.
  - **Dependency Inversion**: High-level modules do not depend on low-level modules; both depend on abstractions.

---

## 📸 Screenshots

*(Remember to replace these placeholders with your own app screenshots!)*

| Sign In / Sign Up | Blog Feed (Main) | Add New Blog |
| :---: | :---: | :---: |
| ![Sign In](https://github.com/JASLEENKAUR13/blogApp/raw/main/blog%20signup.jpg)|![Sign Up](https://github.com/JASLEENKAUR13/blogApp/raw/main/blog_signin.jpg) | ![Blog Feed Screen](https://github.com/JASLEENKAUR13/blogApp/blob/main/blogmain.jpg)   |
| **Blog Detail** | **User Profile** | |
|![Add Blog Screen](https://github.com/JASLEENKAUR13/blogApp/blob/main/addblog.jpg) | ![Blog Detail Screen](https://github.com/JASLEENKAUR13/blogApp/blob/main/blogdetail.jpg)  |


---


## 🧠 What I Learned

Building this project was a fantastic learning experience, particularly in these areas:

- **Architectural Discipline:** The challenge of strictly adhering to Clean Architecture rules, ensuring no dependencies point inwards.
- **State Management at Scale:** Managing complex UI states, handling loading, success, and error cases gracefully with Bloc.
- **Problem-Solving:** Overcame significant native build issues (Gradle configuration) and runtime bugs, strengthening my debugging skills.
- **Asynchronous Operations:** Deepened my understanding of `Future`s, `Stream`s, and `async/await` in a real-world application.

This app is a testament to my ability to build robust, well-structured applications and my commitment to writing high-quality code.
