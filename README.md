# 💰 PayFlow Pro - Modern Banking App

<div align="center">
  
  ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
  ![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
  ![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
  
  **A beautiful, modern, and feature-rich mobile banking application built with Flutter**
  
  [Features](#-features) • [Screenshots](#-screenshots) • [Installation](#-installation) • [Tech Stack](#-tech-stack) • [Developer](#-developer)
  
</div>

---

## 📱 About

**PayFlow Pro** is a cutting-edge mobile banking application that redefines the digital banking experience. Built with Flutter, this app offers a seamless, secure, and intuitive interface for managing your finances on the go. From sending money to tracking transactions, PayFlow Pro provides all the essential banking features wrapped in a stunning modern UI design.

### ✨ Key Highlights

- 🎨 **Modern UI/UX** - Beautiful glassmorphism effects and smooth animations
- 🔐 **Secure Authentication** - Login and registration with social media integration
- 💳 **Card Management** - Manage multiple cards with swipe-to-view functionality
- 📊 **Analytics Dashboard** - Visual charts and spending insights
- 💸 **Quick Transfers** - Send money instantly to your contacts
- 📜 **Transaction History** - Detailed transaction logs with filters
- 🌓 **Responsive Design** - Optimized for all screen sizes
- ⚡ **High Performance** - Smooth 60fps animations throughout

---

## 🚀 Features

### 🔑 Authentication System
- **Beautiful Login Screen** with glassmorphism design
- **Quick Registration** with email verification
- **Social Media Login** (Google, Apple, Facebook)
- **Forgot Password** functionality

### 🏠 Home Dashboard
- **Balance Overview** with multiple account cards
- **Spending Analytics** with interactive charts
- **Quick Actions** (Send, Scan, Request, More)
- **Recent Transactions** list with categories

### 💸 Money Transfer
- **Instant Send Money** to contacts
- **Recent Contacts** quick access
- **Amount Presets** for faster transfers
- **Add Notes** to transactions
- **Success Animations** for completed transfers

### 📊 Transactions
- **Complete Transaction History**
- **Advanced Filters** (All, Income, Expense, Transfer)
- **Swipe to Edit/Delete** transactions
- **Categorized View** by date
- **Search Functionality**

### 💳 Card Management
- **Multiple Card Support** (Visa, Mastercard, Amex)
- **Swiper View** for easy navigation
- **Card Details** with chip design
- **Quick Actions** (Add Card, Transfer, Top Up, History)
- **Card Settings** (Freeze, Details, Limits, Notifications, Security)

### 👤 User Profile
- **Beautiful Profile Header** with gradient
- **Stats Cards** (Transactions count, Total sent)
- **Account Settings** (Personal Info, Security, Notifications, Language)
- **Support Section** (Help Center, Terms, Privacy Policy)
- **Logout Dialog** with confirmation

---

## 📸 Screenshots

### 1. Splash Screen
<img src="/assets/screen/1.png" width="250" alt="Splash Screen"/>

*Welcome to PayFlow Pro with animated logo and smooth transitions*

---

### 2. Login Screen
<img src="/assets/screen/2.png" width="250" alt="Login Screen"/>

*Beautiful glassmorphism login with social media integration*

---

### 3. Registration Screen
<img src="/assets/screen/3.png" width="250" alt="Registration Screen"/>

*Quick and easy registration process with modern design*

---

### 4. Home Dashboard
<img src="/assets/screen/4.png" width="250" alt="Home Dashboard"/>

*Main dashboard with balance cards, quick actions, and analytics*

---

### 5. Send Money
<img src="/assets/screen/5.png" width="250" alt="Send Money"/>

*Instant money transfer with recent contacts and amount presets*

---

### 6. Transaction History
<img src="/assets/screen/6.png" width="250" alt="Transaction History"/>

*Complete transaction list with filters and swipe actions*

---

### 7. Card Management
<img src="/assets/screen/4.png" width="250" alt="Card Management"/>

*Beautiful card swiper with multiple card support and settings*

---

### 8. Profile Settings
<img src="/assets/screen/7.png" width="250" alt="Profile Settings"/>

*User profile with stats, settings, and support options*

---

### 9. Card Details
<img src="/assets/screen/9.png" width="250" alt="Card Details"/>

*Detailed card view with chip design and quick actions*

---

## 📦 Installation

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Steps

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/payflow-pro.git
cd payflow-pro
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

### Building for Production

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

---

## 🛠 Tech Stack

### Core Technologies
- **Flutter** 3.x - UI Framework
- **Dart** 3.x - Programming Language

### Key Packages

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_screenutil` | ^5.9.0 | Responsive UI |
| `google_fonts` | ^6.1.0 | Custom Fonts |
| `animate_do` | ^3.1.2 | Animations |
| `iconsax` | ^0.0.8 | Modern Icons |
| `font_awesome_flutter` | ^10.6.0 | Social Media Icons |
| `glassmorphism` | ^3.0.0 | Glass Effect |
| `fl_chart` | ^0.65.0 | Charts & Graphs |
| `card_swiper` | ^3.0.1 | Card Swiper |
| `flutter_slidable` | ^3.0.1 | Swipe Actions |
| `shimmer` | ^3.0.0 | Loading Effects |

---

## 📱 App Structure

```
lib/
├── main.dart                    # App entry point
└── screens/
    ├── splash_screen.dart       # Welcome screen
    ├── login_screen.dart        # User login
    ├── register_screen.dart     # User registration
    ├── main_screen.dart         # Bottom navigation
    ├── home_screen.dart         # Dashboard
    ├── send_money_screen.dart   # Money transfer
    ├── transactions_screen.dart # Transaction history
    ├── cards_screen.dart        # Card management
    └── profile_screen.dart      # User profile
```

---

## 🎨 Design System

### Color Palette
- **Primary Purple**: `#6C63FF`
- **Primary Dark**: `#5B54E8`
- **Secondary Cyan**: `#00D4FF`
- **Secondary Dark**: `#0099CC`
- **Success Green**: `#4CAF50`
- **Error Red**: `#E53935`
- **Warning Orange**: `#FFA726`
- **Pink Accent**: `#FF6B9D`

### Typography
- **Font Family**: Poppins (Google Fonts)
- **Heading**: Bold, 24-36sp
- **Body**: Regular, 14-16sp
- **Caption**: Regular, 12sp

---

## 🔐 Security Features

- ✅ Secure authentication flow
- ✅ Password encryption
- ✅ Biometric authentication ready
- ✅ Session management
- ✅ Secure data transmission
- ✅ Card data encryption

---

## 🚧 Roadmap

- [ ] Biometric authentication (Face ID / Touch ID)
- [ ] Dark mode support
- [ ] Multi-language support
- [ ] Push notifications
- [ ] QR code scanner
- [ ] Budget planning feature
- [ ] Investment portfolio
- [ ] Bill payments
- [ ] Backend integration (Firebase/REST API)
- [ ] Real-time currency exchange

---

## 👨‍💻 Developer

<div align="center">
  
  ### **TWanst Codes**
  
  *Full Stack Flutter Developer*
  
  [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/twanst)
  [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/twanst)
  [![Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/twanst)
  
  **"Building beautiful and functional mobile experiences"**
  
</div>

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 TWanst Codes

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/yourusername/payflow-pro/issues).

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## ⭐ Show Your Support

If you like this project, please give it a ⭐️ on GitHub!

---

## 📞 Contact

**TWanst Codes** - Developer & Designer

- 📧 Email: twanadizain5@gmail.com


---

<div align="center">
  
  **Made with ❤️ by TWanst Codes**
  
  *Building the future of mobile banking, one line of code at a time*
  
  ![Flutter](https://img.shields.io/badge/Made%20with-Flutter-02569B?style=flat-square&logo=flutter)
  ![Dart](https://img.shields.io/badge/Language-Dart-0175C2?style=flat-square&logo=dart)
  
</div>