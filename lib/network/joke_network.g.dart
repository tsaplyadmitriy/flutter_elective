// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Joke _$JokeFromJson(Map<String, dynamic> json) => Joke(
      icon_url: json['icon_url'] as String?,
      id: json['id'] as String?,
      url: json['url'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$JokeToJson(Joke instance) => <String, dynamic>{
      'icon_url': instance.icon_url,
      'id': instance.id,
      'url': instance.url,
      'value': instance.value,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.chucknorris.io/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Joke> getNextJoke() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Joke>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'jokes/random',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Joke.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
