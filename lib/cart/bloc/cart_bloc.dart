import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:stylish/cart/bloc/cart_event.dart';
import 'package:stylish/cart/bloc/cart_state.dart';

import 'cart_info_input.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<TextInputUpdated>(_onTextInputUpdated);
    on<StartCheckoutEvent>(_onStartCheckout);
  }

  static const platform = MethodChannel('com.stylish.app/tappay');

  _onTextInputUpdated(
    TextInputUpdated event,
    Emitter<CartState> emit,
  ) {
    switch (event.inputType) {
      case CartInfoInput.cardNumber:
        emit(state.copyWith(cardNumber: event.text));
        break;
      case CartInfoInput.dueMonthAndYear:
        emit(state.copyWith(dueMonthAndYear: event.text));
        break;
      case CartInfoInput.ccv:
        emit(state.copyWith(ccv: event.text));
        break;
    }
  }

  Future<void> _onStartCheckout(
    StartCheckoutEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    if (_checkIsCardNumberValid(emit) == false) {
      return;
    }

    String? prime;
    String errorMessage = '';
    String dueMonth = state.dueMonthAndYear.substring(0, 2);
    String dueYear = state.dueMonthAndYear.substring(2, 4);

    try {
      final String result = await platform.invokeMethod('getTappayPrime', {
        'cardNumber': state.cardNumber,
        'dueMonth': dueMonth,
        'dueYear': dueYear,
        'ccv': state.ccv
      });
      prime = result;
    } on PlatformException catch (e) {
      errorMessage = e.message ?? 'Unknown error';
    } finally {
      if (errorMessage.isNotEmpty) prime = '';
      emit(state.copyWith(isLoading: false, prime: prime, errorMessage: errorMessage));
    }
  }

  bool _checkIsCardNumberValid(
    Emitter<CartState> emit,
  ) {
    bool result = true;
    String errorMessage = '';
    if (state.cardNumber.length != 16) {
      errorMessage += 'Card number must be 16 digits\n';
      result = false;
    }
    if (state.dueMonthAndYear.length != 4) {
      errorMessage += 'Due month and year must be 4 digits\n';
      result = false;
    }
    if (state.ccv.isEmpty) {
      errorMessage += 'CCV must not be empty\n';
      result = false;
    }
    if (result == false) {
      emit(state.copyWith(isLoading: false, errorMessage: errorMessage));
    }
    return result;
  }
}
