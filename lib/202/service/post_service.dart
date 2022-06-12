import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_learn_project/202/service/comment_model.dart';
import 'package:flutter_learn_project/202/service/post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel model);
  Future<bool> putItemToService(PostModel model, int id);
  Future<bool> deleteItemToService(PostModel model, int id);
  Future<List<PostModel>?> fetchPostItemsAdvanced();
  Future<List<PostCommentModel>?> fetchRelatedCommentsWithPostId(int postId);
}

class PostService implements IPostService {
  final Dio _networkManager;
  PostService()
      : _networkManager =
            Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<bool> addItemToService(PostModel model) async {
    try {
      final response =
          await _networkManager.post(_PostServicePaths.posts.name, data: model);
      return response.statusCode == HttpStatus.created;
    } on DioError catch (e) {
      _ShowDebug.showDioError(e, this);
    }
    return false;
  }

  @override
  Future<bool> putItemToService(PostModel model, int id) async {
    try {
      final response = await _networkManager
          .put('${_PostServicePaths.posts.name}/$id', data: model);
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (e) {
      _ShowDebug.showDioError(e, this);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(PostModel model, int id) async {
    try {
      final response =
          await _networkManager.delete('${_PostServicePaths.posts.name}/$id');
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (e) {
      _ShowDebug.showDioError(e, this);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvanced() async {
    try {
      final response = await _networkManager.get(_PostServicePaths.posts.name);

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (e) {
      _ShowDebug.showDioError(e, this);
    }
    return null;
  }

  @override
  Future<List<PostCommentModel>?> fetchRelatedCommentsWithPostId(
      int postId) async {
    try {
      final response = await _networkManager.get(
          _PostServicePaths.comments.name,
          queryParameters: {_PostQueryPaths.postId.name: postId});

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => PostCommentModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (e) {
      _ShowDebug.showDioError(e, this);
    }
    return null;
  }
}

enum _PostServicePaths { posts, comments }
enum _PostQueryPaths { postId }

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('----');
    }
  }
}
