import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:api_with_solid/const/network/network_info.dart';
import 'package:api_with_solid/data/data_sorces/local_services.dart';
import 'package:api_with_solid/data/data_sorces/web_services.dart';
import 'package:api_with_solid/data/models/post_model.dart';
import '../../domain/repository/post_repository.dart';

class WebRepoImp implements WebRepo {
  final NetworkInfo networkInfo;
  final LocalServices localServices;
  final WebServices webServices;
  WebRepoImp({
    required this.networkInfo,
    required this.localServices,
    required this.webServices,
  });
  @override
  Future<List<Post>> readData() async {
    if (await networkInfo.isConnected) {
      Response response = await webServices.readData();
      List<Post> posts = [];
      for (var post in response.data) {
        posts.add(Post.fromJson(post));
      }
      localServices.cachePosts(posts);
      debugPrint('post : ${response.data}');
      debugPrint('post ${response.statusMessage}');
      return posts;
    } else {
      final localeData = await localServices.getCachedPosts();
      return localeData;
    }
  }

  @override
  Future<Response> deleteData(int id) async {
    Response response = await webServices.deleteData(id);
    debugPrint('post : ${response.data}');
    debugPrint('post : ${response.statusMessage}');
    return response;
  }

  @override
  Future<Response> updateData({title, content, int? id}) async {
    Post post = Post(
      title: title,
      body: content,
    );
    Response response =
        await webServices.updateData(data: json.encode(post.toJson()), id: id);
    debugPrint('post : ${response.data}');
    debugPrint('post : ${response.statusMessage}');
    return response;
  }

  @override
  Future<Response> createData({title, content}) async {
    Post post = Post(
      title: title,
      body: content,
    );
    Response response =
        await webServices.createData(data: json.encode(post.toJson()));
    debugPrint('post : ${response.data}');
    debugPrint('post : ${response.statusMessage}');
    return response;
  }
}
