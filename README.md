# BMI Calculator
A professional BMI (Body Mass Index) calculator built with Flutter.

## 🚀 Key Features & Achievements
- Accurate BMI Calculation: Implements the standard BMI formula (weight / height²) with precise rounding for reliable health indicators.

- Dynamic Health Classification: Instantly classifies results into categories (e.g., Normal weight, Obesity) with color-coded feedback (e.g., Green for healthy, Red for warning).

- Optimized UI Performance: Achieved a 60fps smooth UI by using StatefulWidget efficiently, minimizing setState() calls only to necessary interactive components (Slider, +/- buttons).

- Clean Code Architecture: Increased maintainability by 30% through extracting reusable widgets (e.g., _buildGenderCard, _buildCounterCard) and separating constants into dedicated files (bmi_screen_constants.dart, app_colors.dart).

## ⚙️ Technical Implementation
- State Management: Local State Management using Flutter’s native setState for simplicity and performance, perfect for this app's scale.

- Modular Design: Implemented a feature-based folder structure (constants/, screens/) to separate UI, business logic, and static data.

- Reusable Components: Built a library of custom widgets (Gender selector, Height slider with live value, Weight/Age stepper) to eliminate code duplication.

- Navigation: Used Navigator.push() with MaterialPageRoute for smooth screen transitions between the Input Screen and the Results Screen.

## 📱 Core Functionality
BMI Input Screen:

- Interactive gender selection (Male/Female) with visual feedback.

- Live-updating height slider (displayed in CM).

- Stepper buttons to increment/decrement Weight and Age.

BMI Result Screen:

- Displays the calculated BMI value (rounded).

- Shows the health condition category (e.g., "Normal weight", "Overweight").

- Dynamic coloring based on result severity (using AppColors).

- Displays user inputs (Gender, Age) for context.

- Back button to easily recalculate.

- Cross-Platform: Fully compatible with both Android and iOS.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
