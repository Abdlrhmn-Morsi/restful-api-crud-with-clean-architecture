import 'package:dio/dio.dart';

import '../repository/post_repository.dart';

class UpdatePostUsecase {
  WebRepo webRepo;
  UpdatePostUsecase({
    required this.webRepo,
  });
  Future<Response> updateData({title, content, int? id}) async {
    return await webRepo.updateData(id: id, title: title, content: content);
  }
}
