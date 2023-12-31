import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'conn_state.dart';

class ConnCubit extends Cubit<ConnState> {
  ConnCubit()
      : super(ConnState(
          isConnected: false,
          isLoading: true,
          errorMessage: '',
        ));

  init() async {
    final Connectivity connectivity = Connectivity();
    final event = await connectivity.checkConnectivity();
    if (event == ConnectivityResult.wifi ||
        event == ConnectivityResult.mobile) {
      emit(
        ConnState(
          isConnected: true,
          isLoading: false,
          errorMessage: '',
        ),
      );
    }
    connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        emit(
          ConnState(
            isConnected: true,
            isLoading: false,
            errorMessage: '',
          ),
        );
      } else {
        emit(
          ConnState(
            isConnected: false,
            isLoading: false,
            errorMessage: 'Not connected to internet!',
          ),
        );
      }
    });
  }
}
