import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:provider/provider.dart';

// import '../../../controller/api/fake_api.dart';
import 'widget/hero_container_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> categories = [
    "All Product",
    "SmartPhones",
    "Wearable",
    "Books",
    "Laptops",
    "Accessories"
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<FakeAPI>(context).getHeroProducts();
    // final data = Provider.of<FakeAPI>(context).heroProducts;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Row(
            children: [
              const CircleAvatar(
                radius: 27,
                backgroundImage: AssetImage(
                  'assets/pictures/profileImage.png',
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 10,
                left: 20,
                bottom: 2,
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search for brand..',
                  fillColor: Colors.grey[200] ?? Colors.grey,
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey[500] ?? Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                CarouselSlider(
                  items: [
                    HeroContainerWidget(
                      image:
                          // data[0].imageUrl ??
                          "assets/pictures/hero/pixel.png",
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
                  ],
                  options: CarouselOptions(
                    autoPlay: false,
                    initialPage: 0,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                  ),
                ),
                const Positioned(
                  bottom: 20,
                  left: 35,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xFFABA9A9),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xFF1E1E1E),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xFFABA9A9),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xFFABA9A9),
                      ),
                    ],
                  ),
                )
              ],
            ),
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
          ],
        ),
      ),
    );
  }
}
