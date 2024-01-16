
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cleanartchictor_examp/core/error/failures.dart';
import 'package:flutter_cleanartchictor_examp/core/strings/failures.dart';
import 'package:flutter_cleanartchictor_examp/core/strings/messages.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/domain/usecases/add_post.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/domain/usecases/delete_post.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/domain/usecases/update_post.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_event.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc
    extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
  final AddPostUseCase addPost;
  final UpdatePostUseCase updatePost;
  final DeletePostUseCase deletePost;

  AddDeleteUpdatePostBloc({
    required this.addPost,
    required this.updatePost,
    required this.deletePost,
  }) : super(AddDeleteUpdatePostInitial()) {
    on<AddDeleteUpdatePostEvent>((event, emit) async {
      if (event is AddPostEvent) {
        emit(LoadingAddDeleteUpdatePostState());
        final failureOrDoneMessage = await addPost(event.post);
        emit(_eitherDoneMessageOrErrorState(
            failureOrDoneMessage, Add_Success_Message));
      } else if (event is UpdatePostEvent) {
        emit(LoadingAddDeleteUpdatePostState());
        final failureOrDoneMessage = await updatePost(event.post);
        emit(_eitherDoneMessageOrErrorState(
            failureOrDoneMessage, Update_Success_Message));
      } else if (event is DeletePostEvent) {
        emit(LoadingAddDeleteUpdatePostState());
        final failureOrDoneMessage = await deletePost(event.postId);
        emit(_eitherDoneMessageOrErrorState(
            failureOrDoneMessage, Delete_Success_Message));
      }
    });
  }

  AddDeleteUpdatePostState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) =>
          ErrorAddDeleteUpdatePostState(message: _mapFailureToMessage(failure)),
      (_) => MessageAddDeleteUpdatePostState(message: message),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Server_Failure_Message;
      case OfflineFailure:
        return Offline_Failure_Message;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
