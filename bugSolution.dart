```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body);
        if (data is Map && data.containsKey('key')) {
          print(data['key']);
        } else {
          print('Invalid JSON format or missing key.');
        }
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    } else {
      print('HTTP error: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```