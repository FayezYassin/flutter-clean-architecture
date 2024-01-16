import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../Repositories/posts_repositort.dart';
import '../entities/posts.dart';

class AddPostUseCase {
  final PostsRepository repository;

  AddPostUseCase(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.addPost(post);
  }
}
