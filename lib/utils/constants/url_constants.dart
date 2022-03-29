class KUrl {
  KUrl._();

  static const String baseUrl = "";

  static String getAllTournaments({String? cursor}) {
    if (cursor == null) {
      return "http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all";
    } else {
      return "http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all&cursor=$cursor";
    }
  }
}
