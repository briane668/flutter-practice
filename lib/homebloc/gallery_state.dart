import 'package:equatable/equatable.dart';
import 'package:namer_app/model/category.dart';

class GalleryState extends Equatable {
  const GalleryState({
    this.categories = const [],
  });

  final List<Category> categories;

  GalleryState copyWith({
    List<Category>? categories,
  }) {
    return GalleryState(
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [categories];
}
