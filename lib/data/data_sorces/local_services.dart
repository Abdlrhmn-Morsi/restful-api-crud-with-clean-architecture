import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../const/strings/strings.dart';
import '../models/post_model.dart';

abstract class LocalServices {
  Future<List<Post>> getCachedPosts();
  void cachePosts(List<Post> postModels);
}

class LocalServicesImp implements LocalServices {
  final SharedPreferences sharedPreferences;
  LocalServicesImp({required this.sharedPreferences});

  @override
  cachePosts(List<Post> postModels) {
    List postModelsToJson = postModels
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_POSTS, json.encode(postModelsToJson));
  }

  @override
  Future<List<Post>> getCachedPosts() {
    final jsonString = sharedPreferences.getString(CACHED_POSTS);
    List decodeJsonData = json.decode(jsonString!);
    List<Post> jsonToPostModels = decodeJsonData
        .map<Post>((jsonPostModel) => Post.fromJson(jsonPostModel))
        .toList();
    return Future.value(jsonToPostModels);
  }
}
