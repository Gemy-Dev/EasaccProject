# 🌐 Easacc Test App - WebView & Device Access App

This project was built as part of a **test assignment** for **Easacc** company. The app is a **cross-platform application** (Android & iOS) built with **Flutter**.

## 📲 App Overview

The app consists of **3 pages**:

### 1️⃣ Login Page
- 🔐 Social media login using:
    - **Facebook Login**
    - **Google Login**

---

### 2️⃣ Settings Page
- 🌐 Input field to enter a **web URL** that will be displayed in the web view page.
- 📡 Dropdown list to **access and select available network devices** (like **WiFi printers** and **Bluetooth devices**).

---

### 3️⃣ WebView Page
- 🌍 Displays the **website** URL entered on the **Settings Page** using a **web view**.
- 🔄 The URL can be changed anytime by returning to the **Settings Page**.

---

## 📱 Platforms

- ✅ Android
- ✅ iOS

---

## 🛠️ Technologies Used

- **Flutter** - Cross-platform framework.
- **Google Sign-In** - Social login.
- **Facebook Sign-In** - Social login.
- **Flutter WebView** - To display websites.
- **Flutter Blue / Wifi Scan** (or similar plugins) - To list nearby **WiFi and Bluetooth devices**.

---

## 📐 Architecture

- Follows a simple **3-page navigation flow**.
- Basic **state management** for handling URL input and device selection.

---

## 📥 Installation & Run

To run the app locally:

1. Clone the repository:
    ```bash
    git clone https://github.com/Gemy-Dev/EasaccProject.git
    ```
2. Navigate to the project folder:
    ```bash
    cd easacc_web_view
    ```
3. Install dependencies:
    ```bash
    flutter pub get
    ```
4. Run the app:
    ```bash
    flutter run
    ```

---

## 📝 Notes

- This project was developed specifically for the **Easacc hiring test**.
- The app is a **proof-of-concept** with basic functionality and can be extended for production use.
- Further improvements can be made to UI/UX and network device handling.

---

## 📄 License

This project is available under the [MIT License](LICENSE).

---

## 📧 Submission

The completed app was submitted to **hiring@easacc.com** as per the test requirements.

---

Made with ❤️ using Flutter.
