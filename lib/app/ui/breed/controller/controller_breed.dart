import 'dart:collection';
import 'package:app_dogs/app/data/get_breeds_data.dart';
import 'package:app_dogs/app/domain/model/Breed.dart';
import 'package:flutter/cupertino.dart';

class BreedController with ChangeNotifier {
  BreedController() {
    getAllBreeds();
  }
  //************** variables ********************//
  List<Breed> _listBreed = [];
  List<String> _listBreedPhotos = [];
  int _countListBreedPhotos = 0;
  String _searchString = "";
//************** Getters ********************//
  get getCountPhotos => _countListBreedPhotos;
  get getListBreedPhotos => _listBreedPhotos;
  UnmodifiableListView<Breed> get listBreed => _searchString.isEmpty
      ? UnmodifiableListView(_listBreed)
      : UnmodifiableListView(_listBreed
          .where((u) =>
              (u.name.toLowerCase().contains(_searchString.toLowerCase())))
          .toList());
//************** Method Get ********************//
  getAllBreeds() async {
    _listBreed = await getBreedsDogs();
    notifyListeners();
  }

  getAllBreedPhotos(String breed) async {
    _listBreedPhotos = await getBreedPhotos(breed);
    _countListBreedPhotos = _listBreedPhotos.length;
    notifyListeners();
  }

  changeSearch(String value) {
    _searchString = value;
    notifyListeners();
  }

//-------------------Dispose------------------//

  @override
  void dispose() {
    _listBreed = [];
    _listBreedPhotos = [];
    super.dispose();
  }
  //-------------------Dispose------------------//

}
