
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../Repositories/posts_repositort.dart';

class DeletePostUseCase {
  final PostsRepository repository;
  DeletePostUseCase(this.repository);
  
  Future<Either<Failure,Unit>> call(int postId) async {
    return await repository.deletePost(postId);
  }
}