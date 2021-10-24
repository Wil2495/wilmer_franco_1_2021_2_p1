import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../domain/model/Breed.dart';

Future<List<Breed>> getBreedsDogs() async {
  Uri url = Uri.http('dog.ceo', "/api/breeds/list/all");
  List<Breed> _breed = [];
  try {
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );
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
  } catch (e) {
    print("sin internet");
    print(e);
  }
  return _breed;
}

Future<List<String>> getBreedPhotos(String breed) async {
  Uri url = Uri.http('dog.ceo', "/api/breed/$breed/images");
  List<String> _breedPhotos = [];
  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map jsonData = convert.jsonDecode(response.body);
      var data = jsonData["message"];
      for (var item in data) {
        if (item != "") {
          _breedPhotos.add(item);
        }
      }
    }
  } on Exception {
    print("error en el servidor");
  }

  return _breedPhotos;
}
