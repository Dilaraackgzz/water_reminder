# Aqualert - Monetizasyon Uygulama Planı

**Model:** Freemium + Abonelik + Tek Seferlik Premium Unlock  
**Fiyat:** $19.99 (ömür boyu) veya $0.99/ay / $7.99/yıl  
**Paket:** RevenueCat (`purchases_flutter`)  
**Son Güncelleme:** 4 Mayıs 2026  
**Durum:** Aktif geliştirme

---

## Genel Strateji

Kullanıcı uygulamayı ücretsiz indirir ve temel özellikleri sonsuza kadar kullanabilir.  
Premium özelliklere ulaşmak için tek seferlik ödeme yapar — abonelik baskısı yok.  
Bu model, benzer sağlık uygulamalarında (Waterllama, Hydro Coach) en yüksek dönüşüm oranına sahip.

---

## Ücretsiz / Premium Özellik Sınırı

### Ücretsiz (Free) — Sonsuza kadar

| Özellik | Limit |
|---------|-------|
| Günlük su takibi | ✅ Sınırsız |
| Hızlı ekleme butonları (250/350/500ml) | ✅ Mevcut |
| Günlük istatistik (bugün) | ✅ Mevcut |
| Hatırlatıcı | ✅ Sabit aralıklı, 1 adet |
| Başarımlar | ✅ 9 temel başarım (First Drop, Daily Goal 1/5/10×, Streak 3/7 gün, Total 1L/5L/10L) |
| Dil seçimi (15 dil) | ✅ Sınırsız |
| Tema (Light/Dark/System) | ✅ Mevcut |
| Profil & hedef belirleme | ✅ Mevcut |
| Tüm istatistikler (haftalık/aylık/yıllık) | ❌ Premium |
| Özel su miktarı girişi | ❌ Premium |
| Çoklu hatırlatıcı (özel saatler) | ❌ Premium |
| Premium başarımlar (8 adet) | ❌ Premium |
| Veri export (JSON) | ❌ Premium |
| Premium temalar | ❌ Premium |

### Premium — $0.99/ay · $7.99/yıl · $19.99 ömür boyu

| Özellik | Açıklama |
|---------|----------|
| Tüm istatistikler | Haftalık, aylık, yıllık grafikler |
| Özel miktar girişi | İstediğin miktarı girebilirsin |
| Çoklu hatırlatıcı | Sınırsız, özel saatlerle |
| Premium başarımlar | Daily Goal 30×, Streak 14/30/60 gün, Total 50L/100L, Consistency 7/30 gün |
| Veri export | JSON formatında dışa aktarım |
| Premium temalar | Ocean Blue, Sunset Orange, Forest Green, Midnight Purple |
| Reklamsız deneyim | Gelecekte reklam eklenirse premium'da gösterilmez |

---

## Teknik Mimari

### Yeni Dosyalar (Oluşturulacak)

```
lib/
├── core/
│   ├── services/
│   │   └── premium_service.dart          # RevenueCat entegrasyonu, satın alma
│   └── providers/
│       └── premium_provider.dart         # isPremium state, global erişim
│
├── features/
│   └── premium/
│       ├── presentation/
│       │   ├── screens/
│       │   │   └── paywall_screen.dart   # Satın alma ekranı
│       │   └── widgets/
│       │       ├── premium_badge.dart    # "Premium" rozeti
│       │       └── premium_gate.dart     # Feature gating widget
│       └── domain/
│           └── models/
│               └── premium_status.dart   # Freezed model
│
└── l10n/
    └── (tüm .arb dosyaları güncellenir)  # Premium metinleri
```

### Değiştirilecek Mevcut Dosyalar

```
lib/
├── core/
│   └── routing/app_router.dart           # /paywall rotası eklenir
│
├── features/
│   ├── statistics/presentation/          # Haftalık/Aylık/Yıllık → Premium gate
│   ├── home/presentation/                # Özel miktar butonu → Premium gate
│   ├── reminders/presentation/           # Çoklu reminder → Premium gate
│   ├── achievements/presentation/        # 4+ başarım → Premium gate
│   ├── settings/presentation/            # Export → Premium gate, Premium section ekle
│   └── profile/presentation/             # Premium badge
│
└── pubspec.yaml                          # purchases_flutter eklenir
```

---

## Uygulama Adımları

### ADIM 1 — RevenueCat Kurulumu
**Tahmini süre:** 2-3 saat  
**Durum:** ⏳ Seni bekliyor (API key girişi gerekli)

#### 1.1 RevenueCat Hesabı ve Proje Oluşturma
- [ ] [app.revenuecat.com](https://app.revenuecat.com) adresinde hesap aç
- [ ] Yeni proje oluştur: "Aqualert"
- [ ] Android uygulaması ekle → Package: `com.dlrackgz.aqualert`
- [ ] iOS uygulaması ekle → Bundle ID: `com.dlrackgz.aqualert`
- [ ] Public API key'leri kaydet (Android + iOS ayrı)

#### 1.2 Google Play & App Store Ürün Tanımları
- [ ] **Google Play Console'da:**
  - Abonelik oluştur: `aqualert_monthly` ($0.99/ay), `aqualert_yearly` ($7.99/yıl)
  - Non-consumable oluştur: `aqualert_lifetime` ($19.99)
- [ ] **App Store Connect'te:**
  - Subscription: `com.dlrackgz.aqualert.monthly` ($0.99), `com.dlrackgz.aqualert.yearly` ($7.99)
  - Non-consumable IAP: `com.dlrackgz.aqualert.lifetime` ($19.99)

#### 1.3 RevenueCat'te Entitlement & Offering Tanımla
- [ ] Entitlement oluştur: `premium`
- [ ] Products ekle: `aqualert_premium` (ve opsiyonel abonelikler)
- [ ] Offering oluştur: `default` → Packages: monthly, annual, lifetime

#### 1.4 pubspec.yaml Güncellemesi
```yaml
# pubspec.yaml'a ekle:
purchases_flutter: ^8.0.0
```
- [ ] `flutter pub get` çalıştır

---

### ADIM 2 — PremiumService & PremiumProvider
**Tahmini süre:** 2 saat  
**Durum:** ✅ Tamamlandı

#### 2.1 `premium_service.dart` Oluştur

RevenueCat SDK başlatma, satın alma, geri yükleme ve premium kontrolü için.

```
Yapılacaklar:
- RevenueCat'i initialize et (Android/iOS API key'leri)
- isPremium() → CustomerInfo kontrol et
- purchasePremium() → Package satın al
- restorePurchases() → Önceki alımları geri yükle
- setUserId(uid) → Firebase UID ile eşleştir
```

#### 2.2 `premium_provider.dart` Oluştur

```
Yapılacaklar:
- isPremiumProvider (AsyncNotifier<bool>)
- purchasePremiumProvider (action)
- restorePurchasesProvider (action)
- premiumStatusProvider (CustomerInfo stream)
```

---

### ADIM 3 — PremiumGate Widget
**Tahmini süre:** 1 saat  
**Durum:** ✅ Tamamlandı

`PremiumGate` — her kısıtlı özelliğin önüne koyulan wrapper widget.

```dart
// Kullanım örneği:
PremiumGate(
  child: AdvancedStatisticsWidget(),
  // isPremium false ise paywall'a yönlendirir veya blur gösterir
)
```

Davranış seçenekleri:
- **Blur + kilit ikonu:** Özelliği arkada göster, üstünde kilit
- **Yönlendirme:** Direkt paywall ekranına at
- **Banner:** "Premium özellik" banner'ı göster

Karar: **Blur + kilit ikonu + tıklanınca paywall** (en iyi UX)

---

### ADIM 4 — Paywall Ekranı
**Tahmini süre:** 3-4 saat  
**Durum:** ✅ Tamamlandı

#### Tasarım Kararları
- Tam ekran, modal olarak açılır (GoRouter ile `/paywall`)
- Üstte animasyonlu su damlası veya Lottie animasyon
- Premium özellikler listesi (ikon + açıklama)
- Fiyat seçenekleri: Tek seferlik / Aylık / Yıllık
- "En Popüler" rozeti → Yıllık plana
- Satın Al butonu (RevenueCat package)
- Alt kısım: "Satın alımı geri yükle" linki
- Gizlilik Politikası + Kullanım Koşulları linki

#### Ekran Bölümleri
```
[X Kapat]

   💧 Aqualert Premium

   Hidrasyon hedeflerini tam potansiyelle ulaş

   ✅ Sınırsız hatırlatıcı
   ✅ Haftalık/Aylık/Yıllık istatistikler
   ✅ Tüm başarımlar
   ✅ Veri export
   ✅ Premium temalar
   ✅ Gelecekteki tüm özellikler

   [  Aylık   $0.99/ay  ]
   [ Yıllık  $7.99/yıl  ← En Popüler ]
   [ Ömür boyu  $19.99  ]

   [ PREMIUM'A GEÇ ]

   Satın alımı geri yükle · Gizlilik · Koşullar
```

---

### ADIM 5 — Mevcut Özelliklere Gate Ekleme
**Tahmini süre:** 3-4 saat  
**Durum:** ✅ Tamamlandı

#### 5.1 İstatistikler — Tüm ekran premium
- [x] `statistics_screen.dart`: Premium değilse tüm ekran yerine upsell kartı gösterilir
- [x] Premium değilse haftalık/aylık/yıllık hiçbir veri yüklenmez, "Premium'a Geç" butonu çıkar
- [x] `ModernAppBar` subtitle'ı premium olmayanda gizlenir

#### 5.2 Ana Ekran — Özel Miktar
- [x] `home_screen.dart`: "+" özel miktar butonuna premium kontrolü
- [x] Premium değilse paywall'a yönlendir (kilit ikonu gösterilir)

#### 5.3 Hatırlatıcılar — Çoklu Reminder
- [x] `reminders/`: "Premium: Özel Saatli Hatırlatıcılar" bölümü eklendi, PremiumGate ile kilitli

#### 5.4 Başarımlar — Kapsamlı Yenileme
- [x] Toplam 17 başarım: 9 ücretsiz + 8 premium
- [x] Premium başarım kartları `ImageFiltered` blur efektiyle kilitli görünür
- [x] Ekran 4 kategoriye ayrıldı: Kazanıldı / Devam Ediyor / Başlanmadı / Premium Başarımlar
- [x] Blur üzerinde "🔒 Premium" rozeti, tıklanınca paywall açılır
- [x] Başarımlar su eklenince anında güncellenir (`checkAchievements` artık `addWater()`'dan çağrılıyor)
- [x] `initializeAchievements` artık migration destekler — eksik başarımları mevcut kullanıcıya da ekler
- [x] `goalJustReached` mantığı: günlük hedef sayacı günde yalnızca bir kez artar

#### 5.5 Ayarlar — Veri Export
- [x] `settings_screen.dart`: Export butonuna premium kontrolü eklendi

#### 5.6 Ayarlar — Premium Bölümü
- [x] Settings'e "Premium" section eklendi
- [x] "Premium'a Geç" tile (premium değilse) → paywall açar
- [x] "Premium Aktif ✅" gösterge (premium ise)
- [x] "Satın alımı geri yükle" seçeneği

---

### ADIM 6 — Premium Temalar
**Tahmini süre:** 2 saat  
**Durum:** ✅ Tamamlandı

4 yeni renk paleti (mevcut teal'e ek):
- **Ocean Blue** — koyu mavi tonlar
- **Sunset Orange** — turuncu/kırmızı tonlar  
- **Forest Green** — yeşil tonlar
- **Midnight Purple** — mor/lacivert tonlar

Uygulama:
- [x] `app_theme.dart`'a `PremiumThemeVariant` enum + 4 yeni tema eklendi
- [x] `theme_service.dart`'a premium tema kayıt/okuma eklendi
- [x] `theme_provider.dart`'a `PremiumThemeNotifier` eklendi
- [x] `theme_dialog.dart`'a renk swatchları + kilit ikonu eklendi
- [x] `main.dart` premium tema varyantını kullanacak şekilde güncellendi

---

### ADIM 7 — Localization (Çeviriler)
**Tahmini süre:** 2-3 saat  
**Durum:** ✅ Tamamlandı (EN + TR tam, 13 dil İngilizce fallback)

#### Eklenecek Yeni String'ler (app_en.arb + app_tr.arb + 13 dil)

```
premium_title, premium_subtitle
premium_feature_reminders, premium_feature_stats,
premium_feature_achievements, premium_feature_export,
premium_feature_themes, premium_feature_future
premium_price_monthly, premium_price_yearly, premium_price_lifetime
premium_cta_button
premium_restore, premium_active
premium_gate_locked_message
paywall_close
```

---

### ADIM 8 — Analytics & Tracking
**Tahmini süre:** 1 saat  
**Durum:** ✅ Tamamlandı

Firebase Analytics event'leri:
- [x] `paywall_viewed` — paywall görüntülendiğinde
- [x] `paywall_closed` — kapatıldığında (conversion takibi için)
- [x] `purchase_initiated` — satın alma başladığında (package_id parametresi ile)
- [x] `purchase_completed` — başarılı satın alma
- [x] `purchase_failed` — başarısız satın alma
- [x] `purchase_restored` — geri yükleme

RevenueCat kendi analytics'ini de sunuyor (dashboard'dan takip edilir).

---

### ADIM 9 — Test
**Tahmini süre:** 2-3 saat  
**Durum:** ⬜ Tamamlandı

#### Unit Testler
- [ ] `PremiumService` testleri (mock RevenueCat)
- [ ] `PremiumProvider` testleri
- [ ] `PremiumGate` widget testi

#### Manuel Test Senaryoları
- [ ] Ücretsiz kullanıcı kısıtlı özelliklere erişmeye çalışır → Paywall açılır
- [ ] Satın alma akışı başlatılır → Google/Apple ödeme ekranı açılır
- [ ] Başarılı satın alma → Premium aktif, tüm özellikler açılır
- [ ] Geri yükleme → Daha önce satın almış kullanıcı premium'unu geri alır
- [ ] Uygulama yeniden açıldığında premium durumu korunur
- [ ] Offline → Premium durumu cache'den okunur (RevenueCat otomatik halleder)
- [ ] Google Play Sandbox ile test satın alması

---

### ADIM 10 — Store Listing Güncellemesi
**Tahmini süre:** 1 saat  
**Durum:** ⬜ Bekliyor

- [ ] Google Play store açıklamasına "Freemium" ibaresi ekle
- [ ] "Premium özellikleri keşfet" bölümü ekle
- [ ] Screenshots'a paywall ekranını ekle
- [ ] App Store "In-App Purchases" bölümünü doldur

---

## Öncelik ve Sıralama

```
Hafta 1:
├── ADIM 1: RevenueCat kurulumu + Play/App Store ürün tanımları
├── ADIM 2: PremiumService + PremiumProvider
└── ADIM 3: PremiumGate widget

Hafta 2:
├── ADIM 4: Paywall ekranı (UI)
├── ADIM 5: Mevcut özelliklere gate ekleme
└── ADIM 7: Localization güncellemesi

Hafta 3:
├── ADIM 6: Premium temalar
├── ADIM 8: Analytics
└── ADIM 9: Test
    └── ADIM 10: Store listing
```

---

## Gelir Projeksiyonu (Tahmin)

| Senaryo | Aylık İndirme | Dönüşüm | Aylık Gelir |
|---------|---------------|---------|-------------|
| Düşük | 500 | %3 | ~$120 |
| Orta | 2.000 | %5 | ~$800 |
| İyi | 10.000 | %7 | ~$5.600 |

*Ortalama sepet değeri ~$8 (yıllık + ömür boyu karışımı) baz alındı. Google Play/App Store %30 komisyon dahil değil. RevenueCat ücretsiz (ilk $2.500/ay).*

---

## Teknik Notlar

- **RevenueCat vs Doğrudan Billing API:** RevenueCat tercih edildi çünkü hem Android hem iOS'u tek SDK ile halleder, receipt validation sunucu taraflı yapılır (güvenli), dashboard'dan gerçek zamanlı analitik sunar.
- **Offline Support:** RevenueCat son bilinen premium durumunu cache'ler — internet olmadan da çalışır.
- **Güvenlik:** Premium durumu asla sadece client'ta saklanmaz; RevenueCat sunucusu doğrular.
- **Firebase UID eşleştirme:** `Purchases.logIn(firebaseUID)` ile kullanıcı cihaz değiştirdiğinde premium'unu korur.

---

## İlgili Dosyalar

- `PROJECT_PLAN.md` — Genel proje planı
- `pubspec.yaml` — Bağımlılıklar
- `lib/core/services/` — Servis katmanı
- `lib/core/providers/` — Global providerlar
- `lib/features/premium/` — Yeni premium feature modülü

---

**Son Güncelleme:** 4 Mayıs 2026  
**Sorumlu:** Dilara Acıkgöz  
**Hedef:** Store yayınından önce monetizasyon entegrasyonu tamamlanacak

---

## Tamamlanan İşler Özeti

| Adım | Konu | Durum |
|------|------|-------|
| 1 | RevenueCat kurulumu | ⏳ API key bekleniyor |
| 2 | PremiumService + PremiumProvider | ✅ |
| 3 | PremiumGate widget | ✅ |
| 4 | Paywall ekranı | ✅ |
| 5.1 | İstatistikler — tüm ekran premium (upsell kartı) | ✅ |
| 5.2 | Ana ekran — özel miktar premium | ✅ |
| 5.3 | Hatırlatıcılar — çoklu reminder premium | ✅ |
| 5.4 | Başarımlar — 17 başarım, blur efekti, gerçek zamanlı güncelleme | ✅ |
| 5.5 | Ayarlar — export premium | ✅ |
| 5.6 | Ayarlar — premium bölümü | ✅ |
| 6 | Premium temalar | ✅ |
| 7 | Localization (EN+TR tam, 13 dil fallback) | ✅ |
| 8 | Analytics & Tracking | ✅ |
| 9 | Testler | ⬜ |
| 10 | Store listing | ⬜ |
