import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/constants/app_constants.dart';
import 'package:shop/features/shops/presentation/bloc/shops_bloc.dart';
import 'package:shop/features/shops/presentation/screens/states/shops_loaded_screen.dart';
import 'package:shop/features/shops/presentation/widgets/filter_widget.dart';
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(AppConstants.appTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              FilterWidget(),
              const SizedBox(height: 16),
              BlocBuilder<ShopsBloc, ShopsState>(builder: (context, state) {
                if (state is ShopsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ShopsLoadedState) {
                  return ShopsLoadedScreen(
                    shops: state.shops,
                  );
                } else if (state is ShopsErrorState) {
                  return const Center(
                    child: Text('Error'),
                  );
                } else if (state is ShopsEmptyState) {
                  return const Center(
                    child: Text('Empty Data'),
                  );
                } else {
                  return const Center(
                    child: Text('Empty State'),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
