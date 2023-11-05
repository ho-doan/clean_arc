import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networks/core/domain/models/model.dart';
import 'package:networks/core/domain/use_cases/use_cases.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._useCase) : super(HomeInitial());
  onInit() async {
    final userPoints = (await _useCase.userPoints()).fold(
      (l) => throw Exception(l),
      (r) => r,
    );
    emit(HomeSuccess(userPoints));
  }

  final HomeUseCase _useCase;
}
