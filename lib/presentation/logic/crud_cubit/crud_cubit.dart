import 'package:api_with_solid/domain/usecases/create_post.dart';
import 'package:api_with_solid/presentation/screens/home_view.dart';
import 'package:equatable/equatable.dart';
import 'package:api_with_solid/domain/usecases/delete_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../const/network/network_info.dart';
import '../../../domain/usecases/update_post.dart';
part 'crud_state.dart';

class CrudCubit extends Cubit<CrudState> {
  NetworkInfo networkInfo;
  DeletePostUsecase deletePostUsecase;
  UpdatePostUsecase updatePostUsecase;
  AddPostUsecase addPostUsecase;
  CrudCubit({
    required this.networkInfo,
    required this.addPostUsecase,
    required this.updatePostUsecase,
    required this.deletePostUsecase,
  }) : super(CrudInitial());

  static CrudCubit get(context) => BlocProvider.of(context);
  void createPost({title, content, BuildContext? context}) async {
    if (await networkInfo.isConnected) {
      showCircularProgressIndicator(context: context);
      await addPostUsecase.createData(title: title, content: content);
      goHome(title: 'Post Created', color: Colors.green, context: context);
      emit(CreatePostState());
    } else {
      showSnackBarMessage(
          color: Colors.red,
          title: 'please check internet conection',
          context: context);
      emit(NoInternetConnectionState());
    }
  }

  void updatePost({title, content, int? id, BuildContext? context}) async {
    if (await networkInfo.isConnected) {
      showCircularProgressIndicator(context: context);
      await updatePostUsecase.updateData(
          id: id, title: title, content: content);
      goHome(title: 'Post Updated', color: Colors.green, context: context);
      emit(UpdatePostState());
    } else {
      showSnackBarMessage(
          color: Colors.red,
          title: 'please check internet conection',
          context: context);
      emit(NoInternetConnectionState());
    }
  }

  void deletePost(int id, BuildContext context) async {
    if (await networkInfo.isConnected) {
      showCircularProgressIndicator(context: context);
      await deletePostUsecase.deleteData(id);
      goHome(title: 'Post Deleted', color: Colors.red, context: context);
      emit(DeletePostState());
    } else {
      showSnackBarMessage(
          color: Colors.red,
          title: 'please check internet conection',
          context: context);
      emit(NoInternetConnectionState());
    }
  }
}

void goHome({BuildContext? context, String? title, Color? color}) {
  showSnackBarMessage(color: color, context: context, title: title);
  Navigator.pop(context!);
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const HomeView(),
  ));
}

Future showCircularProgressIndicator({BuildContext? context}) {
  return showDialog(
    context: context!,
    builder: (context) {
      return Center(
        child: CircularProgressIndicator(
          color: Colors.deepPurple.shade900,
        ),
      );
    },
  );
}

void showSnackBarMessage({BuildContext? context, String? title, Color? color}) {
  ScaffoldMessenger.of(context!).showSnackBar(
    SnackBar(
      content: Text(title!),
      backgroundColor: color,
    ),
  );
}
