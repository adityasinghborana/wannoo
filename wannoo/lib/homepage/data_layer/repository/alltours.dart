import 'package:wannoo/homepage/data_layer/model/response/alltours.dart';
import 'package:wannoo/homepage/data_layer/service/alltours_remote.dart';

abstract class AlltoursRepository {
  Future<List<ALLTours>> gettours();
}

@override
class AlltoursRepositoryImpl implements AlltoursRepository {
  final GetAllTours remote;

  AlltoursRepositoryImpl(this.remote);

  @override
  Future<List<ALLTours>> gettours() {
    return remote.getTours();
  }
}
