import 'package:namer_app/bloc/product_detail_event.dart';
import 'package:namer_app/bloc/product_detail_state.dart';
import 'package:bloc/bloc.dart';

import '../data/product_detail_repository.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(const ProductDetailState()) {
    on<ColorChanged>(_onColorChanged);
    on<SizeChanged>(_onSizeChanged);
    on<QuantityChanged>(_onQuantityChanged);
    on<ProductFetched>(_onProductFetched);
  }

  final _repository = ProductDetailRepository();

  void _onColorChanged(
    ColorChanged event,
    Emitter<ProductDetailState> emit,
  ) {
    // reset quantity
    emit(state.copyWith(colorIndex: event.colorIndex, quantity: 1));
  }

  void _onSizeChanged(
    SizeChanged event,
    Emitter<ProductDetailState> emit,
  ) {
    // reset quantity
    emit(state.copyWith(sizeIndex: event.sizeIndex, quantity: 1));
  }

  void _onQuantityChanged(
    QuantityChanged event,
    Emitter<ProductDetailState> emit,
  ) {
    final newQuantity = state.quantity + event.quantity;

    emit(state.copyWith(quantity: newQuantity));
  }

  Future<void> _onProductFetched(
    ProductFetched event,
    Emitter<ProductDetailState> emit,
  ) async {
    final product = await _repository.getProduct(event.productId);
    emit(state.copyWith(product: product));
  }
}
