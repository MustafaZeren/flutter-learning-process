import 'package:flutter/material.dart';
import 'package:flutter_learn_project/101/card_learn.dart';
import 'package:flutter_learn_project/101/color_learn.dart';
import 'package:flutter_learn_project/101/icon_learn.dart';
import 'package:flutter_learn_project/101/list_view_learn.dart';
import 'package:flutter_learn_project/101/scaffold_learn.dart';

class TabLearnView extends StatefulWidget {
  const TabLearnView({Key? key}) : super(key: key);

  @override
  State<TabLearnView> createState() => _TabLearnViewState();
}

class _TabLearnViewState extends State<TabLearnView>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(onPressed: () {
          _tabController.animateTo(_MyTabViews.home.index);
        }),
        bottomNavigationBar:
            BottomAppBar(notchMargin: _notchedValue, child: _myTabView()),
        appBar: AppBar(),
        body: _tabBarView(),
      ),
      length: _MyTabViews.values.length,
    );
  }

  TabBar _myTabView() {
    return TabBar(
      indicatorColor: Colors.white,
      //isScrollable: true,
      labelColor: Colors.white,
      //unselectedLabelColor: Colors.green,
      padding: EdgeInsets.zero,
      onTap: (int index) {},
      controller: _tabController,
      tabs: _MyTabViews.values
          .map((e) => Tab(
                text: '${e.name}',
              ))
          .toList(),
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          IconLearnView(),
          ColorLearn(),
          ScaffoldLearnView(),
          ListViewLearn()
        ]);
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {}
