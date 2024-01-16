
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../Repositories/posts_repositort.dart';
import '../entities/posts.dart';

class UpdatePostUseCase {
  final PostsRepository repository;

  UpdatePostUseCase(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.updatePost(post);
  }
}
