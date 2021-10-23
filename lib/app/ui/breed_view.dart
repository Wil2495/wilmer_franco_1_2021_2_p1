import 'package:app_dogs/app/data/get_breeds_data.dart';
import 'package:app_dogs/app/domain/model/Breed.dart';
import 'package:flutter/material.dart';

class BreedView extends StatefulWidget {
  const BreedView({Key? key}) : super(key: key);

  @override
  _BreedViewState createState() => _BreedViewState();
}

class _BreedViewState extends State<BreedView> {
  List<Breed> _breed = [];
  @override
  void initState() {
    getBreeds();
    super.initState();
  }

  getBreeds() async {
    _breed = await getBreedsDogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: const [
          Center(child: Text("breed")),
        ],
      ),
    ));
  }
}
