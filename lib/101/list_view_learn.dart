import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({Key? key}) : super(key: key);

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("ListView")),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            FittedBox(
                child: Text(
              "Merhaba",
              style: Theme.of(context).textTheme.headline1,
              maxLines: 1,
            )),
            Container(
              color: Colors.amber,
              height: 300,
            ),
            const Divider(),
            SizedBox(
              height: 300,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Container(
                  color: Colors.purpleAccent,
                  width: 300,
                ),
                Container(
                  color: Colors.cyanAccent,
                  width: 300,
                ),
                Container(
                  color: Colors.orangeAccent,
                  width: 300,
                ),
                Container(
                  color: Colors.amberAccent,
                  width: 300,
                ),
              ]),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
            //sdasdasdaddasasdd
            FittedBox(
                child: Text(
              "Merhaba",
              style: Theme.of(context).textTheme.headline1,
              maxLines: 1,
            )),
            Container(
              color: Colors.amber,
              height: 300,
            ),
            const Divider(),
            SizedBox(
              height: 300,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Container(
                  color: Colors.purpleAccent,
                  width: 300,
                ),
                Container(
                  color: Colors.cyanAccent,
                  width: 300,
                ),
                Container(
                  color: Colors.orangeAccent,
                  width: 300,
                ),
                Container(
                  color: Colors.amberAccent,
                  width: 300,
                ),
              ]),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.close)),

            _ListDemo()
          ],
        ));
  }
}

class _ListDemo extends StatefulWidget {
  const _ListDemo({Key? key}) : super(key: key);

  @override
  State<_ListDemo> createState() => __ListDemoState();
}

class __ListDemoState extends State<_ListDemo> {
  @override
  void initState() {
    super.initState();
    print("here");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("exit");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
