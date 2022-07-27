abstract class BaseApiService {
  final String baseUrl = "https://api.github.com/";

  Future<dynamic> getResponse(String url);
}
