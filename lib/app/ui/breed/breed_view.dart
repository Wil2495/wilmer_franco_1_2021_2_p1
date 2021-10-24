import 'package:app_dogs/app/domain/model/Breed.dart';
import 'package:app_dogs/app/ui/breed/controller_breed.dart';
import 'package:app_dogs/app/ui/breed/photos_breed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/my_card.dart';

class BreedView extends StatelessWidget {
  BreedView({Key? key}) : super(key: key);
  List<String> photos = [];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BreedController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: provider.listBreed.isNotEmpty
            ? Center(child: Text("${provider.listBreed.length} Razas"))
            : const Center(child: Text("Sin datos")),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: TextField(
                onChanged: (value) =>
                    Provider.of<BreedController>(context, listen: false)
                        .changeSearch(value),
                decoration: const InputDecoration(
                    fillColor: Colors.orange,
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Busqueda...",
                    hintText: "Busqueda...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
            ),
            const SizedBox(height: 20.0),
            _listInstitution(),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  _listInstitution() {
    return Consumer<BreedController>(builder: (context, breedData, child) {
      return Expanded(
        child: breedData.listBreed.isNotEmpty
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: breedData.listBreed.length,
                itemBuilder: (BuildContext context, int index) {
                  Breed breed = breedData.listBreed[index];
                  return InkWell(
                    child: MyCard(
                        child: Center(
                            child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.pets, color: Colors.purple, size: 50),
                        const SizedBox(height: 10.0),
                        Text(breed.name.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                      ],
                    ))),
                    onTap: () async {
                      breedData.getAllBreedPhotos(breed.name);
                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return PhotosBreed(name: breed.name);
                      }));
                    },
                  );
                },
              )
            : const Center(
                child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(color: Colors.orange))),
      );
    });
  }
}
