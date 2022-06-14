import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatefulWidget {
  const LoadingBar({Key? key, this.size}) : super(key: key);
  final double? size;
  final double _defaultSizeValue = 50.0;

  @override
  State<LoadingBar> createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> {
  @override
  Widget build(BuildContext context) {
    return SpinKitPouringHourGlass(
      color: Colors.amber,
      size: widget.size ?? widget._defaultSizeValue,
    );
  }
}
