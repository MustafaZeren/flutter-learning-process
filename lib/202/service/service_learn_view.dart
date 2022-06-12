import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_project/202/service/comments_learn_view.dart';
import 'package:flutter_learn_project/202/service/post_model.dart';
import 'package:flutter_learn_project/202/service/post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({Key? key}) : super(key: key);

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  bool _isLoading = false;
  List<PostModel>? _items;
  final String _url = "https://jsonplaceholder.typicode.com";
  late final Dio _networkManager;

  //IT IS SO USEFUL FOR TESTING
  late final IPostService _postService;

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _url));
    _postService = PostService();
    fetchPostItemsAdvanced();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();

    var dio = Dio();
    final response = await dio.get('$_url/posts');

    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;
      if (_datas is List) {
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }

  Future<void> fetchPostItemsAdvanced() async {
    _changeLoading();
    _items = await _postService.fetchPostItemsAdvanced();
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
              ? const Center(child: CircularProgressIndicator.adaptive())
              : const SizedBox.shrink()
        ],
      ),
      body: _items == null
          ? Placeholder()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: _items?.length ?? 0,
              itemBuilder: ((context, index) {
                return _PostCard(
                  model: _items?[index],
                );
              })),
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
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CommentsLearnView(
                    postId: _model?.id,
                  )));
        },
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
