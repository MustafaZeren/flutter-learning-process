import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_project/202/service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({Key? key}) : super(key: key);

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  bool _isLoading = false;
  String? message;
  final String _url = "https://jsonplaceholder.typicode.com";
  late final Dio _networkManager;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _url));
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel model) async {
    _changeLoading();
    final response = await _networkManager.post('/posts', data: model);
    if (response.statusCode == HttpStatus.created) {
      message = 'created';
      print(message);
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    String title = "Service";
    return Scaffold(
      appBar: AppBar(
        title: Text(title.toUpperCase()),
        actions: [
          _isLoading
              ? Center(child: const CircularProgressIndicator.adaptive())
              : const SizedBox.shrink()
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(label: Text('title')),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: _bodyController,
            decoration: const InputDecoration(label: Text('body')),
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: _userIdController,
            keyboardType: TextInputType.phone,
            inputFormatters: [],
            autofillHints: const [AutofillHints.creditCardNumber],
            decoration: const InputDecoration(label: Text('userId')),
          ),
          TextButton(
              onPressed: _isLoading
                  ? null
                  : () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIdController.text.isNotEmpty) {
                        final model = PostModel(
                            body: _bodyController.text,
                            title: _titleController.text,
                            userId: int.tryParse(_userIdController.text));
                        _addItemToService(model);
                      }
                    },
              child: const Text('Send'))
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
