import 'package:json_annotation/json_annotation.dart';

part 'tournament.g.dart';

@JsonSerializable()
class Tournament {
  @JsonKey(name: 'is_check_in_required')
  bool? isCheckInRequired;
  @JsonKey(name: 'tournament_id')
  String? tournamentId;
  @JsonKey(name: 'tournament_ended')
  bool? tournamentEnded;
  @JsonKey(name: 'tournament_end_date')
  String? tournamentEndDate;
  @JsonKey(name: 'are_random_teams_allowed')
  bool? areRandomTeamsAllowed;
  @JsonKey(name: 'registered_teams')
  int? registeredTeams;
  @JsonKey(name: 'admin_locale')
  dynamic adminLocale;
  @JsonKey(name: 'reg_end_date')
  String? regEndDate;
  @JsonKey(name: 'start_date')
  String? startDate;
  String? rules;
  @JsonKey(name: 'max_teams')
  int? maxTeams;
  @JsonKey(name: 'tournament_url')
  String? tournamentUrl;
  String? prizes;
  @JsonKey(name: 'match_style_type')
  String? matchStyleType;
  @JsonKey(name: 'pwa_url')
  dynamic pwaUrl;
  @JsonKey(name: 'tournament_type')
  String? tournamentType;
  String? geo;
  @JsonKey(name: 'max_level_id')
  dynamic maxLevelId;
  @JsonKey(name: 'is_password_required')
  bool? isPasswordRequired;
  String? name;
  @JsonKey(name: 'match_style')
  String? matchStyle;
  @JsonKey(name: 'registration_url')
  String? registrationUrl;
  @JsonKey(name: 'game_pkg')
  dynamic gamePkg;
  @JsonKey(name: 'is_registration_open')
  bool? isRegistrationOpen;
  @JsonKey(name: 'is_waitlist_enabled')
  bool? isWaitlistEnabled;
  @JsonKey(name: 'incomplete_teams_allowed')
  bool? incompleteTeamsAllowed;
  @JsonKey(name: 'is_auto_result_allowed')
  bool? isAutoResultAllowed;
  @JsonKey(name: 'team_size')
  int? teamSize;
  String? status;
  @JsonKey(name: 'is_levels_enabled')
  bool? isLevelsEnabled;
  @JsonKey(name: 'index_page')
  bool? indexPage;
  @JsonKey(name: 'dynamic_app_url')
  String? dynamicAppUrl;
  @JsonKey(name: 'min_level_id')
  dynamic minLevelId;
  @JsonKey(name: 'game_format')
  String? gameFormat;
  String? details;
  @JsonKey(name: 'game_icon_url')
  String? gameIconUrl;
  @JsonKey(name: 'reg_start_date')
  String? regStartDate;
  @JsonKey(name: 'cover_url')
  String? coverUrl;
  @JsonKey(name: 'brackets_url')
  dynamic bracketsUrl;
  @JsonKey(name: 'tournament_slug')
  String? tournamentSlug;
  @JsonKey(name: 'discord_url')
  String? discordUrl;
  @JsonKey(name: 'game_id')
  String? gameId;
  @JsonKey(name: 'result_submission_by_admin')
  bool? resultSubmissionByAdmin;
  String? country;
  @JsonKey(name: 'admin_username')
  String? adminUsername;
  @JsonKey(name: 'game_name')
  String? gameName;
  @JsonKey(name: 'stream_url')
  String? streamUrl;
  @JsonKey(name: 'winners_count')
  int? winnersCount;

  Tournament({
    this.isCheckInRequired,
    this.tournamentId,
    this.tournamentEnded,
    this.tournamentEndDate,
    this.areRandomTeamsAllowed,
    this.registeredTeams,
    this.adminLocale,
    this.regEndDate,
    this.startDate,
    this.rules,
    this.maxTeams,
    this.tournamentUrl,
    this.prizes,
    this.matchStyleType,
    this.pwaUrl,
    this.tournamentType,
    this.geo,
    this.maxLevelId,
    this.isPasswordRequired,
    this.name,
    this.matchStyle,
    this.registrationUrl,
    this.gamePkg,
    this.isRegistrationOpen,
    this.isWaitlistEnabled,
    this.incompleteTeamsAllowed,
    this.isAutoResultAllowed,
    this.teamSize,
    this.status,
    this.isLevelsEnabled,
    this.indexPage,
    this.dynamicAppUrl,
    this.minLevelId,
    this.gameFormat,
    this.details,
    this.gameIconUrl,
    this.regStartDate,
    this.coverUrl,
    this.bracketsUrl,
    this.tournamentSlug,
    this.discordUrl,
    this.gameId,
    this.resultSubmissionByAdmin,
    this.country,
    this.adminUsername,
    this.gameName,
    this.streamUrl,
    this.winnersCount,
  });

  @override
  String toString() {
    return 'Tournament(isCheckInRequired: $isCheckInRequired, tournamentId: $tournamentId, tournamentEnded: $tournamentEnded, tournamentEndDate: $tournamentEndDate, areRandomTeamsAllowed: $areRandomTeamsAllowed, registeredTeams: $registeredTeams, adminLocale: $adminLocale, regEndDate: $regEndDate, startDate: $startDate, rules: $rules, maxTeams: $maxTeams, tournamentUrl: $tournamentUrl, prizes: $prizes, matchStyleType: $matchStyleType, pwaUrl: $pwaUrl, tournamentType: $tournamentType, geo: $geo, maxLevelId: $maxLevelId, isPasswordRequired: $isPasswordRequired, name: $name, matchStyle: $matchStyle, registrationUrl: $registrationUrl, gamePkg: $gamePkg, isRegistrationOpen: $isRegistrationOpen, isWaitlistEnabled: $isWaitlistEnabled, incompleteTeamsAllowed: $incompleteTeamsAllowed, isAutoResultAllowed: $isAutoResultAllowed, teamSize: $teamSize, status: $status, isLevelsEnabled: $isLevelsEnabled, indexPage: $indexPage, dynamicAppUrl: $dynamicAppUrl, minLevelId: $minLevelId, gameFormat: $gameFormat, details: $details, gameIconUrl: $gameIconUrl, regStartDate: $regStartDate, coverUrl: $coverUrl, bracketsUrl: $bracketsUrl, tournamentSlug: $tournamentSlug, discordUrl: $discordUrl, gameId: $gameId, resultSubmissionByAdmin: $resultSubmissionByAdmin, country: $country, adminUsername: $adminUsername, gameName: $gameName, streamUrl: $streamUrl, winnersCount: $winnersCount)';
  }

  factory Tournament.fromJson(Map<String, dynamic> json) {
    return _$TournamentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TournamentToJson(this);
}
