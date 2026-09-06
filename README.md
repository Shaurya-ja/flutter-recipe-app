# 🍳 Recipe & Meal Planner App

A cross-platform recipe discovery application built with **Flutter** and **Dart**. This project fetches real-time data from [TheMealDB API](https://www.themealdb.com/api.php) to allow users to explore food categories, browse recipes, view detailed step-by-step cooking instructions, and mark their favorite dishes.

---

## 🚀 Key Features

* **Category Explorer:** Browse diverse food categories (Seafood, Vegetarian, Dessert, etc.) in an adaptive grid view.
* **Dynamic Recipe Feeds:** Fetch live lists of recipes corresponding to selected categories.
* **Detailed Recipe Views:** View high-resolution dish previews, category tags, and full preparation instructions.
* **Interactive Favorites:** Toggle recipe favorites dynamically with immediate state updates and visual feedback.
* **Real-time API Integration:** Smooth loading states powered by asynchronous network calls.

---

## 🛠️ Tech Stack & Architecture

* **Framework:** [Flutter](https://flutter.dev/) (Multi-platform UI toolkit)
* **Language:** [Dart](https://dart.dev/)
* **Networking:** `http` package for RESTful API consumption
* **Data Source:** TheMealDB Open-Source REST API
* **State Management:** Native `StatefulWidget` & `setState()`
* **Asynchronous Rendering:** `FutureBuilder`

---

## 📂 Project Structure

```text
lib/
├── models/
│   └── meal.dart           # Data modeling & JSON deserialization
├── services/
│   └── api_service.dart    # Asynchronous REST API service (Futures)
├── screens/
│   ├── category_screen.dart    # Home grid view (StatelessWidget)
│   ├── meal_list_screen.dart   # Category item list (StatelessWidget)
│   └── meal_detail_screen.dart # Interactive detail screen (StatefulWidget)
└── main.dart               # Application entrypoint & Material theme configuration
