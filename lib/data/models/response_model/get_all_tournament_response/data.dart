import 'package:json_annotation/json_annotation.dart';

import 'tournament.dart';

part 'data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  String? cursor;
  @JsonKey(name: 'tournament_count')
  dynamic tournamentCount;
  List<Tournament>? tournaments;
  @JsonKey(name: 'is_last_batch')
  bool? isLastBatch;

  Data({
    this.cursor,
    this.tournamentCount,
    this.tournaments,
    this.isLastBatch,
  });

  @override
  String toString() {
    return 'Data(cursor: $cursor, tournamentCount: $tournamentCount, tournaments: $tournaments, isLastBatch: $isLastBatch)';
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
