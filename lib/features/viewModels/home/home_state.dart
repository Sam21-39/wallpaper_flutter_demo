part of 'home_cubit.dart';

final class HomeState {
  final List<PhotoModel> photoModel;
  final bool isLoading;
  final bool isError;

  HomeState({
    required this.photoModel,
    required this.isLoading,
    required this.isError,
  });
}
