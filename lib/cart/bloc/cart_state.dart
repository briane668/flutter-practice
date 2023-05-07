import 'package:equatable/equatable.dart';

import '../model/CartItem.dart';

class CartState extends Equatable {
  CartState({
    this.items = const [],
    this.cardNumber = '',
    this.dueMonthAndYear = '',
    this.ccv = '',
    this.isLoading = false,
    this.errorMessage,
    this.prime,
  });

  final List<CartItem> items;
  final String cardNumber;
  final String dueMonthAndYear;
  final String ccv;
  bool isLoading;
  String? errorMessage;
  String? prime;

  CartState copyWith({
    List<CartItem>? items,
    String? cardNumber,
    String? dueMonthAndYear,
    String? ccv,
    bool? isLoading,
    String? errorMessage,
    String? prime,
  }) {
    return CartState(
      items: items ?? this.items,
      cardNumber: cardNumber ?? this.cardNumber,
      dueMonthAndYear: dueMonthAndYear ?? this.dueMonthAndYear,
      ccv: ccv ?? this.ccv,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      prime: prime ?? this.prime,
    );
  }

  @override
  List<Object?> get props =>
      [items, cardNumber, dueMonthAndYear, ccv, isLoading, errorMessage, prime];
}
