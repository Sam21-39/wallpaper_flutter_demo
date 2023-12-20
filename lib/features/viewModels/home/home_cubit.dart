import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_flutter_demo4/core/services/apis/apis.dart';
import 'package:wallpaper_flutter_demo4/features/models/photo_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          HomeState(
            isError: false,
            isLoading: true,
            photoModel: [],
          ),
        );

  init() async {
    try {
      final res = await Apis().getphotos();

      emit(
        HomeState(
          photoModel: res,
          isLoading: false,
          isError: false,
        ),
      );
    } catch (e) {
      emit(
        HomeState(
          photoModel: [],
          isLoading: false,
          isError: true,
        ),
      );
    }
  }
}
