import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../domain/model/Breed.dart';

Future<List<Breed>> getBreedsDogs() async {
  Uri url = Uri.http('dog.ceo', "/api/breeds/list/all");
  List<Breed> _breed = [];
  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map jsonData = convert.jsonDecode(response.body);
      var data = jsonData["message"];
      for (var item in data.keys) {
        if (item != "") {
          _breed.add(Breed(
            name: item,
          ));
        }
      }
    }
  } on Exception {
    print("erro en el http");
  }

  return _breed;
}
