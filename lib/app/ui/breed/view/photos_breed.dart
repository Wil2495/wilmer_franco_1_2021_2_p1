import 'package:app_dogs/app/ui/breed/controller/conection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/controller_breed.dart';
import 'conection_view.dart';

class PhotosBreed extends StatelessWidget {
  final String name;
  const PhotosBreed({Key? key, required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BreedController>(context);
    final validarConexion = Provider.of<ConnectionController>(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
              child: Text(name.toUpperCase() +
                  "  " +
                  provider.getCountPhotos.toString()))),
      body: SafeArea(
        child: validarConexion.isOnline == false
            ? const SinConexion()
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10),
                itemCount: provider.getCountPhotos,
                itemBuilder: (BuildContext ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                provider.getListBreedPhotos[index]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  );
                }),
      ),
    );
  }
}
