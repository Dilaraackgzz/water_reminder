# Firebase Kurulum Rehberi

## 🔐 Güvenlik Notu

Firebase konfigürasyon dosyaları hassas bilgiler içerir ve **asla** GitHub'a commit edilmemelidir. Bu proje, Firebase bilgilerini güvenli bir şekilde yönetmek için `.env` dosyası kullanır.

## 📋 Yeni Geliştirici İçin Kurulum Adımları

### 1. Gerekli Dosyaları Hazırla

Proje kök dizininde `.env` dosyası oluştur:

```bash
cp .env.example .env
```

### 2. Firebase Credentials'ları Al

Firebase Console'dan gerekli bilgileri al:
- Firebase Console'a git: https://console.firebase.google.com/
- Projeyi seç: **aqualert-7850d**
- Project Settings > General kısmından bilgileri kopyala

### 3. `.env` Dosyasını Doldur

`.env` dosyasındaki placeholder'ları gerçek değerlerle değiştir.

**Önemli:** Proje sahibinden `.env` dosyasını güvenli bir şekilde al!

### 4. Firebase Config Dosyalarını Oluştur

Şu anda bu dosyalar repository'de mevcut ama ignore ediliyor:
- `android/app/google-services.json`
- `ios/GoogleService-Info.plist`
- `ios/Runner/GoogleService-Info.plist`

Bu dosyalar zaten lokal'de mevcut. Eğer yoksa:

#### Android için:
1. Firebase Console > Project Settings > General
2. Android app seçeneğine tıkla
3. "google-services.json" dosyasını indir
4. `android/app/` klasörüne kopyala

#### iOS için:
1. Firebase Console > Project Settings > General
2. iOS app seçeneğine tıkla
3. "GoogleService-Info.plist" dosyasını indir
4. `ios/` ve `ios/Runner/` klasörlerine kopyala

### 5. Doğrulama

Aşağıdaki dosyaların mevcut olduğundan emin ol:
- ✅ `.env` (gerçek değerlerle dolu)
- ✅ `android/app/google-services.json`
- ✅ `ios/GoogleService-Info.plist`
- ✅ `ios/Runner/GoogleService-Info.plist`

### 6. Git Kontrolü

Bu dosyaların git tarafından takip edilmediğinden emin ol:

```bash
git status
```

Çıktıda bu dosyalar **görünmemeli**. Eğer görünüyorsa `.gitignore` dosyasını kontrol et.

## 🚨 Önemli Uyarılar

1. **ASLA** `.env` dosyasını commit etme
2. **ASLA** Firebase config dosyalarını GitHub'a yükleme
3. **ASLA** API key'leri public yerde paylaşma
4. Ekip üyeleriyle dosyaları güvenli kanallardan paylaş (1Password, encrypted email, etc.)

## 🔄 CI/CD İçin

GitHub Actions veya başka CI/CD kullanıyorsan:
- Repository secrets kullan
- Environment variables olarak tanımla
- Build sırasında config dosyalarını dinamik oluştur

## 📞 Yardım

Sorun yaşıyorsan proje sahibiyle iletişime geç!
