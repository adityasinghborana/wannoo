// // dio_interceptor.dart
// import 'package:dio/dio.dart';
//
// // Define your API keys here or in a constants file
// const apiKey = "your-api-key";
// const apiSecret = "your-api-secret";
//
// Dio createDio() {
//   final dio = Dio();
//
//   // Add an interceptor to attach headers to each request
//   dio.interceptors.add(InterceptorsWrapper(
//     onRequest: (options, handler) {
//       options.headers['X-API-KEY'] = "AqwuSDGGjhaUlY0wmAeVQbfDpdZn7C1Ksyk73mX5k0kthQa4ZLN6DvhrlM8bojX";
//       options.headers['X-API-SECRET'] = "Rui0AeZxM8jz0AWIElDaCx1woYKhUKTr4LkjlLBMKoLlLgG6tN6C4XGJ98Xd9BtUlIpnnI4pDeskteSFBwLWRpGgFr2JNfIOLcvQ1rFCdcwBc2Ltthb8AyPu7GpBGyJ6";
//       return handler.next(options); // continue with the request
//     },
//   ));
//
//   return dio;
// }
// final Dio dioInstance = createDio();
