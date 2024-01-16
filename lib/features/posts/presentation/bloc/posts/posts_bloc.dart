import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cleanartchictor_examp/core/error/failures.dart';
import 'package:flutter_cleanartchictor_examp/core/strings/failures.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/domain/entities/posts.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/domain/usecases/get_all_posts.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/bloc/posts/posts_event.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/bloc/posts/posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUseCase getAllPostsEvent;

  PostsBloc({required this.getAllPostsEvent}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        emit(LoadingPostsState());

        final failureOrPosts = await getAllPostsEvent();
        emit(_mapFailureOrPostsToState(failureOrPosts));
      } else if (event is RefreshPostsEvent) {
        emit(LoadingPostsState());
        final failureOrPosts = await getAllPostsEvent();
        emit(_mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }

  PostsState _mapFailureOrPostsToState(Either<Failure, List<Post>> either) {
    return either.fold(
        (failure) => ErrorPostsState(message: _mapFailureToMessage(failure)),
        (posts) => LoadedPostsState(posts: posts));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Server_Failure_Message;
      case EmptyCacheFailure:
        return Empty_Cache_Failure_Message;
      case OfflineFailure:
        return Offline_Failure_Message;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
