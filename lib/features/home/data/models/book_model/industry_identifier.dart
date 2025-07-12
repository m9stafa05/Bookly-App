import 'package:equatable/equatable.dart';

class IndustryIdentifier extends Equatable {
  final String? type;
  final String? identifier;

  const IndustryIdentifier({this.type, this.identifier});

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) {
    return IndustryIdentifier(
      type: json['type'] as String?,
      identifier: json['identifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'type': type, 'identifier': identifier};

  IndustryIdentifier copyWith({String? type, String? identifier}) {
    return IndustryIdentifier(
      type: type ?? this.type,
      identifier: identifier ?? this.identifier,
    );
  }

  @override
  List<Object?> get props => [type, identifier];
}
