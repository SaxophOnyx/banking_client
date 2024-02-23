import 'package:json_annotation/json_annotation.dart';

enum FamilyStatus {
  @JsonValue('Single')
  single,
  @JsonValue('Married')
  married,
}
