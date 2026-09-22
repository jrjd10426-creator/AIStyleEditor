# AI Style Editor — V3 (Appcircle Ready)

این نسخه برای انتقال پروژه به سرویس‌های Cloud Build مثل Appcircle آماده‌تر شده است.

## ساختار
- `app/` — کد برنامه اندروید
- `gradlew` — اسکریپت اجرای Gradle در محیط Linux/CI
- `gradlew.bat` — اسکریپت Windows
- `gradle/wrapper/gradle-wrapper.properties` — نسخه Gradle 8.9
- `gradle.properties` — تنظیمات build

## نکته مهم
نسخه فعلی هنوز «مدل مولد هوش مصنوعی واقعی» مثل CapCut نیست؛ قابلیت انتقال سبک در V2 یک نمونه سبک و آفلاین است که ویژگی‌های رنگ/روشنایی تصویر نمونه را تحلیل می‌کند.

## برای ساخت APK در Appcircle
1. پروژه را در GitHub قرار بده.
2. در Appcircle یک Android Build Profile بساز و Repository را وصل کن.
3. Build Configuration را روی پروژه `app` قرار بده.
4. دستور build را با `./gradlew assembleDebug` انجام بده.
5. خروجی Debug APK را از Artifacts دریافت کن.

اگر Appcircle از Gradle نصب‌شده استفاده کند، `gradlew` همان Gradle موجود را اجرا می‌کند؛ در غیر این صورت تلاش می‌کند Gradle 8.9 را دریافت کند.
