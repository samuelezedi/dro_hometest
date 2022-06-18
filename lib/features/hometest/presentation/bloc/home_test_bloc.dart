import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_test_event.dart';
part 'home_test_state.dart';

class HomeTestBloc extends Bloc<HomeTestEvent, HomeTestState> {
  HomeTestBloc() : super(HomeTestInitial());
}
