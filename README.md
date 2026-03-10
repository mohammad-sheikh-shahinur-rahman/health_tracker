🛡️ Health Tracker - Your Ultimate Wellness Companion

Version: 1.1.0+2
Platform: Flutter (Android & iOS)

Health Tracker is a comprehensive, professional-grade health management platform designed to help users improve their physical and mental well-being. It features offline-first logic, smart reminders, and modern security.

🚀 Key Features

1.  **👣 Smart Step Tracker & Leaderboard**
    *   **Background Tracking:** Utilizes phone sensors to track steps even when the app is closed.
    *   **Live Activity (Dynamic Island):** Professional live notification that shows real-time progress, similar to high-end mobile OS features.
    *   **Ranking System:** Compete with a simulated global community on the Leaderboard.
    *   **XP Rewards:** Earn XP for every 10 steps and a 100 XP bonus for hitting your daily goal.

2.  **💧 Smart Hydration Engine**
    *   **Weather-Based Reminders:** Dynamically adjusts your water goal based on local temperature (using offline seasonal estimation) and activity level.
    *   **Bangla Voice Reminders:** Speaks to you in Bengali: "বন্ধু, অনেকক্ষণ পানি খাওয়া হয়নি, শরীর হাইড্রেটেড রাখতে এক গ্লাস পানি খেয়ে নাও।"

3.  **💊 Digital Medicine Cabinet**
    *   **Inventory Tracking:** Monitors pill stock and provides 'Refill Alerts' when running low.
    *   **High-Priority Alarms:** Reliable reminders to ensure you never miss a dose.

4.  **🏥 Health Vitals & Personal Vault**
    *   **BP & Glucose Tracker:** Log Blood Pressure and Blood Glucose with professional analytical charts.
    *   **Medical Vault:** Securely store prescriptions and lab reports using encrypted local storage.
    *   **Vault Security:** Choose your own security layer—PIN, Password, or Biometrics (Fingerprint/Face).

5.  **👁️ Vision Test (Eye Health)**
    *   **Digital Snellen Chart:** Perform a digital eye sharpness test at home with guided steps and professional scoring.

6.  **🧘 Relaxation HUB**
    *   **Guided Breathing:** Ultra UI breathing sessions with neon glow animations for mental peace.
    *   **Haptic Feedback:** Vibrational cues allow you to focus on your breath without looking at the screen.

7.  **🏋️ Custom Workout Builder**
    *   **Personalized Routines:** Build your own workout plans with custom sets, reps, and exercises.
    *   **Live Fitness Hub:** Track outdoor runs, walks, or cycling sessions on a high-contrast detailed map.

8.  **✅ Task Management (TODO)**
    *   **Daily Checklist:** Integrated TODO list on the dashboard to manage health-related tasks and earn XP upon completion.

9.  **🛌 Intelligent Sleep Tracking**
    *   **Sleep Cycle Analysis:** Automatically detects and analyzes your sleep stages (light, deep, REM) to provide insights into your sleep quality.
    *   **Personalized Recommendations:** Get tips to improve your sleep hygiene based on your patterns.
    *   **Sleep Score & History:** Quantify your night's rest with a simple score and track your long-term sleep trends.

10. **⚖️ Weight Management & Goals**
    *   **Track Your Progress:** Log your weight and see your progress towards your goal with beautiful charts.
    *   **BMI Calculation:** Automatically calculates your Body Mass Index (BMI) and helps you stay in a healthy range.
    *   **Goal Setting:** Set your target weight and get motivational support to reach it.

11. **👤 Personal User Profile**
    *   **Profile Picture:** Users can upload their photo to personalize their profile.
    *   **Personal Information:** Manage personal details like name, birthday, weight, and height.

12. **🥗 AI-Powered Diet Planner**
    *   **Personalized Meal Plans:** Get custom diet plans based on your health goals, dietary preferences, and calorie needs.
    *   **Smart Food Logging:** Easily log your meals and get instant nutritional feedback.
    *   **Recipe Suggestions:** Discover healthy and delicious recipes tailored to your diet.

13. **🤖 AI Health Assistant (Chat)**
    *   **Instant Health Advice:** Ask health-related questions and get instant, reliable answers from our AI assistant.
    *   **Symptom Checker:** Describe your symptoms and get a preliminary analysis to help you decide on the next steps.
    *   **24/7 Availability:** Your AI health companion is always there to help, anytime you need it.

🎨 Visual & UI Highlights

*   **Ultra Modern Design:** Premium look with neon accents, smooth animations (Flutter Animate), and glassmorphism.
*   **Interactive Charts:** High-quality data visualization using FL Charts.
*   **Dark/Light Mode:** Full support for system-wide themes.
*   **Gamification:** Unlock digital badges like 'Bronze Walker' (7-day streak) or 'Gold Runner' (30-day streak).

🛠️ Technical Specifications

*   **Database:** Hive (High-performance local NoSQL storage).
*   **Security:** SHA-256 Hashing for sensitive data and Local Auth integration.
*   **Sync:** Google Fit and Apple Health integration via the Health package.
*   **AI:** Offline knowledge base with over 200,000 health-related entries.
*   **Localization:** Complete support for both Bangla and English.

📥 Installation & Setup

1.  Clone the repository:
    ```bash
    git clone [your-repo-link]
    cd health_tracker
    ```

2.  Install dependencies:
    ```bash
    flutter pub get
    ```

3.  Generate Data Adapters (Crucial):
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

4.  Run the app:
    ```bash
    flutter run
    ```

⚠️ Important Note

This app is optimized for Android 14. To ensure background step tracking and alarms work reliably, please disable Battery Optimization for Health Tracker in your phone settings.

Developed with ❤️ for a Healthier Future.

© 2026 Mohammad Sheikh Shahinur Rahman | Health Tracker | Professional Edition

---

## Credits

**Developed by:** Mohammad Sheikh Shahinur Rahman

A passionate and dedicated Flutter developer with a keen eye for creating modern, user-friendly, and impactful mobile applications. He specializes in building high-performance apps that solve real-world problems and enhance people's lives through technology.
