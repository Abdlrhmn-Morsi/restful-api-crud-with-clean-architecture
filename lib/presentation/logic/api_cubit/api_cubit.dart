import 'package:api_with_solid/domain/usecases/read_posts.dart';
import 'package:bloc/bloc.dart';
import '../../../data/models/post_model.dart';
part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  ReadPostsUsecase readPostsUsecase;
  ApiCubit({
    required this.readPostsUsecase,
  }) : super(ApiInitial());

  readData() async {
    await readPostsUsecase.readData().then((post) {
      emit(ReadDataState(posts: post));
    });
  }
}
