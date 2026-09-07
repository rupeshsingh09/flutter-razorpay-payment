# 💳 Flutter Razorpay Payment Integration

A simple Flutter application demonstrating **Razorpay Payment Gateway integration** using the `razorpay_flutter` package.

## 🚀 Features

* Razorpay payment gateway integration
* Test mode payment
* ₹10 test payment
* Payment success handling
* Payment failure handling
* External wallet handling
* Customer contact and email prefill
* Toast notifications for payment status

## 🛠️ Technologies Used

* **Flutter**
* **Dart**
* **Razorpay**
* **razorpay_flutter**
* **fluttertoast**

## 📱 Project Flow

```text
User clicks "Pay 10rs"
        ↓
Razorpay Checkout opens
        ↓
User completes payment
        ↓
Payment Success / Failure
        ↓
Flutter handles the response
```

## ⚙️ Installation

### 1. Clone the repository

```bash
git clone YOUR_GITHUB_REPOSITORY_URL
```

### 2. Open the project

```bash
cd YOUR_PROJECT_NAME
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the application

```bash
flutter run
```

## 🔑 Razorpay Configuration

This project uses a **Razorpay Test Mode key** for development and testing.

In the payment options, configure your Razorpay key:

```dart
var options = {
  'key': 'YOUR_RAZORPAY_TEST_KEY',
  'amount': 1000,
  'name': 'Acme Corp.',
  'description': 'Fine T-Shirt',
};
```

> ⚠️ Never upload your Razorpay Secret Key, API credentials, passwords, or other sensitive information to GitHub.

## 💰 Payment Amount

Razorpay uses the smallest currency unit for the amount.

For Indian Rupees:

```text
100 paise = ₹1
1000 paise = ₹10
```

Therefore:

```dart
'amount': 1000
```

represents **₹10**.

## 📂 Project Structure

```text
lib/
└── main.dart

pubspec.yaml
README.md
```

