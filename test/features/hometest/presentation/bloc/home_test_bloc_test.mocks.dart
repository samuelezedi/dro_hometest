// Mocks generated by Mockito 5.2.0 from annotations
// in dro_hometest/test/features/hometest/presentation/bloc/home_test_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i3;
import 'package:dro_hometest/features/hometest/domain/entities/cart.dart'
    as _i5;
import 'package:dro_hometest/features/hometest/presentation/bloc/home_test_bloc.dart'
    as _i2;
import 'package:flutter_bloc/flutter_bloc.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeHomeTestState_0 extends _i1.Fake implements _i2.HomeTestState {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

class _FakeStreamSubscription_2<T> extends _i1.Fake
    implements _i4.StreamSubscription<T> {}

/// A class which mocks [HomeTestBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeTestBloc extends _i1.Mock implements _i2.HomeTestBloc {
  MockHomeTestBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.HomeTestState get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _FakeHomeTestState_0()) as _i2.HomeTestState);
  @override
  _i4.Stream<_i2.HomeTestState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i2.HomeTestState>.empty())
          as _i4.Stream<_i2.HomeTestState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  _i4.Stream<_i2.HomeTestState> mapEventToState(_i2.HomeTestEvent? event) =>
      (super.noSuchMethod(Invocation.method(#mapEventToState, [event]),
              returnValue: Stream<_i2.HomeTestState>.empty())
          as _i4.Stream<_i2.HomeTestState>);
  @override
  _i4.Future<_i3.Either<List<String>, List<String>>> getCartMix() =>
      (super.noSuchMethod(Invocation.method(#getCartMix, []),
              returnValue: Future<_i3.Either<List<String>, List<String>>>.value(
                  _FakeEither_1<List<String>, List<String>>()))
          as _i4.Future<_i3.Either<List<String>, List<String>>>);
  @override
  void updateCubit(_i5.Cart? event) =>
      super.noSuchMethod(Invocation.method(#updateCubit, [event]),
          returnValueForMissingStub: null);
  @override
  void deleteCubit(_i5.Cart? event) =>
      super.noSuchMethod(Invocation.method(#deleteCubit, [event]),
          returnValueForMissingStub: null);
  @override
  void add(_i2.HomeTestEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i2.HomeTestEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  _i4.Stream<_i6.Transition<_i2.HomeTestEvent, _i2.HomeTestState>> transformEvents(
          _i4.Stream<_i2.HomeTestEvent>? events,
          _i6.TransitionFunction<_i2.HomeTestEvent, _i2.HomeTestState>?
              transitionFn) =>
      (super.noSuchMethod(
              Invocation.method(#transformEvents, [events, transitionFn]),
              returnValue: Stream<
                  _i6.Transition<_i2.HomeTestEvent, _i2.HomeTestState>>.empty())
          as _i4.Stream<_i6.Transition<_i2.HomeTestEvent, _i2.HomeTestState>>);
  @override
  void emit(_i2.HomeTestState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void on<E extends _i2.HomeTestEvent>(
          _i6.EventHandler<E, _i2.HomeTestState>? handler,
          {_i6.EventTransformer<E>? transformer}) =>
      super.noSuchMethod(
          Invocation.method(#on, [handler], {#transformer: transformer}),
          returnValueForMissingStub: null);
  @override
  void onTransition(
          _i6.Transition<_i2.HomeTestEvent, _i2.HomeTestState>? transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i4.Stream<_i6.Transition<_i2.HomeTestEvent, _i2.HomeTestState>>
      transformTransitions(
              _i4.Stream<_i6.Transition<_i2.HomeTestEvent, _i2.HomeTestState>>?
                  transitions) =>
          (super.noSuchMethod(
                  Invocation.method(#transformTransitions, [transitions]),
                  returnValue: Stream<
                      _i6.Transition<_i2.HomeTestEvent, _i2.HomeTestState>>.empty())
              as _i4
                  .Stream<_i6.Transition<_i2.HomeTestEvent, _i2.HomeTestState>>);
  @override
  _i4.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.StreamSubscription<_i2.HomeTestState> listen(
          void Function(_i2.HomeTestState)? onData,
          {Function? onError,
          void Function()? onDone,
          bool? cancelOnError}) =>
      (super.noSuchMethod(
              Invocation.method(#listen, [
                onData
              ], {
                #onError: onError,
                #onDone: onDone,
                #cancelOnError: cancelOnError
              }),
              returnValue: _FakeStreamSubscription_2<_i2.HomeTestState>())
          as _i4.StreamSubscription<_i2.HomeTestState>);
  @override
  void onChange(_i6.Change<_i2.HomeTestState>? change) =>
      super.noSuchMethod(Invocation.method(#onChange, [change]),
          returnValueForMissingStub: null);
  @override
  void addError(Object? error, [StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#addError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void onError(Object? error, StackTrace? stackTrace) =>
      super.noSuchMethod(Invocation.method(#onError, [error, stackTrace]),
          returnValueForMissingStub: null);
}
