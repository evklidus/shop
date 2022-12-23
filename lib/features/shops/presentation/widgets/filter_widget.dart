import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/components/custom_text_field.dart';
import 'package:shop/features/shops/presentation/bloc/shops_bloc.dart';
import 'package:shop/utilities/is_int.dart';

class FilterWidget extends StatelessWidget {
  FilterWidget({super.key});

  String? name;
  int? weight;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ShopsBloc shopsBloc = context.read<ShopsBloc>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 15,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Название товара',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите что-то';
                }
                name = value;
                return null;
              },
            ),
            const SizedBox(height: 8),
            CustomTextField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              hintText: 'Вес',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите что-то';
                }
                if (!isInt(value)) {
                  return 'Пожалуйста, введите целое число';
                }
                weight = int.parse(value);
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: const Text('Сбросить'),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    _formKey.currentState?.reset();
                    shopsBloc.add(ResetFiltersShopsEvent());
                  },
                ),
                TextButton(
                  child: const Text('Применить'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      shopsBloc.add(
                        SetFiltersShopsEvent(
                          name: name!,
                          weight: weight!,
                        ),
                      );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
