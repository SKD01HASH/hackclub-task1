// pubspec.yaml
//dependencies:
//http: ^0.12.1
//convert: ^4.0.0

// the 5.dart file
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  var response = await http.get('https://jsonplaceholder.typicode.com/posts');

  if (response.statusCode == 200) {
    var posts = json.decode(response.body);

    print(posts);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}
