import 'package:wannoo/profile/datalayer/model/response/legal_screen_response_model.dart';
import 'package:wannoo/profile/datalayer/services/legal_remote.dart';

abstract class LegalRepo {
  Future<LegalScreenResponseModel> getData();
}

class LegalRepoImpl implements LegalRepo {
  final LegalRemote remote;

  LegalRepoImpl(this.remote);

  @override
  Future<LegalScreenResponseModel> getData() async {
    return await remote.getData();
  }
}
