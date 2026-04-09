package chat.bemindepower.bmpchat

import com.famedly.fcm_shared_isolate.FcmSharedIsolateService
import com.google.firebase.messaging.RemoteMessage

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor.DartEntrypoint
import android.content.Context
import android.util.Log

class FcmPushService : FcmSharedIsolateService() {
    override fun getEngine(): FlutterEngine {
        return provideEngine(getApplicationContext())
    }
    
    override fun onMessageReceived(remoteMessage: RemoteMessage) {
        Log.d("FCM_DEBUG", "=== FCM MESSAGE RECEIVED ===")
        Log.d("FCM_DEBUG", "From: ${remoteMessage.from}")
        Log.d("FCM_DEBUG", "Data: ${remoteMessage.data}")
        Log.d("FCM_DEBUG", "Data Size: ${remoteMessage.data.size}")
        Log.d("FCM_DEBUG", "Has Notification: ${remoteMessage.notification != null}")
        remoteMessage.notification?.let { notification ->
            Log.d("FCM_DEBUG", "Notification Title: ${notification.title}")
            Log.d("FCM_DEBUG", "Notification Body: ${notification.body}")
            Log.d("FCM_DEBUG", "Notification Icon: ${notification.icon}")
            Log.d("FCM_DEBUG", "Notification Sound: ${notification.sound}")
            Log.d("FCM_DEBUG", "Notification Channel: ${notification.channelId}")
        }
        Log.d("FCM_DEBUG", "Message ID: ${remoteMessage.messageId}")
        Log.d("FCM_DEBUG", "Message Type: ${remoteMessage.messageType}")
        Log.d("FCM_DEBUG", "=============================")

        // Call parent method to process the message
        super.onMessageReceived(remoteMessage)
    }
    
    override fun onNewToken(token: String) {
        Log.d("FCM_DEBUG", "=== FCM TOKEN REFRESH ===")
        Log.d("FCM_DEBUG", "New Token: $token")
        Log.d("FCM_DEBUG", "=========================")
        super.onNewToken(token)
    }

    companion object {
        fun provideEngine(context: Context): FlutterEngine {
            var engine = MainActivity.engine
            if (engine == null) {
                engine = MainActivity.provideEngine(context)
                engine.getLocalizationPlugin().sendLocalesToFlutter(
                    context.getResources().getConfiguration())
                engine.getDartExecutor().executeDartEntrypoint(
                    DartEntrypoint.createDefault())
            }
            return engine
        }
    }
}
