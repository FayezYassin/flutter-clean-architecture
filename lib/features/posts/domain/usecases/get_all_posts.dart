
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../Repositories/posts_repositort.dart';
import '../entities/posts.dart';

class GetAllPostsUseCase {
  final PostsRepository repository;

  GetAllPostsUseCase(this.repository);

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}
