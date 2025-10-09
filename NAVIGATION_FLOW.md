# Navigation Flow Documentation

## 🎯 Navigation Architecture

Bu proje **GoRouter** ile modern ve güvenli bir navigation sistemi kullanır. Auth guard ve state management ile tam entegre edilmiştir.

## 📱 Navigation Flow

```
┌─────────────┐
│   Splash    │ (3 saniye animasyon)
└──────┬──────┘
       │
       ├──────────┐
       │          │
       v          v
   Authenticated?
       │          │
     Yes          No
       │          │
       v          └─────┐
   ┌──────┐            │
   │ Home │        Onboarding
   └──────┘        Completed?
                       │
                     Yes  No
                       │   │
                       v   v
                   Login  Onboarding
                              │
                              v
                           Login
```

## 🔐 Auth Guard Logic

### Splash Screen Logic
```dart
if (isAuthenticated) {
  -> /home
} else if (onboardingCompleted) {
  -> /login
} else {
  -> /onboarding
}
```

### Router Redirect Logic
- **Auth Routes** (`/login`, `/register`, `/forgot-password`)
  - Authenticated kullanıcı → `/home` redirect

- **Protected Routes** (`/home`, `/profile`, `/settings`)
  - Unauthenticated kullanıcı → `/login` redirect

- **Splash Route** (`/splash`)
  - Her zaman erişilebilir (no redirect)

## 📂 Route Definitions

### Public Routes
| Route | Screen | Description |
|-------|--------|-------------|
| `/splash` | SplashScreen | İlk açılış animasyonu |
| `/onboarding` | OnboardingScreen | İlk kullanıcı deneyimi |
| `/login` | LoginScreen | Giriş ekranı |
| `/register` | RegisterScreen | Kayıt ekranı |
| `/forgot-password` | ForgotPasswordScreen | Şifre sıfırlama |

### Protected Routes (Auth Required)
| Route | Screen | Description |
|-------|--------|-------------|
| `/home` | HomeScreen | Ana sayfa |

## 🔄 State Management

### Auth State Provider
```dart
final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});
```

Firebase auth state'ini dinler ve otomatik olarak UI'ı günceller.

### Onboarding State Provider
```dart
final isOnboardingCompletedProvider = Provider<bool>((ref) {
  final service = ref.watch(onboardingServiceProvider);
  return service.isOnboardingCompleted();
});
```

SharedPreferences üzerinden onboarding durumunu takip eder.

## 📝 Usage Examples

### Navigate to Login
```dart
context.go('/login');
```

### Navigate with Push (keeps history)
```dart
context.push('/register');
```

### Navigate Back
```dart
context.pop();
```

### Check Auth State
```dart
final authState = ref.watch(authStateProvider);

authState.when(
  data: (user) {
    if (user != null) {
      // User is logged in
    } else {
      // User is logged out
    }
  },
  loading: () => CircularProgressIndicator(),
  error: (error, stack) => Text('Error: $error'),
);
```

## 🧪 Testing Navigation

### Test Scenarios

1. **First Time User**
   - App opens → Splash (3s) → Onboarding → Login

2. **Returning User (Not Logged In)**
   - App opens → Splash (3s) → Login

3. **Logged In User**
   - App opens → Splash (3s) → Home

4. **Logout Flow**
   - Home → Logout → Login (auto redirect)

### Reset Onboarding (For Testing)
```dart
final onboardingService = ref.read(onboardingServiceProvider);
await onboardingService.resetOnboarding();
```

## 🔧 Implementation Details

### Files Structure
```
lib/
├── core/
│   ├── routing/
│   │   └── app_router.dart          # Main router configuration
│   ├── services/
│   │   └── onboarding_service.dart  # Onboarding state management
│   └── providers/
│       └── app_providers.dart       # Global providers
├── features/
│   ├── splash/
│   │   └── presentation/
│   │       └── splash_screen.dart   # Splash with navigation logic
│   ├── onboarding/
│   │   └── presentation/
│   │       └── onboarding_screen.dart # Marks completion on finish
│   └── auth/
│       └── presentation/
│           └── screens/             # Auth screens
└── main.dart                        # Router initialization
```

## 🎨 Best Practices

1. **Always use named routes** when possible
2. **Use `context.go()` for root navigation** (clears history)
3. **Use `context.push()` for stacked navigation** (keeps history)
4. **Check `mounted`** before navigation in async functions
5. **Use redirect for auth guards** instead of manual checks in widgets

## 📊 Navigation Metrics

- **Initial route**: `/splash`
- **Auth guard**: Enabled on protected routes
- **Deep linking**: Ready for implementation
- **Route transition**: Default Material animations

## 🚀 Future Enhancements

- [ ] Deep linking support
- [ ] Custom route transitions
- [ ] Route analytics tracking
- [ ] Error route (404 page)
- [ ] Route middleware
- [ ] Dynamic route generation