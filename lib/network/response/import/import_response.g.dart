// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImportResponse _$ImportResponseFromJson(Map<String, dynamic> json) =>
    ImportResponse(
      (json['assets'] as List<dynamic>)
          .map((e) => AssetResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['locations'] as List<dynamic>)
          .map((e) => LocationsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
