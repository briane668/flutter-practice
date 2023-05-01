import 'package:equatable/equatable.dart';

import '../model/product.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    this.product,
    this.selectedColorIndex,
    this.selectedSizeIndex,
    this.quantity = 1,
  });

  final Product? product;
  final int quantity;
  final int? selectedColorIndex;
  final int? selectedSizeIndex;

  get currentStock =>
      product?.getStock(selectedColorIndex, selectedSizeIndex) ?? 0;

  get currentStockText =>
      (selectedColorIndex != null && selectedSizeIndex != null)
          ? '$currentStock'
          : '請選擇顏色尺寸';

  ProductDetailState copyWith({
    Product? product,
    int? quantity,
    int? colorIndex,
    int? sizeIndex,
  }) {
    return ProductDetailState(
      product: product ?? this.product,
      selectedColorIndex: colorIndex ?? selectedColorIndex,
      selectedSizeIndex: sizeIndex ?? selectedSizeIndex,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props =>
      [product, selectedColorIndex, selectedSizeIndex, quantity];
}
