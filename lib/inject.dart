import 'package:api_with_solid/const/network/network_info.dart';
import 'package:api_with_solid/const/strings/strings.dart';
import 'package:api_with_solid/data/data_sorces/local_services.dart';
import 'package:api_with_solid/domain/usecases/create_post.dart';
import 'package:api_with_solid/domain/usecases/delete_post.dart';
import 'package:api_with_solid/domain/usecases/read_posts.dart';
import 'package:api_with_solid/data/repository/web_repository.dart';
import 'package:api_with_solid/data/data_sorces/web_services.dart';
import 'package:api_with_solid/domain/usecases/update_post.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'domain/repository/post_repository.dart';
import 'presentation/logic/api_cubit/api_cubit.dart';
import 'presentation/logic/crud_cubit/crud_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> initGetIt() async {
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

  //! logic
  sl.registerLazySingleton<ApiCubit>(() => ApiCubit(readPostsUsecase: sl()));
  sl.registerLazySingleton<CrudCubit>(() => CrudCubit(
        networkInfo: sl(),
        deletePostUsecase: sl(),
        updatePostUsecase: sl(),
        addPostUsecase: sl(),
      ));

  //! Usecases
  sl.registerLazySingleton<AddPostUsecase>(() => AddPostUsecase(webRepo: sl()));
  sl.registerLazySingleton<DeletePostUsecase>(
      () => DeletePostUsecase(webRepo: sl()));
  sl.registerLazySingleton<UpdatePostUsecase>(
      () => UpdatePostUsecase(webRepo: sl()));
  sl.registerLazySingleton<ReadPostsUsecase>(
      () => ReadPostsUsecase(webRepo: sl()));

  //! My data
  sl.registerLazySingleton<LocalServices>(
      () => LocalServicesImp(sharedPreferences: sl()));
  sl.registerLazySingleton<WebServices>(() => WebServicesImp(dio: dio));

  //! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));

  sl.registerLazySingleton<WebRepo>(() => WebRepoImp(
        webServices: sl(),
        localServices: sl(),
        networkInfo: sl(),
      ));
  //! External

  sl.registerLazySingleton(() => InternetConnectionChecker());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
