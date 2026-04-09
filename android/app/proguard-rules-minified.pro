# Maximum optimization rules for APK size reduction

# Remove all unused classes, methods, and fields
-dontskipnonpubliclibraryclasses
-dontskipnonpubliclibraryclassmembers

# Aggressive optimization
-optimizations !code/simplification/arithmetic,!code/simplification/cast,!field/*,!class/merging/*
-optimizationpasses 8
-allowaccessmodification

# Remove all logging statements
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
    public static *** w(...);
    public static *** e(...);
}

# Remove unused resources more aggressively
-keep class **.R$* {
    public static <fields>;
}

# Remove unused attributes
-keepattributes *Annotation*
-keepattributes Exceptions,InnerClasses,Signature,Deprecated

# Remove debug information
-renamesourcefileattribute SourceFile

# Remove unused native libraries
-dontwarn **
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# Keep only essential classes
-keep class androidx.** { *; }
-keep class android.** { *; }
-keep class io.flutter.** { *; }
-keep class org.matrix.** { *; }
-keep class org.webrtc.** { *; }

# Remove all other classes if not used
-repackageclasses ''
-allowaccessmodification

# Optimize string constants
-adaptclassstrings
-adaptresourcefilenames
-adaptresourcefilecontents

# Remove unused META-INF files
-dontnote **
-dontwarn **

# Enhanced optimizations for size reduction
-mergeinterfacesaggressively
-allowaccessmodification
-repackageclasses ''

# Remove unused code more aggressively
-assumenosideeffects class java.io.PrintStream {
    public void println(...);
    public void print(...);
}

-assumenosideeffects class java.io.PrintWriter {
    public void println(...);
    public void print(...);
}

# Remove unused string constants
-adaptclassstrings
-adaptresourcefilenames
-adaptresourcefilecontents

# Remove unused native methods
-dontwarn **.NativeMethodAccessorImpl
-dontwarn **.NativeMethodAccessorImpl**

# Remove unused reflection
-dontwarn java.lang.reflect.**
-dontwarn sun.misc.**

# Remove unused serialization
-dontwarn java.io.Serializable
-dontwarn java.io.Externalizable

# Remove unused annotations
-dontwarn java.lang.annotation.**
-dontwarn javax.annotation.**

# Remove unused security
-dontwarn java.security.**
-dontwarn javax.security.**

# Remove unused crypto
-dontwarn javax.crypto.**
-dontwarn java.security.cert.**

# Remove unused networking
-dontwarn java.net.**
-dontwarn javax.net.**

# Remove unused XML
-dontwarn org.xml.**
-dontwarn javax.xml.**

# Remove unused JSON
-dontwarn org.json.**
-dontwarn com.google.gson.**

# Remove unused HTTP
-dontwarn okhttp3.**
-dontwarn retrofit2.**

# Remove unused image processing
-dontwarn com.bumptech.glide.**
-dontwarn com.squareup.picasso.**

# Remove unused video/audio
-dontwarn com.google.android.exoplayer.**
-dontwarn androidx.media.**

# Remove unused maps
-dontwarn com.google.android.gms.maps.**
-dontwarn com.google.android.gms.location.**

# Remove unused Firebase
-dontwarn com.google.firebase.**
-dontwarn com.google.android.gms.**

# Remove unused Flutter plugins
-dontwarn io.flutter.plugins.**
-dontwarn io.flutter.embedding.**

# Keep only essential Matrix classes
-keep class org.matrix.android.sdk.** { *; }
-keep class org.matrix.android.sdk.api.** { *; }
-keep class org.matrix.android.sdk.internal.** { *; }

# Keep only essential WebRTC classes
-keep class org.webrtc.** { *; }
-keep class org.webrtc.webrtcsdk.** { *; }

# Keep only essential Flutter classes
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Remove all other unused classes
-repackageclasses ''
-allowaccessmodification
