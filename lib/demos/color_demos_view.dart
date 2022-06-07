import 'dart:developer';

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({Key? key, required this.initialColor}) : super(key: key);
  final Color? initialColor;

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor;
  Icon? _icon;

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);

    //inspect(widget);

    if (oldWidget.initialColor != _backgroundColor &&
        widget.initialColor != null) {
      changeBackgroundColor(widget.initialColor!);
      changeIcon(null);
    }
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  void changeIcon(Icon? icon) {
    setState(() {
      _icon = icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: Text(
      //   _appBarTitle,
      //   style: Theme.of(context)
      //       .textTheme
      //       .headline6
      //       ?.copyWith(color: _backgroundColor),
      // )),
      body: Container(
        color: _backgroundColor,
        child: Center(child: _icon),
      ),
      bottomNavigationBar:
          BottomNavigationBar(onTap: _colorOnTap, items: const [
        BottomNavigationBarItem(
            icon: _ColorContainer(
              color: Colors.redAccent,
              width: 10,
              height: 10,
            ),
            label: "Red"),
        BottomNavigationBarItem(
            icon: _ColorContainer(
              color: Colors.amber,
              width: 10,
              height: 10,
            ),
            label: "Yellow"),
        BottomNavigationBarItem(
            icon: _ColorContainer(
              color: Colors.blueAccent,
              width: 10,
              height: 10,
            ),
            label: "Blue"),
      ]),
    );
  }

  void _colorOnTap(value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(Colors.redAccent);
      changeIcon(const Icon(Icons.phone_android_outlined));
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(Colors.amber);
      changeIcon(const Icon(Icons.computer_outlined));
    } else if (value == _MyColors.blue.index) {
      changeBackgroundColor(Colors.blueAccent);
      changeIcon(const Icon(Icons.tablet_mac_outlined));
    }
  }
}

enum _MyColors { red, yellow, blue }

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    Key? key,
    required this.color,
    required this.width,
    required this.height,
  }) : super(key: key);

  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(width: 10, height: 10, color: color);
  }
}
