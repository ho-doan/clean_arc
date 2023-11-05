part of 'app_cubit.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

final class AppInitial extends AppState {}

final class AppSuccess extends AppState {
  final String? userName;
  final List<String> points;
  final String userId;

  const AppSuccess({
    this.userName,
    required this.points,
    required this.userId,
  });
  @override
  List<Object> get props => [userName ?? '', points];
}
