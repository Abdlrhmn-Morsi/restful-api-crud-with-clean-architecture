import 'package:dio/dio.dart';
import '../../data/models/post_model.dart';

abstract class WebRepo {
  Future<List<Post>> readData();
  Future<Response> deleteData(int id);
  Future<Response> updateData({title, content, int? id});
  Future<Response> createData({title, content});
}
