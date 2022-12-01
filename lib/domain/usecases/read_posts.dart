import '../../data/models/post_model.dart';
import '../repository/post_repository.dart';

class ReadPostsUsecase {
  final WebRepo webRepo;
  ReadPostsUsecase({required this.webRepo});
  Future<List<Post>> readData() async {
    return await webRepo.readData();
  }
}


