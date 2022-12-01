part of 'crud_cubit.dart';

abstract class CrudState extends Equatable {
  const CrudState();
  @override
  List<Object> get props => [];
}

class CrudInitial extends CrudState {}
class NoInternetConnectionState extends CrudState {}
class DeletePostState extends CrudState {}
class UpdatePostState extends CrudState {}
class CreatePostState extends CrudState {}
