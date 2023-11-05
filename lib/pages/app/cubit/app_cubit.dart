import 'package:clean_arc/core/services/share_preferences/share_preferences_helper.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this._helper) : super(AppInitial());

  onInit() async {
    var userId = _helper.getUserId();
    if (userId == null) {
      await _helper.setUserId();
    }
    userId = _helper.getUserId();
    if (userId == null) throw Exception('not set userId');
    final points = _helper.getPoints();
    final userName = _helper.getUserName();
    emit(AppSuccess(points: points, userName: userName, userId: userId));
  }

  onUpdateUserName(String userName) async {
    AppSuccess stateOld;
    if (state is AppSuccess) {
      stateOld = state as AppSuccess;
    } else {
      return;
    }
    await _helper.setUserName(userName);
    emit(
      AppSuccess(
        points: stateOld.points,
        userId: stateOld.userId,
        userName: userName,
      ),
    );
  }

  onUpdatePoint(String point) async {
    AppSuccess stateOld;
    if (state is AppSuccess) {
      stateOld = state as AppSuccess;
    } else {
      return;
    }
    await _helper.setPoint(point);
    emit(
      AppSuccess(
        userId: stateOld.userId,
        points: List.from(stateOld.points)..add(point),
        userName: stateOld.userName,
      ),
    );
  }

  onShare(BuildContext context) {
    AppSuccess stateOld;
    if (state is AppSuccess) {
      stateOld = state as AppSuccess;
    } else {
      return;
    }
    String point = List.from(stateOld.points)
        .sorted((a, b) => int.parse(b).compareTo(int.parse(a)))
        .first;
  }

  final SharedPreferencesHelper _helper;
}
