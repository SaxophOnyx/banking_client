import 'package:json_annotation/json_annotation.dart';

enum Disability {
  @JsonValue('None')
  none,
  @JsonValue('FirstGroup')
  firstGroup,
  @JsonValue('SecondGroup')
  secondGroup,
  @JsonValue('ThirdGroup')
  thirdGroup,
}
