package com.example.stylish.tappay

import android.content.Context
import tech.cherri.tpdirect.api.TPDCard
import tech.cherri.tpdirect.api.TPDServerType
import tech.cherri.tpdirect.api.TPDSetup

interface TapPayHelper {
    val appId: Int
    val appKey: String
    fun checkout(
        cardInfo: CardInfo,
        onSuccess: (String) -> Unit,
        onFailure: (String) -> Unit
    )
}

class TapPayHelperImpl(
    private val context: Context,
    private val applicationContext: Context
) : TapPayHelper {
    override val appId: Int = 12348

    override val appKey: String = "app_pa1pQcKoY22IlnSXq5m5WP5jFKzoRG58VEXpT7wU62ud7mMbDOGzCYIlzzLF"

    override fun checkout(cardInfo: CardInfo, onSuccess: (String) -> Unit, onFailure: (String) -> Unit) {
        TPDSetup.initInstance(
            applicationContext, appId, appKey, TPDServerType.Sandbox
        )
        getPrime(
            cardInfo = cardInfo,
            onSuccess = onSuccess,
            onFailure = onFailure
        )
    }

    private fun getPrime(
        cardInfo: CardInfo,
        onSuccess: (String) -> Unit,
        onFailure: (String) -> Unit,
    ) {
        with(cardInfo) {
            if (cardNumber == null || dueMonth == null || dueYear == null || ccv == null) {
                onFailure("Invalid card info: $cardInfo")
                return
            }
            val cn = StringBuffer(cardNumber)
            val dm = StringBuffer(dueMonth)
            val dy = StringBuffer(dueYear)
            val cv = StringBuffer(ccv)
            val card = TPDCard(context, cn, dm, dy, cv).onSuccessCallback { tpPrime, _, _, _ ->
                onSuccess(tpPrime)
            }.onFailureCallback { status, message ->
                onFailure(message)
            }
            card.createToken(/* geoLocation = */ "Unknown")
        }
    }
}