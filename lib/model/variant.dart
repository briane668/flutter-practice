import 'package:json_annotation/json_annotation.dart';

part 'variant.g.dart';

@JsonSerializable()
class Variant {
  @JsonKey(name: 'color_code')
  final String colorCode;
  final String size;
  final int stock;

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);

  Variant(this.colorCode, this.size, this.stock);
}
