import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:provider/provider.dart';

import '../../../controller/navigation/routes_name.dart';
import '../../../model/product/product.dart';
import '../../global/global_colors.dart';
import '../../global/widget/no_serach_result.dart';
import 'product_grid_widget.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> prdList;
  final String query;

  const ProductListScreen(
      {super.key, required this.prdList, required this.query});

  @override
  Widget build(BuildContext context) {
    print("Yes iam building");
    // final prdList = Provider.of<HomeScreenController>(context).search;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(EvaIcons.arrowBack),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          query,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(EvaIcons.heartOutline),
            onPressed: () {},
          ),
        ],
      ),
      body: prdList.isEmpty
          ? const Center(
              child: NoSearchResultGlobalWidget(),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 7 / 10,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: prdList.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutesName.detailScreen,
                        arguments: {
                          "product": prdList[index],
                          "index": index,
                        },
                      );
                    },
                    child: ProductGridWidget(
                      color: GlobalColors.randomColor(index),
                      image: prdList[index].images?[0] ??
                          'https://i.imgur.com/5mPmJYO.jpeg',
                      title: prdList[index].title ?? 'Handmade Plastic Chips',
                      price: prdList[index].price?.toString() ?? '381',
                      subtitle: prdList[index].description ??
                          'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design',
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                  );
                }),
              ),
            ),
    );
  }
}
