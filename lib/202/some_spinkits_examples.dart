import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SomeSpinKitsExamples extends StatefulWidget {
  const SomeSpinKitsExamples({Key? key}) : super(key: key);

  @override
  State<SomeSpinKitsExamples> createState() => _SomeSpinKitsExamplesState();
}

class _SomeSpinKitsExamplesState extends State<SomeSpinKitsExamples>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: const [
              SpinKitPianoWave(
                color: Color.fromARGB(255, 233, 178, 12),
                size: 75.0,
                // controller: AnimationController(
                //     vsync: this, duration: const Duration(milliseconds: 1200)),
              ),
              SpinKitHourGlass(
                color: Color.fromARGB(255, 233, 178, 12),
                size: 75.0,
                // controller: AnimationController(
                //     vsync: this, duration: const Duration(milliseconds: 1200)),
              ),
              SpinKitFoldingCube(
                color: Color.fromARGB(255, 233, 178, 12),
                size: 75.0,
                // controller: AnimationController(
                //     vsync: this, duration: const Duration(milliseconds: 1200)),
              ),
              SpinKitFadingGrid(
                color: Color.fromARGB(255, 233, 178, 12),
                size: 75.0,
                // controller: AnimationController(
                //     vsync: this, duration: const Duration(milliseconds: 1200)),
              ),
            ],
          ),
          Row(
            children: const [
               Padding(
                padding: EdgeInsets.all(4.0),
                 child: SpinKitPouringHourGlass(
                  color: Color.fromARGB(255, 233, 178, 12),
                  size: 75.0,
                  // controller: AnimationController(
                  //     vsync: this, duration: const Duration(milliseconds: 1200)),
              ),
               ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: SpinKitFadingFour(
                  color: Color.fromARGB(255, 233, 178, 12),
                  size: 75.0,
                  // controller: AnimationController(
                  //     vsync: this, duration: const Duration(milliseconds: 1200)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: SpinKitFadingCube(
                  color: Color.fromARGB(255, 233, 178, 12),
                  size: 75.0,
                  // controller: AnimationController(
                  //     vsync: this, duration: const Duration(milliseconds: 1200)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: SpinKitFadingCircle(
                  color: Color.fromARGB(255, 233, 178, 12),
                  size: 75.0,
                  // controller: AnimationController(
                  //     vsync: this, duration: const Duration(milliseconds: 1200)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: SpinKitDualRing(
                  color: Color.fromARGB(255, 233, 178, 12),
                  size: 75.0,
                  // controller: AnimationController(
                  //     vsync: this, duration: const Duration(milliseconds: 1200)),
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(4.0),
                child: SpinKitDoubleBounce(
                  color: Color.fromARGB(255, 233, 178, 12),
                  size: 75.0,
                  // controller: AnimationController(
                  //     vsync: this, duration: const Duration(milliseconds: 1200)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: SpinKitCubeGrid(
                  color: Color.fromARGB(255, 233, 178, 12),
                  size: 75.0,
                  // controller: AnimationController(
                  //     vsync: this, duration: const Duration(milliseconds: 1200)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: SpinKitCircle(
                  color: Color.fromARGB(255, 233, 178, 12),
                  size: 75.0,
                  // controller: AnimationController(
                  //     vsync: this, duration: const Duration(milliseconds: 1200)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: SpinKitChasingDots(
                  color: Color.fromARGB(255, 233, 178, 12),
                  size: 75.0,
                  // controller: AnimationController(
                  //     vsync: this, duration: const Duration(milliseconds: 1200)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: SpinKitDancingSquare(
                  color: Color.fromARGB(255, 233, 178, 12),
                  size: 75.0,
                  // controller: AnimationController(
                  //     vsync: this, duration: const Duration(milliseconds: 1200)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
