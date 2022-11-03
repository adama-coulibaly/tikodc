import 'package:flutter/material.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 4,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              margin: EdgeInsets.all(5),
                          height: 100.0,
                          width: 100.0,
                          decoration: const BoxDecoration(
                              //Ici on midifie les dimensions: Hauteurs et largeur
                              image: DecorationImage(
                                image: AssetImage("assets/images/adama.jpg"),
                              ))
            ),
          );
        });
  }
}
