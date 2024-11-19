import 'package:wannoo/homepage/datalayer/model/response/alltours.dart';
import 'package:wannoo/homepage/datalayer/service/alltours_remote.dart';

abstract class  AlltoursRepository {
   Future<List<ALLTours>> gettours ();
}

@override
class AlltoursRepositoryImpl implements AlltoursRepository {
  final  GetAllTours remote;

  AlltoursRepositoryImpl(this.remote);

  @override
  Future<List<ALLTours>> gettours () {
    return remote.getTours();
  }
}
