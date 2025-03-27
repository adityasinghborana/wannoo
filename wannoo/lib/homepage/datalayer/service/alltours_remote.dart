import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wannoo/utilities/dio_interceptor.dart';
import '../../../Constants.dart';
import '../model/response/alltours.dart';
// Import the Dio client

part 'alltours_remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class GetAllTours {
  factory GetAllTours(Dio dio, {String? baseUrl}) = _GetAllTours;

  @GET('/tours')
  Future<List<ALLTours>> getTours();
}

// Use the centralized Dio instance directly
//GetAllTours getAllToursService = GetAllTours(dioInstance);
