import 'package:dio/dio.dart';

import '../repository/post_repository.dart';

class DeletePostUsecase {
  WebRepo webRepo;
  DeletePostUsecase({
    required this.webRepo,
  });
  Future<Response> deleteData(int id) async {
    return await webRepo.deleteData(id);
  }
}
