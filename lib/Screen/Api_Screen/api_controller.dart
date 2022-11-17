import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiIntegration {
  GetApi() async {
    String url = "https://makeup-api.herokuapp.com/api/v1/products.json";

    final all_data = Uri.parse(url);
    final response = await http.get(all_data);
    final bodys = response.body;

    print('my api ststus ${response.statusCode}');
    print('my api data $bodys');
    return json.decode(bodys);
  }

  NewsApi() async {
    String url =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=9fd4b36bdef34b9c874e322ec6c032c8";
    final all_data = Uri.parse(url);
    final response = await http.get(all_data);
    final body = response.body;
    print("my api status ${response.statusCode}");
    print("my api data $body");
    return json.decode(body);
  }
}
