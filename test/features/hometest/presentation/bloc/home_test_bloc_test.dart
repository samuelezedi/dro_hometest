import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dro_hometest/features/hometest/domain/entities/cart.dart';
import 'package:dro_hometest/features/hometest/presentation/bloc/home_test_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  late HomeTestBloc homeTestBloc;

  setUp(() {
    homeTestBloc = HomeTestBloc();
  });

  final tCart = Cart(cartId: '1', itemId: 1, quantity: 2);

  const cart = '1';

  group('bloc test', () {
    test('initial state should be empty', () {
      expect(homeTestBloc.state, HomeTestInitial());
    });

    blocTest<HomeTestBloc, HomeTestState>(
        'should emit [loading, has data] when data is gotten successfully',
        build: () {
          when(homeTestBloc.getCartMix())
              .thenAnswer((_) async => const Right(tWeather));
          return homeTestBloc;
        },
        act: (bloc) => bloc.add(const OnCityChanged(tCityName)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
              WeatherLoading(),
              const WeatherHasData(tWeather),
            ],
        verify: (bloc) {
          verify(mockGetCurrentWeather.execute(tCityName));
        });

    blocTest<WeatherBloc, WeatherState>(
        'should emit [loading, error] when data is gotten unsuccessfully',
        build: () {
          when(mockGetCurrentWeather.execute(tCityName)).thenAnswer(
              (_) async => const Left(ServerFailure('Server failure')));
          return weatherBloc;
        },
        act: (bloc) => bloc.add(const OnCityChanged(tCityName)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
              WeatherLoading(),
              const WeatherError('Server failure'),
            ],
        verify: (bloc) {
          verify(mockGetCurrentWeather.execute(tCityName));
        });
  });
}
