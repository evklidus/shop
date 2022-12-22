import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/shops/presentation/bloc/shops_bloc.dart';
import 'package:shop/features/shops/presentation/screens/states/shops_loaded_screen.dart';
import 'package:shop/services/di/get_it.dart';

class ShopsScreen extends StatefulWidget {
  const ShopsScreen({super.key});

  @override
  State<ShopsScreen> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  final ShopsBloc shopsBloc = getIt.get<ShopsBloc>();

  @override
  void initState() {
    shopsBloc.add(LoadShopsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopsBloc>(
      create: (context) => shopsBloc,
      child: Scaffold(
        body: BlocBuilder<ShopsBloc, ShopsState>(builder: (context, state) {
          if (state is ShopsLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is ShopsLoadedState) {
            return ShopsLoadedScreen(
              shops: state.shops,
            );
          }
          if (state is ShopsErrorState) {
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          }
          if (state is ShopsEmptyState) {
            return const Scaffold(
              body: Center(
                child: Text('Empty'),
              ),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
