# Flutter Quiz App with Gamification 🎯

A dynamic and visually appealing quiz application built using Flutter. This app fetches quiz data from an API, provides an engaging user experience with gamification elements, and ensures smooth performance across various devices and orientations.

---

## 📖 Features

- **Dynamic Quiz Data:** Fetches quiz questions and answers from an API.
- **Gamification:** Score tracking with points awarded for correct answers.
- **Responsive Design:** Adapts seamlessly to various screen sizes and orientations.
- **Intuitive User Interface:** Clean and modern UI with animations and transitions.
- **Fallback Mechanism:** Displays default questions if the API call fails.
- **Result Summary:** Shows the user's total score at the end of the quiz.

---

## 🛠️ Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **State Management:** Stateful Widgets
- **API Integration:** HTTP package
- **Styling:** Custom widgets, gradients, and Material Design components

---

## 🚀 How to Run the Project



### 1. Prerequisites

- Install Flutter SDK: [Get Flutter](https://flutter.dev/docs/get-started/install)
- Install a code editor like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).
- Ensure your system has an emulator or a physical device connected.

### 2. Clone the Repository



📦 Folder Structure


lib/
├── models/
│   └── question.dart        # Model for quiz questions
├── screens/
│   ├── quiz_screen.dart     # Main quiz logic and UI
│   ├── result_screen.dart   # Screen to display quiz results
├── services/
│   └── api_service.dart     # API fetching logic
├── widgets/
│   ├── question_card.dart   # Widget for displaying the question
│   ├── answer_button.dart   # Widget for displaying options
main.dart                    # Entry point of the application


🌐 API Used
The app fetches questions from the following API endpoint: https://api.jsonserve.com/Uw5CrX

Example API Data:

[
  {
    "questionText": "What is Flutter?",
    "options": [
      "A programming language",
      "A mobile UI framework",
      "A database",
      "An IDE"
    ],
    "correctAnswerIndex": 1
  },
  {
    "questionText": "Who developed Flutter?",
    "options": [
      "Apple",
      "Facebook",
      "Google",
      "Microsoft"
    ],
    "correctAnswerIndex": 2
  }
]

🖼️ Screenshots and Demo

Quiz Screen:

Home Screen

![image](https://github.com/user-attachments/assets/0f9556a2-b138-454d-b927-fc8e1fa96282)

Quiz Screen


![image](https://github.com/user-attachments/assets/73841835-10d9-4db3-b305-66420b4c356d)

📜 Contribution Guidelines
Contributions are welcome! Please follow these steps:

Fork the repository.
Create a new branch: git checkout -b feature-branch-name.
Commit your changes: git commit -m 'Add some feature'.
Push to the branch: git push origin feature-branch-name.
Submit a pull request.





  📄 License
  This project is licensed under the MIT License. See the LICENSE file for details.





📧 Contact
For queries, feel free to reach out:


Author: Tamilselvan S.
Email: blackadamjoker01@gmail.com
GitHub: Tamil-X-Tech




Let me know if you need help with any part of this README!



