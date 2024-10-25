import 'package:json_annotation/json_annotation.dart';

part 'import_resource.g.dart';

@JsonSerializable(createFactory: false)
class ImportResource {
  int tablet;
  int projeto;
  bool forcedSync;

  // Constructor
  ImportResource(this.tablet, this.projeto, this.forcedSync);

  // JSON
  Map<String, dynamic> toJson() => _$ImportResourceToJson(this);
}
