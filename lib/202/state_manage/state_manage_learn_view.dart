import 'package:flutter/material.dart';
import 'package:flutter_learn_project/202/state_manage/state_learn_view_model.dart';

class StateManageLearnView extends StatefulWidget {
  const StateManageLearnView({Key? key}) : super(key: key);

  @override
  State<StateManageLearnView> createState() => _StateManageLearnViewState();
}

class _StateManageLearnViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        changeVisible();
        changeOpacity();
      }),
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.red : Colors.amber,
        shadowColor: isVisible ? Colors.blue : Colors.white,
        elevation: 48,
      ),
    );
  }
} 
