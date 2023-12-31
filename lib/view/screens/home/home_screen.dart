import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

// import '../../../controller/api/fake_api.dart';
import '../../../controller/navigation/routes_name.dart';
import '../../../controller/view/home_screen_controller.dart';
import '../../../model/category.dart';
import '../../../model/product/product.dart';
import '../../global/global_colors.dart';
import 'widget/hero_container_widget.dart';
import 'widget/product_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<String> categories = [
    "All Product",
    "SmartPhones",
    "Laptops",
    "SmartWatches",
    "SmartPhones",
    "Laptops",
    "SmartWatches"
  ];

  @override
  void initState() {
    super.initState();
  }

  final List<Product> product = [
    Product(
      id: 1,
      title: "Google Pixel 7",
      price: 999,
      description: "Full Speed Ahead",
      images: [
        "assets/pictures/iphone.png",
        "assets/pictures/iphone.png",
        "assets/pictures/iphone.png",
      ],
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
      category: Category(
        id: 1,
        name: "SmartPhones",
        image: "assets/pictures/iphone.png",
        creationAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ),
    Product(
      id: 2,
      title: "iPhone 14",
      price: 999,
      description: "A magic new way to interact with the iphone the ",
      images: [
        "assets/pictures/iphone.png",
        "assets/pictures/iphone.png",
        "assets/pictures/iphone.png",
      ],
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
      category: Category(
        id: 1,
        name: "SmartPhones",
        image: "assets/pictures/iphone.png",
        creationAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ),
    Product(
      id: 3,
      title: "Cool Phone",
      price: 999,
      description: "New Area of coolness",
      images: [
        "assets/pictures/iphone.png",
        "assets/pictures/iphone.png",
        "assets/pictures/iphone.png",
      ],
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
      category: Category(
        id: 1,
        name: "SmartPhones",
        image: "assets/pictures/iphone.png",
        creationAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeScreenController>(context);

    // Provider.of<FakeAPI>(context).getHeroProducts();
    // final data = Provider.of<FakeAPI>(context).heroProducts;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 5, right: 10),
              child: CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage(
                  'assets/pictures/profileImage.png',
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  'Krishna SN',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              EvaIcons.bell,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              EvaIcons.menu,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: controller.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      right: 10,
                      left: 10,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onSubmitted: (_) async {
                        final value = _searchController.text.trim();
                        if (value.isEmpty) return;
                        controller.changeLoading();
                        await controller.searchProduct(value);
                        controller.changeLoading();

                        _searchController.clear();
                        Navigator.pushNamed(
                          context,
                          RoutesName.productListScreen,
                          arguments: {
                            "query": value,
                            "prdList": controller.search,
                          },
                        );
                      },
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                      decoration: InputDecoration(
                        hintText: 'Search for brand..',
                        fillColor: Colors.grey[200] ?? Colors.grey,
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 77, 78, 79),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer(
                      builder: (context, HomeScreenController controller, _) {
                    return Stack(
                      children: [
                        CarouselSlider(
                          items: [
                            HeroContainerWidget(
                              image:
                                  // data[0].imageUrl ??
                                  "assets/pictures/hero/HeroPhoneImage.png",
                              title:
                                  //  data[0].subtitle
                                  // ??
                                  "Get Pixel 7 and\nPixel 7 pro",
                              subtitle: 'Full Speed ahead',
                              color: Color(
                                int.parse(
                                  // data[0].color ??
                                  // "0x"
                                  "FFF8E4DD",
                                  radix: 16,
                                ),
                              ),
                            ),
                            const HeroContainerWidget(
                              image:
                                  // data[0].imageUrl ??
                                  "assets/pictures/hero/HeroPhoneImage.png",
                              title:
                                  //  data[0].subtitle
                                  // ??
                                  "Get Pixel 7 and\nPixel 7 pro",
                              subtitle: 'Full Speed ahead',
                              color: Color(GlobalColors.orange),
                            ),
                            const HeroContainerWidget(
                              image:
                                  // data[0].imageUrl ??
                                  "assets/pictures/hero/HeroPhoneImage.png",
                              title:
                                  //  data[0].subtitle
                                  // ??
                                  "Get Pixel 7 and\nPixel 7 pro",
                              subtitle: 'Full Speed ahead',
                              color: Color(
                                GlobalColors.green,
                              ),
                            ),
                            const HeroContainerWidget(
                              image:
                                  // data[0].imageUrl ??
                                  "assets/pictures/hero/HeroPhoneImage.png",
                              title:
                                  //  data[0].subtitle
                                  // ??
                                  "Get Pixel 7 and\nPixel 7 pro",
                              subtitle: 'Full Speed ahead',
                              color: Color(
                                GlobalColors.red,
                              ),
                            ),
                          ],
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              controller.changeIndex(index);
                            },
                            autoPlay: false,
                            initialPage: 0,
                            viewportFraction: 1,
                            enableInfiniteScroll: true,
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 35,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: controller.currentIndex == 0
                                    ? const Color(0xFF1E1E1E)
                                    : const Color(0xFFABA9A9),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: controller.currentIndex == 1
                                    ? const Color(0xFF1E1E1E)
                                    : const Color(0xFFABA9A9),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: controller.currentIndex == 2
                                    ? const Color(0xFF1E1E1E)
                                    : const Color(0xFFABA9A9),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: controller.currentIndex == 3
                                    ? const Color(0xFF1E1E1E)
                                    : const Color(0xFFABA9A9),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 45,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(
                                    0xFF1C2023,
                                  ),
                                ),
                                fixedSize: MaterialStateProperty.all(
                                  const Size(125, 40),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  categories[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: categories.length,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "New Arrival",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 24,
                                    color: Colors.black,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, right: 10),
                        child: TextButton(
                          onPressed: () async {
                            controller.changeLoading();
                            await controller.getAllProducts();
                            controller.changeLoading();
                            Navigator.pushNamed(
                              context,
                              RoutesName.productListScreen,
                              arguments: {
                                "query": "New Arrival",
                                "prdList": controller.allProducts,
                              },
                            );
                          },
                          child: Text(
                            "See All",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF979599),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 210,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: product.length,
                        itemBuilder: (context, index) {
                          final width = MediaQuery.of(context).size.width * 0.4;
                          const height = 200.0;
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesName.detailScreen,
                                  arguments: {
                                    "product": product[index],
                                    "index": index,
                                  });
                            },
                            child: ProductCardWidget(
                              id: product[index].id ?? 0,
                              image: product[index].images?[0] ??
                                  "assets/pictures/phoneProfile.png",
                              title: product[index].title ??
                                  "Google Pixel 7 and Pixel 7 Pro",
                              subtitle: product[index].description ??
                                  "Full Speed Ahead",
                              price: '${product[index].price}',
                              color: GlobalColors.randomColor(index),
                              height: height,
                              width: width,
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
