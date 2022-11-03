import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'joke.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Joke {
  @HiveField(0)
  // ignore: non_constant_identifier_names
  String? icon_url;

  @HiveField(1)
  String? id;

  @HiveField(2)
  String? url;

  @HiveField(3)
  String? value;

  // ignore: non_constant_identifier_names
  Joke({this.icon_url, this.id, this.url, this.value});

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);
  Map<String, dynamic> toJson() => _$JokeToJson(this);

  static Joke testJoke() {
    return Joke(
        icon_url: "icon_url",
        id: "123",
        url: "url",
        value: "This is a test joke.");
  }
}
