import 'package:flutter/material.dart';

class SinConexion extends StatelessWidget {
  const SinConexion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sin conexión a internet",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: const CircleAvatar(
              maxRadius: 180,
              backgroundImage: AssetImage("assets/offline.gif"),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
