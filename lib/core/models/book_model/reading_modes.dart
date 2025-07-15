import 'package:equatable/equatable.dart';

class ReadingModes extends Equatable {
  final bool? text;
  final bool? image;

  const ReadingModes({this.text, this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) =>
      ReadingModes(text: json['text'] as bool?, image: json['image'] as bool?);

  Map<String, dynamic> toJson() => {'text': text, 'image': image};

  ReadingModes copyWith({bool? text, bool? image}) {
    return ReadingModes(text: text ?? this.text, image: image ?? this.image);
  }

  @override
  List<Object?> get props => [text, image];
}
