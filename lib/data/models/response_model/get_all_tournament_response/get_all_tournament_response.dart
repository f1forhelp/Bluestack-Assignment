import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_all_tournament_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllTournamentResponse {
  int? code;
  Data? data;
  bool? success;

  GetAllTournamentResponse({this.code, this.data, this.success});

  @override
  String toString() {
    return 'GetAllTournamentResponse(code: $code, data: $data, success: $success)';
  }

  factory GetAllTournamentResponse.fromJson(Map<String, dynamic> json) {
    return _$GetAllTournamentResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllTournamentResponseToJson(this);
}
