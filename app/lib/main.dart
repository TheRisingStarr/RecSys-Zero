import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';

void main() {
  runApp(Recsys());
}

class Recsys extends StatelessWidget {
  const Recsys({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double itemwidth = 180;
    double crossAxisCount = w / (itemwidth);
    return Scaffold(
      // /appBar: newMethod(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: MasonryGridView.count(
                itemCount: 50,
                mainAxisSpacing: 10,
                crossAxisCount: crossAxisCount.toInt(),
                itemBuilder: (context, index) {
                  int randomHeight = Random().nextInt(6);
                  return UnconstrainedBox(
                    child: Container(
                      width: itemwidth,
                      height: (randomHeight % 5 + 2) * 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://picsum.photos/100/${(randomHeight % 5 + 2) * 100}",
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
