part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<UserPoint> userPoints;

  const HomeSuccess(this.userPoints);
  @override
  List<Object> get props => [userPoints];
}
