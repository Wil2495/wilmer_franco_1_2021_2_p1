import 'dart:collection';
import 'package:app_dogs/app/data/get_breeds_data.dart';
import 'package:app_dogs/app/domain/model/Breed.dart';
import 'package:flutter/cupertino.dart';

class BreedController with ChangeNotifier {
  BreedController() {
    getAllBreeds();
  }
  //************** variables ********************//
  int _countBreed = 0;
  List<Breed> _listBreed = [];
  String _searchString = "";
//************** Getters ********************//
  get getCountInstitution => _countBreed;
  get getListInstitutions => _listBreed;
  UnmodifiableListView<Breed> get listBreed => _searchString.isEmpty
      ? UnmodifiableListView(_listBreed)
      : UnmodifiableListView(_listBreed
          .where((u) =>
              (u.name.toLowerCase().contains(_searchString.toLowerCase())))
          .toList());
//************** Method Get ********************//
  getAllBreeds() async {
    _listBreed = await getBreedsDogs();
    _countBreed = _listBreed.length;
    notifyListeners();

    String palabra = ".jpg";

    palabra.indexOf("jpg");
  }

  changeSearch(String value) {
    _searchString = value;
    notifyListeners();
  }

//-------------------Dispose------------------//

  @override
  void dispose() {
    _countBreed;
    _listBreed = [];
    super.dispose();
  }
  //-------------------Dispose------------------//

}
