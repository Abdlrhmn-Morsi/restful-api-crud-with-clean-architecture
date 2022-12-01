import 'package:dio/dio.dart';
import '../repository/post_repository.dart';

class AddPostUsecase {
  WebRepo webRepo;
  AddPostUsecase({
    required this.webRepo,
  });
  Future<Response> createData({title, content}) async {
    return await webRepo.createData(title: title, content: content);
  }
}
