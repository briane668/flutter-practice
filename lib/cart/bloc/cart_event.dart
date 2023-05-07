import 'package:equatable/equatable.dart';

import 'cart_info_input.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class TextInputUpdated extends CartEvent {
  const TextInputUpdated(this.inputType, this.text);

  final CartInfoInput inputType;
  final String text;

  @override
  List<Object> get props => [inputType, text];
}

class StartCheckoutEvent extends CartEvent {
  const StartCheckoutEvent();

  @override
  List<Object> get props => [];
}
