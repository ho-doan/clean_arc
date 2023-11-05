part of 'model.dart';

@JsonSerializable(explicitToJson: true)
class UserPoint extends Equatable {
  const UserPoint({
    this.id,
    this.name,
    this.point,
  });
  factory UserPoint.fromJson(Map<String, dynamic> json) =>
      _$UserPointFromJson(json);
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'point')
  final String? point;
  Map<String, dynamic> toJson() => _$UserPointToJson(this);

  @override
  List<Object?> get props => [id, name, point];
}
