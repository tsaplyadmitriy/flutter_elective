import 'package:elective/models/joke.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'joke_network.g.dart';

@RestApi(baseUrl: "https://api.chucknorris.io/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("jokes/random")
  Future<Joke> getNextJoke();
}
