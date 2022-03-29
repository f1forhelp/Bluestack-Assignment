import 'package:bluestack_assignment/data/models/response_model/get_all_tournament_response/get_all_tournament_response.dart';
import 'package:bluestack_assignment/utils/constants/url_constants.dart';
import 'package:bluestack_assignment/utils/network/api_result/api_result.dart';
import 'package:bluestack_assignment/utils/network/network_utils.dart';

class DashBoardRepo {
  static final NetworkUtil _networkUtil = NetworkUtil(baseUrl: "");

  static Future<ApiResult<GetAllTournamentResponse>>
      getAllTournamentResponse() async {
    try {
      var res = await _networkUtil.get(KUrl.getAllTournaments());
      var data = GetAllTournamentResponse.fromJson(res.data);
      return ApiResult.success(data: data);
    } catch (e) {
      return ApiResult.failure(error: NetworkUtil.getDioException(e));
    }
  }
}
