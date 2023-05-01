import 'package:equatable/equatable.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object> get props => [];
}

class CategoriesFetched extends GalleryEvent {
  const CategoriesFetched();

  @override
  List<Object> get props => [];
}

