// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      imageUrl: json['main_image'] as String,
      title: json['title'] as String,
      price: json['price'] as int,
      material: json['texture'] as String,
      thickness: json['thickness'] as String? ?? '',
      elasticity: json['elasticity'] as String? ?? '',
      originOfMaterials: json['place'] as String,
      processingOrigin: json['processingOrigin'] as String? ?? '',
      description: json['description'] as String,
      colors: (json['colors'] as List<dynamic>)
          .map((e) => ProductColor.fromJson(e as Map<String, dynamic>))
          .toList(),
      sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
      descriptionImagesUrl:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      variants: (json['variants'] as List<dynamic>)
          .map((e) => Variant.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: json['category'] as String,
      note: json['note'] as String,
      story: json['story'] as String,
      wash: json['wash'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'main_image': instance.imageUrl,
      'title': instance.title,
      'price': instance.price,
      'texture': instance.material,
      'thickness': instance.thickness,
      'elasticity': instance.elasticity,
      'place': instance.originOfMaterials,
      'processingOrigin': instance.processingOrigin,
      'description': instance.description,
      'images': instance.descriptionImagesUrl,
      'wash': instance.wash,
      'note': instance.note,
      'story': instance.story,
      'colors': instance.colors.map((e) => e.toJson()).toList(),
      'sizes': instance.sizes,
      'variants': instance.variants.map((e) => e.toJson()).toList(),
    };

ProductColor _$ProductColorFromJson(Map<String, dynamic> json) => ProductColor(
      name: json['name'] as String,
      hex: json['code'] as String,
    );

Map<String, dynamic> _$ProductColorToJson(ProductColor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.hex,
    };
