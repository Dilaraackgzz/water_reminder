# Authentication Feature

Modern ve güvenli authentication sistemi. Firebase Authentication ve Google Sign-In destekli.

## Özellikler

### Giriş Yöntemleri
- ✅ Email/Password ile giriş
- ✅ Google ile giriş
- ✅ Email doğrulama
- ✅ Şifre sıfırlama

### Ekranlar
- **LoginScreen**: Modern, animasyonlu giriş ekranı
- **RegisterScreen**: Kullanıcı kayıt ekranı
- **ForgotPasswordScreen**: Şifre sıfırlama ekranı

## Mimari

```
auth/
├── data/
│   └── repositories/
│       └── auth_repository_impl.dart    # Firebase implementation
├── domain/
│   ├── models/
│   │   └── user_model.dart              # User data model
│   └── repositories/
│       └── auth_repository.dart         # Repository interface
└── presentation/
    ├── providers/
    │   ├── auth_providers.dart          # Riverpod providers
    │   └── auth_controller.dart         # State management
    ├── screens/
    │   ├── login_screen.dart
    │   ├── register_screen.dart
    │   └── forgot_password_screen.dart
    └── widgets/
        ├── auth_text_field.dart         # Custom text field
        └── social_auth_button.dart      # Social login button
```

## Kullanım

### Giriş Yapma

```dart
final authController = ref.read(authControllerProvider.notifier);

// Email ile giriş
await authController.signInWithEmail(email, password);

// Google ile giriş
await authController.signInWithGoogle();
```

### Kayıt Olma

```dart
await authController.registerWithEmail(
  email,
  password,
  displayName,
);
```

### Şifre Sıfırlama

```dart
await authController.resetPassword(email);
```

### Çıkış Yapma

```dart
await authController.signOut();
```

## Auth State Dinleme

```dart
final authState = ref.watch(authStateProvider);

authState.when(
  data: (user) {
    if (user != null) {
      // Kullanıcı giriş yapmış
    } else {
      // Kullanıcı giriş yapmamış
    }
  },
  loading: () => CircularProgressIndicator(),
  error: (error, stack) => Text('Error: $error'),
);
```

## Hata Yönetimi

Tüm Firebase auth hataları Türkçe mesajlara çevrilmiştir:
- `user-not-found`: "Bu e-posta ile kayıtlı kullanıcı bulunamadı."
- `wrong-password`: "Hatalı şifre girdiniz."
- `email-already-in-use`: "Bu e-posta adresi zaten kullanılıyor."
- `weak-password`: "Şifreniz çok zayıf. Daha güçlü bir şifre seçin."
- `invalid-email`: "Geçersiz e-posta adresi."

## UI Özellikleri

- ✨ Flutter Animate ile smooth animasyonlar
- 🎨 Material 3 design language
- 📱 Responsive tasarım
- 🌈 Google Fonts (Poppins)
- 🎯 Form validation
- 🔒 Güvenli şifre girişi (obscure text)
- 💫 Loading states
- 🎨 Gradient backgrounds
- 📮 SnackBar feedback

## Güvenlik

- Firebase Authentication kullanılıyor
- Şifreler client-side'da saklanmıyor
- Email doğrulama zorunlu
- Minimum 6 karakter şifre
- Google Sign-In güvenli OAuth flow

## Next Steps

- [ ] Apple Sign-In
- [ ] Phone authentication
- [ ] Biometric authentication
- [ ] Two-factor authentication
- [ ] Social login (Facebook, Twitter)