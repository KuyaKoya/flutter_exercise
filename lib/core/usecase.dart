import 'package:flutter_exercise/data/repositories/base_repository.dart';

abstract class IBaseUseCase {
  abstract final BaseRepository baseRepository;
}

class BaseUseCase extends IBaseUseCase {
  @override
  final BaseRepository baseRepository;
  
  BaseUseCase({required this.baseRepository});
}
