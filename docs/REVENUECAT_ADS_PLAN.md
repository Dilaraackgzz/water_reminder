# RevenueCat + Banner Reklam Entegrasyon Planı

**Tarih:** Haziran 2026  
**Amaç:** RevenueCat'i gerçek modda aktif etmek + premium olmayan kullanıcılara banner reklam göstermek

---

## Mevcut Durum

| Bileşen | Durum | Açıklama |
|---------|-------|----------|
| RevenueCat kodu | ✅ Tamamlandı | `premium_service.dart` gerçek SDK kullanıyor |
| `purchases_flutter` paketi | ✅ Eklendi | v8.11.0 |
| Banner reklam | ✅ Tamamlandı | `BannerAdWidget` home + statistics'e eklendi |
| `google_mobile_ads` paketi | ✅ Eklendi | v5.3.1 |
| AdMob App ID (Android) | ⚠️ Test ID | AndroidManifest.xml'de test ID var, gerçekle değiştir |
| AdMob App ID (iOS) | ⚠️ Test ID | Info.plist'de test ID var, gerçekle değiştir |
| RevenueCat API key (Android) | ❌ Girilmeli | `premium_service.dart` satır 11 |
| RevenueCat API key (iOS) | ❌ Girilmeli | `premium_service.dart` satır 12 |
| AdMob Banner Ad Unit (Android) | ⚠️ Test ID | `ad_service.dart` satır 11 |
| AdMob Banner Ad Unit (iOS) | ⚠️ Test ID | `ad_service.dart` satır 13 |

---

## Yapılacaklar

### ADIM 1 — Kullanıcı Tarafından Yapılacaklar (Manuel)

Bunlar kod değişikliği değil, console/dashboard işlemleri:

#### 1.1 RevenueCat
- [ ] [app.revenuecat.com](https://app.revenuecat.com) → Proje aç: "Aqualert"
- [ ] Android uygulaması ekle → Package: `com.dlrackgz.aqualert`
- [ ] iOS uygulaması ekle → Bundle ID: `com.dlrackgz.aqualert`
- [ ] Entitlement oluştur: `premium`
- [ ] Offering oluştur: `default` (monthly / annual / lifetime paketleriyle)
- [ ] **Android Public API Key'i** kopyala
- [ ] **iOS Public API Key'i** kopyala

#### 1.2 Google AdMob
- [ ] [admob.google.com](https://admob.google.com) → Yeni uygulama ekle: "Aqualert"
- [ ] Platform: Android → **App ID** al (ca-app-pub-XXXX~YYYY formatında)
- [ ] Platform: iOS → **App ID** al
- [ ] Android için Banner Ad Unit oluştur → **Ad Unit ID** al
- [ ] iOS için Banner Ad Unit oluştur → **Ad Unit ID** al

---

### ADIM 2 — Flutter Paketi Ekle (Kod)

`pubspec.yaml`'a şunlar eklenir:
```yaml
purchases_flutter: ^8.0.0
google_mobile_ads: ^5.2.0
```

---

### ADIM 3 — Platform Konfigürasyonu (Kod)

#### 3.1 Android — AndroidManifest.xml
```xml
<meta-data
    android:name="com.google.android.gms.ads.APPLICATION_ID"
    android:value="ca-app-pub-SENIN_ANDROID_APP_ID"/>
```

#### 3.2 iOS — Info.plist
```xml
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-SENIN_IOS_APP_ID</string>
<key>SKAdNetworkItems</key>
<array>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>cstr6suwn9.skadnetwork</string>
  </dict>
</array>
```

---

### ADIM 4 — RevenueCat Aktivasyonu (Kod)

`premium_service.dart`'ta mock moddan çıkılır:
- `purchases_flutter` import'u aktif edilir
- `initialize()` gerçek SDK'yı başlatır
- `isPremium()`, `purchasePackage()`, `restorePurchases()` gerçek RevenueCat API'sini çağırır

`main.dart`'ta `PremiumService.initialize()` çağrısı eklenir.

---

### ADIM 5 — AdService Oluştur (Kod)

`lib/core/services/ad_service.dart`:
- `initialize()` → `MobileAds.instance.initialize()`
- `loadBannerAd()` → `BannerAd` yükle
- `disposeBannerAd()` → dispose

---

### ADIM 6 — BannerAdWidget Oluştur (Kod)

`lib/shared/widgets/banner_ad_widget.dart`:
- `isPremiumProvider` izler
- Premium ise: `SizedBox.shrink()` (reklam gösterilmez)
- Premium değilse: `AdWidget` sarılı container (50px yükseklik)

---

### ADIM 7 — Banner'ı Ekranlara Entegre Et (Kod)

Banner'ın ekleneceği yerler:

| Ekran | Konum | Öncelik |
|-------|-------|---------|
| Home Screen | Alt kısım (body'nin en sonuna) | ⭐ Yüksek |
| Statistics Screen | Üst kısım (content öncesi) | ⭐ Orta |
| Achievements Screen | Alt kısım | Orta |

Ana yaklaşım: Scaffold'un `bottomNavigationBar` yerine body'nin en altına sabit banner.

---

### ADIM 8 — API Key Entegrasyonu (Kod + Kullanıcı)

`premium_service.dart` içindeki placeholder key'ler gerçek key'lerle değiştirilir:
```dart
const String _androidApiKey = 'appl_XXXX...';  // RevenueCat Android
const String _iosApiKey    = 'appl_YYYY...';   // RevenueCat iOS
```

`ad_service.dart` içindeki Ad Unit ID'ler:
```dart
const String _androidBannerAdUnitId = 'ca-app-pub-XXXX/YYYY';
const String _iosBannerAdUnitId     = 'ca-app-pub-XXXX/ZZZZ';
```

---

## Uygulama Sırası

```
Bugün:
├── ADIM 2: pubspec.yaml güncelle
├── ADIM 3: AndroidManifest + Info.plist (test ID'leriyle)
├── ADIM 4: RevenueCat kodu aktif et (mock mode korunur, key yoksa)
├── ADIM 5: AdService oluştur
├── ADIM 6: BannerAdWidget oluştur
└── ADIM 7: Home Screen'e banner ekle

Sonra (konsol hazır olduğunda):
├── ADIM 1: RevenueCat dashboard + AdMob dashboard
└── ADIM 8: Gerçek key'leri gir
```

---

## Banner Reklam Politikası

- **Konumu:** Home screen altı (en az müdahalecilik)
- **Boyutu:** Adaptive Banner (cihaza göre otomatik)
- **Gösterim koşulu:** `isPremium == false` ise göster
- **Premium'a geçince:** Reklam anında kalkar (state değişikliği ile)
- **Test süreci:** Test Ad Unit ID ile başla, yayın öncesi gerçekle değiştir

---

## Test Ad Unit ID'leri (Geçici)

Gerçek ID gelene kadar kullanılacak:

| Platform | Test Banner Ad Unit ID |
|----------|----------------------|
| Android | `ca-app-pub-3940256099942544/6300978111` |
| iOS | `ca-app-pub-3940256099942544/2934735716` |

> Bu ID'ler Google'ın resmi test ID'leridir, üretimde kullanılamaz.

---

## Notlar

- RevenueCat `purchases_flutter` v8.x Flutter 3.x gerektirir ✅
- `google_mobile_ads` v5.x Google Mobile Ads SDK 22+ gerektirir
- AdMob politikası gereği uygulama yayına girmeden önce gerçek App ID girilmeli
- Test cihazını AdMob konsolundan kaydetmeyi unutma (gerçeksiz reklam gözükmesin)
