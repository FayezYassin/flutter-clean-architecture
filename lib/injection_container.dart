
import 'package:flutter_cleanartchictor_examp/core/network/network_info.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/data/datasources/post_local_data_source.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/data/repositories/post_repositories_imp.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/domain/Repositories/posts_repositort.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/domain/usecases/add_post.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/domain/usecases/delete_post.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/domain/usecases/get_all_posts.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/domain/usecases/update_post.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Posts

  // Bloc
  sl.registerFactory(() => PostsBloc(getAllPostsEvent: sl()));
  sl.registerFactory(() =>
      AddDeleteUpdatePostBloc(
        addPost: sl(),
        updatePost: sl(),
        deletePost: sl(),
      ));

  // Usecases
  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));
  sl.registerLazySingleton(() => AddPostUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePostUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl()));

  // Repository
  sl.registerLazySingleton<PostsRepository>(() =>
      PostsRepositoryImp(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));
      

  // DataSources
  sl.registerLazySingleton<PostRemoteDataSource>(
          () => PostRemoteDataSourceImp(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(
          () => PostLocalDataSourceImp(sharedPreferences: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));

  // External
  final SharedPreferences sharedPreferences = await SharedPreferences
      .getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
