import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'joke_network.g.dart';

@RestApi(baseUrl: "https://api.chucknorris.io/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("jokes/random")
  Future<Joke> getNextJoke();
}

@JsonSerializable()
class Joke {
  String? icon_url;
  String? id;
  String? url;
  String? value;

  Joke({this.icon_url, this.id, this.url, this.value});

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);
  Map<String, dynamic> toJson() => _$JokeToJson(this);
}
