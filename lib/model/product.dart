import 'package:json_annotation/json_annotation.dart';
import 'package:stylish/product_detail/model/variant.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  final int id;
  final String category;
  @JsonKey(name: 'main_image')
  final String imageUrl;
  final String title;
  final int price;
  @JsonKey(name: 'texture')
  final String material;
  @JsonKey(defaultValue: "")
  final String thickness;
  @JsonKey(defaultValue: "")
  final String elasticity;
  @JsonKey(name: 'place')
  final String originOfMaterials;
  @JsonKey(defaultValue: "")
  final String processingOrigin;
  final String description;
  @JsonKey(name: 'images')
  final List<String> descriptionImagesUrl;
  final String wash;
  final String note;
  final String story;

  final List<ProductColor> colors;
  final List<String> sizes;
  final List<Variant> variants;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.material,
    required this.thickness,
    required this.elasticity,
    required this.originOfMaterials,
    required this.processingOrigin,
    required this.description,
    required this.colors,
    required this.sizes,
    required this.descriptionImagesUrl,
    required this.variants,
    required this.category,
    required this.note,
    required this.story,
    required this.wash,
  });
}

@JsonSerializable()
class ProductColor {
  final String name;

  @JsonKey(name: 'code')
  final String hex;

  factory ProductColor.fromJson(Map<String, dynamic> json) =>
      _$ProductColorFromJson(json);

  Map<String, dynamic> toJson() => _$ProductColorToJson(this);

  ProductColor({required this.name, required this.hex});
}

enum ProductSize { small, medium, large }

extension ProductSizeExtension on ProductSize {
  String get name {
    switch (this) {
      case ProductSize.small:
        return 'S';
      case ProductSize.medium:
        return 'M';
      case ProductSize.large:
        return 'L';
      default:
        return '';
    }
  }
}

extension ProductExtension on Product {

  int getStock(
    int? selectedColorIndex,
    int? selectedSizeIndex,
  ) {
    if (selectedColorIndex == null || selectedSizeIndex == null) {
      return 0;
    }
    final selectedColor = colors[selectedColorIndex];
    final selectedSize = sizes[selectedSizeIndex];
    return variants
        .firstWhere(
            (variant) =>
                (variant.size == selectedSize) &&
                (variant.colorCode == selectedColor.hex),
            orElse: () => Variant("000000", "s", 0))
        .stock;
  }
}
