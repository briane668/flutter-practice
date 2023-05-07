package com.example.flutter_application_1


import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

import com.example.stylish.tappay.CardInfo
import com.example.stylish.tappay.TapPayHelper
import com.example.stylish.tappay.TapPayHelperImpl

class MainActivity : FlutterActivity() {

    private val tapPayHelper: TapPayHelper by lazy {
        TapPayHelperImpl(this, applicationContext)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getTappayPrime" -> {
                    val cardInfo = CardInfo(
                        cardNumber = call.argument<String>("cardNumber"),
                        dueMonth = call.argument<String>("dueMonth"),
                        dueYear = call.argument<String>("dueYear"),
                        ccv = call.argument<String>("ccv")
                    )
                    tapPayHelper.checkout(
                        cardInfo = cardInfo,
                        onSuccess = { prime ->
                            result.success(prime)
                        },
                        onFailure = { message ->
                            result.error("Error", message, null)
                        }
                    )
                }

                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    companion object {
        private val CHANNEL = "com.stylish.app/tappay"
    }
}

