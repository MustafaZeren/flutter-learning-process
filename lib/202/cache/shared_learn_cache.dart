import 'package:flutter/material.dart';
import 'package:flutter_learn_project/202/cache/shared_manager.dart';
import 'package:flutter_learn_project/202/cache/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({Key? key}) : super(key: key);

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    // final prefs = await SharedPreferences.getInstance();
    // final int? counter = prefs.getInt('counter');
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    setState(() {
      if (_value != null) {
        _currentValue = _value;
      } else {
        _currentValue = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(_currentValue.toString())),
          actions: [_loading(context)],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [_saveValueButton(), _removeValueButton()],
        ),
        body: Column(
          children: [
            TextField(
              onChanged: (value) {
                _onChangeValue(value);
              },
            ),
          ],
        ));
  }

  SingleChildRenderObjectWidget _loading(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          )
        : const SizedBox.shrink();
  }

  Padding _removeValueButton() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FloatingActionButton(
        child: const Icon(Icons.delete_outline),
        onPressed: () async {
          changeLoading();
          await _manager.removeItem(SharedKeys.counter);

          changeLoading();
        },
      ),
    );
  }

  Padding _saveValueButton() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FloatingActionButton(
        child: const Icon(Icons.save_outlined),
        onPressed: () async {
          changeLoading();
          await _manager.saveString(
              SharedKeys.counter, _currentValue.toString());
          changeLoading();
        },
      ),
    );
  }
}



class UserItems {
  late final List<User> users;
  UserItems() {
    users = [
      User('mz1', '23', 'mz37.dev'),
      User('mz2', '23', 'mz37.dev'),
      User('mz3', '23', 'mz37.dev'),
      User('mz4', '23', 'mz37.dev'),
      User('mz5', '23', 'mz37.dev')
    ];
  }
}

//Generic
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
