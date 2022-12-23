import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/components/custom_card.dart';
import 'package:shop/components/custom_title.dart';
import 'package:shop/features/shops/domain/entities/product_entity.dart';
import 'package:shop/features/shops/domain/entities/shop_entity.dart';
import 'package:shop/features/shops/presentation/bloc/shops_bloc.dart';
import 'package:shop/features/shops/presentation/screens/others/product_screen.dart';
import 'package:shop/features/shops/presentation/screens/others/shop_sreen.dart';
import 'package:shop/utilities/get_filtered_data.dart';

class ShopWidget extends StatelessWidget {
  final ShopEntity shop;
  const ShopWidget({
    required this.shop,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final ShopsBloc shopsBloc = context.read<ShopsBloc>();
        if (shopsBloc.filtersSetted) {
          final ProductEntity product = getProductFromFilters(
            shop,
            shopsBloc.filters!.name,
            shopsBloc.filters!.weight,
          )!;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductScreen(product),
            ),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ShopScreen(shop),
            ),
          );
        }
      },
      child: CustomCard(child: CustomTitle(shop.name)),
    );
  }
}
