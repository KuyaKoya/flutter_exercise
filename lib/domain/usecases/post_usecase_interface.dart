import 'package:flutter_exercise/core/usecase.dart';
import 'package:flutter_exercise/data/repositories/post_repository.dart';
import 'package:flutter_exercise/domain/entities/post_entity.dart';

abstract class IPostUseCase extends BaseUseCase {
  IPostUseCase({required super.baseRepository});
  Future<List<PostEntity>> getAllPosts();
}
