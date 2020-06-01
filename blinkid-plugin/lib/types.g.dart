// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageExtensionFactors _$ImageExtensionFactorsFromJson(
    Map<String, dynamic> json) {
  return ImageExtensionFactors()
    ..upFactor = (json['upFactor'] as num)?.toDouble()
    ..rightFactor = (json['rightFactor'] as num)?.toDouble()
    ..downFactor = (json['downFactor'] as num)?.toDouble()
    ..leftFactor = (json['leftFactor'] as num)?.toDouble();
}

Map<String, dynamic> _$ImageExtensionFactorsToJson(
        ImageExtensionFactors instance) =>
    <String, dynamic>{
      'upFactor': instance.upFactor,
      'rightFactor': instance.rightFactor,
      'downFactor': instance.downFactor,
      'leftFactor': instance.leftFactor,
    };
