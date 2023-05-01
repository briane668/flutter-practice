// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variant _$VariantFromJson(Map<String, dynamic> json) => Variant(
      json['color_code'] as String,
      json['size'] as String,
      json['stock'] as int,
    );

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      'color_code': instance.colorCode,
      'size': instance.size,
      'stock': instance.stock,
    };
