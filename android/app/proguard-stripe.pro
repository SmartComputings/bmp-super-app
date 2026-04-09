# Stripe ProGuard Rules
-keep class com.stripe.** { *; }
-keep class com.google.android.material.** { *; }
-dontwarn com.stripe.**

# Keep Material Components
-keep class androidx.** { *; }
-dontwarn androidx.**

# Keep Flutter Stripe plugin
-keep class com.flutter.stripe.** { *; }
-dontwarn com.flutter.stripe.**

# Google Play Core
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**