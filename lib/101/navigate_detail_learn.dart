import 'package:flutter/material.dart';

class NavigateDetailLearn extends StatefulWidget {
  const NavigateDetailLearn({Key? key, this.isOkay=false}) : super(key: key);

  final bool isOkay;
  @override
  State<NavigateDetailLearn> createState() => _NavigateDetailLearnState();
}

class _NavigateDetailLearnState extends State<NavigateDetailLearn> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ModalRoute.of(context).settings.arguments
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop(!widget.isOkay);
                },
                icon: widget.isOkay? Icon(Icons.block_outlined, color: Colors.red,):Icon(Icons.check_outlined,color: Colors.green,),
                label:widget.isOkay? Text("Red"):Text("Onay"))));
  }
}
