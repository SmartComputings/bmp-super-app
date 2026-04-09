# Stripe SDK - Critical for AAB upload
-keep class com.stripe.** { *; }
-keep interface com.stripe.** { *; }
-dontwarn com.stripe.**

# Stripe native components
-keep class com.stripe.android.** { *; }
-keep class com.stripe.stripesdk.** { *; }

# Material Components (required by Stripe)
-keep class com.google.android.material.** { *; }
-dontwarn com.google.android.material.**

# AndroidX components
-keep class androidx.** { *; }
-dontwarn androidx.**

# Flutter Stripe plugin
-keep class com.flutter.stripe.** { *; }
-dontwarn com.flutter.stripe.**

# Prevent obfuscation of Stripe callbacks
-keepclassmembers class * {
    @com.stripe.android.** *;
}

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}