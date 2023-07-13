// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_datasource.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,
// no_leading_underscores_for_local_identifiers

class _NewsApiDatasource implements NewsApiDatasource {
  _NewsApiDatasource(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://newsapi.org';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<NewsUpdateResponse> getLatestNews(
    String? category,
    String? country,
    int? page,
    int? pageSize,
    String? query,
  ) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'category': category,
      r'country': country,
      r'page': page,
      r'pageSize': pageSize,
      r'q': query,
    }..removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<NewsUpdateResponse>(
        Options(
          method: 'GET',
          headers: headers,
          extra: extra,
        )
            .compose(
              _dio.options,
              '/v2/top-headlines',
              queryParameters: queryParameters,
            )
            .copyWith(
              baseUrl: _combineBaseUrls(
                _dio.options.baseUrl,
                baseUrl,
              ),
            ),
      ),
    );
    final value = NewsUpdateResponse.fromJson(result.data!);
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

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
