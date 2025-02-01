```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Incorrectly assuming the response body is always a JSON object
      final data = jsonDecode(response.body) as Map<String, dynamic>; 
      print(data['key']); // potential error if 'key' is missing
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e'); // Catches both JSON decoding and HTTP errors
  }
}
```