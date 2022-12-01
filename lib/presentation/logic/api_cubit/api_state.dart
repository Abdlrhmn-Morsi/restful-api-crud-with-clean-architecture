part of 'api_cubit.dart';

abstract class ApiState {}

class ApiInitial extends ApiState {}

class ReadDataState extends ApiState {
  List<Post> posts;
  ReadDataState({
    required this.posts,
  });
}
