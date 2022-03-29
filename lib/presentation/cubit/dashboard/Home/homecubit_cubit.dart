import 'package:bloc/bloc.dart';
import 'package:bluestack_assignment/data/repository/dashboard_repo.dart';
import 'package:bluestack_assignment/utils/network/result_state/result_state.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'homecubit_state.dart';

class HomecubitCubit extends Cubit<HomecubitState> {
  HomecubitCubit()
      : super(const HomecubitState(getTournamentState: ResultState.idle()));

  getAllTournament() {
    emit(state.);
    DashBoardRepo.getAllTournamentResponse();
  }
}
