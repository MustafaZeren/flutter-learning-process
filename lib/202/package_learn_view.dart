import 'package:flutter/material.dart';
import 'package:flutter_learn_project/202/package/launch_manager.dart';
import 'package:flutter_learn_project/202/package/loading_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageLearn extends StatefulWidget {
  const PackageLearn({Key? key}) : super(key: key);

  @override
  State<PackageLearn> createState() => _PackageLearnState();
}

class _PackageLearnState extends State<PackageLearn> with LaunchMixin {
  final Uri url = Uri.parse('https://flutter.dev');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
          backgroundColor:
              Theme.of(context).buttonTheme.colorScheme?.onPrimary,
          onPressed: () {
            launchUrl(url);
          }),
      body: Column(
        children: [
          Text('a', style: Theme.of(context).textTheme.subtitle1),
          const LoadingBar(),
        ],
      ),
    );
  }
}
