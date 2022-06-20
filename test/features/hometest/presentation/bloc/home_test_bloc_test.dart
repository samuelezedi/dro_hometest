import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dro_hometest/features/hometest/domain/entities/cart.dart';
import 'package:dro_hometest/features/hometest/presentation/bloc/home_test_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_test_bloc_test.mocks.dart';

@GenerateMocks([HomeTestBloc])
void main() {
  late HomeTestBloc homeTestBloc;
  late MockHomeTestBloc mockHomeTestBloc;

  setUp(() {
    homeTestBloc = HomeTestBloc();
    mockHomeTestBloc = MockHomeTestBloc();
  });

  final tCart = Cart(cartId: '1', itemId: 1, quantity: 2);

  var cart = <String>[];

  group('bloc test', () {
    test('initial state should be empty', () {
      expect(homeTestBloc.state, HomeTestInitial());
    });

    blocTest<HomeTestBloc, HomeTestState>(
        'should yield [loading, loaded] when data is gotten successfully',
        build: () {
          when(mockHomeTestBloc.getCartMix())
              .thenAnswer((_) async => Right(cart));
          return homeTestBloc;
        },
        act: (bloc) => bloc.add(const GetCartItems()),
        wait: const Duration(milliseconds: 100),
        expect: () => [
              CartLoading(),
              CartItemsLoaded(cart: cart),
            ],
        verify: (bloc) {
          verify(mockHomeTestBloc.getCartMix());
        });

    blocTest<HomeTestBloc, HomeTestState>(
        'should emit [loading, empty] when data is gotten unsuccessfully',
        build: () {
          when(mockHomeTestBloc.getCartMix())
              .thenAnswer((_) async => const Left([]));
          return homeTestBloc;
        },
        act: (bloc) => bloc.add(const GetCartItems()),
        wait: const Duration(milliseconds: 100),
        expect: () => [
              CartLoading(),
              const CartItemsLoadFail(message: 'message'),
            ],
        verify: (bloc) {
          verify(mockHomeTestBloc.getCartMix());
        });
  });
}
