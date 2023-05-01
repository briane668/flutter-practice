import 'package:equatable/equatable.dart';

import '../model/product.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

class SizeChanged extends ProductDetailEvent {
  const SizeChanged(this.sizeIndex);

  final int sizeIndex;

  @override
  List<Object> get props => [sizeIndex];
}

class QuantityChanged extends ProductDetailEvent {
  const QuantityChanged(this.quantity);

  final int quantity;

  @override
  List<Object> get props => [quantity];
}

class ColorChanged extends ProductDetailEvent {
  const ColorChanged(this.colorIndex);

  final int colorIndex;

  @override
  List<Object> get props => [colorIndex];
}

class ProductFetched extends ProductDetailEvent {
  const ProductFetched(this.productId);

  final int productId;

  @override
  List<Object> get props => [productId];
}
