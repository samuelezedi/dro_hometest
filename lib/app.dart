import 'package:dro_hometest/di/injectable.dart';
import 'package:dro_hometest/features/hometest/presentation/bloc/home_test_bloc.dart';
import 'package:dro_hometest/features/hometest/presentation/cubit/cart_cubit.dart';
import 'package:dro_hometest/features/hometest/presentation/pages/pharmacy_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTestApp extends StatelessWidget {
  const HomeTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                getIt<HomeTestBloc>()..add(const GetCartItems())),
        BlocProvider(create: (context) => getIt<CartCubit>()),
      ],
      child: const PharmacyPage(),
    );
  }
}
