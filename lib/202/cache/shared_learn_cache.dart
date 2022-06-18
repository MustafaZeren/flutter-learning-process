import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({Key? key}) : super(key: key);

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;

  @override
  void initState() {
    super.initState();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    final prefs = await SharedPreferences.getInstance();
    final int? counter = prefs.getInt('counter');
    _onChangeValue(counter.toString());
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
          actions: [
            isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [_saveValueButton(), _removeValueButton()],
        ),
        body: TextField(
          onChanged: (value) {
            _onChangeValue(value);
          },
        ));
  }

  Padding _removeValueButton() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FloatingActionButton(
        child: const Icon(Icons.delete_outline),
        onPressed: () async {
          changeLoading();
          final prefs = await SharedPreferences.getInstance();
          await prefs.remove('counter');
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
          final prefs = await SharedPreferences.getInstance();
          await prefs.setInt('counter', _currentValue);
          changeLoading();
        },
      ),
    );
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
