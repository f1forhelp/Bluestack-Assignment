import 'package:bluestack_assignment/data/models/response_model/get_all_tournament_response/get_all_tournament_response.dart';
import 'package:bluestack_assignment/data/models/response_model/get_all_tournament_response/tournament.dart';
import 'package:bluestack_assignment/data/repository/dashboard_repo.dart';
import 'package:bluestack_assignment/presentation/provider/base_notifier.dart';
import 'package:bluestack_assignment/utils/network/network_utils.dart';
import 'package:bot_toast/bot_toast.dart';

class HomeProvider extends BaseNotifier {
  GetAllTournamentResponse _getAllTournamentResponse =
      GetAllTournamentResponse();
  List<Tournament> tournaments = [];

  Future getAllTournament() async {
    if (_getAllTournamentResponse.data?.cursor == null) {
      BotToast.showLoading();
    }

    viewState1 = ViewState.loading;
    var res = await DashBoardRepo.getAllTournamentResponse(
        cursor: _getAllTournamentResponse.data?.cursor);
    res.when(success: (data) {
      _getAllTournamentResponse = data;
      tournaments.addAll(data.data?.tournaments ?? []);
    }, failure: (e) {
      BotToast.showText(text: NetworkUtil.getErrorMessage(e));
    });
    viewState1 = ViewState.loaded;
    BotToast.closeAllLoading();
  }
}
