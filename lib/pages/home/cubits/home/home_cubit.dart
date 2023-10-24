import 'package:clean_arc/pages/home/cubits/location/location_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.locationCubit) : super(HomeInitial());
  onInit() async {
    emit(const HomeSuccess(0));
    await Future.delayed(const Duration(seconds: 3));
    locationCubit.onInit();
  }

  onUpdate() {
    if (state is! HomeSuccess) return;
    final s = state as HomeSuccess;
    emit(HomeSuccess(s.counter + 1));
  }

  final LocationCubit locationCubit;
}
