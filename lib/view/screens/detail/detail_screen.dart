import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../../../model/product/product.dart';
import '../../global/global_colors.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product, required this.index});
  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    String description = product.description ??
        "The Google Pixel 6, unveiled in October 2021, represents a significant step forward for the Pixel series. With its custom Tensor SoC, it takes a leap in AI and machine learning capabilities, enhancing computational photography, language processing, and more. The camera system continues to be a standout feature, offering improvements in low-light performance, HDR processing, and computational photography. The phone boasts a vibrant display with a high refresh rate, ensuring a smooth and responsive user experience. Android 12, the latest version of Google's mobile operating system, is included, providing a refreshed user interface and robust privacy features. Additionally, 5G connectivity, a focus on device security, and a commitment to sustainability round out the Pixel 6's offerings. Its modern design, along with the promise of timely software updates, reinforces Google's reputation for delivering premium smartphones that cater to a wide range of user preferences.";
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(GlobalColors.randomColor(index)),
              Theme.of(context).scaffoldBackgroundColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.40, 0.40]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(EvaIcons.arrowBack),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Detail',
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
        body: Stack(
          children: [
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 100,
              bottom: MediaQuery.of(context).size.height / 2 + 30,
              child: SizedBox(
                child: Image.asset(
                  product.images?[0] ?? "assets/pictures/phoneProfile.png",
                  scale: 0.45,
                ),
              ),
            ),
            Positioned(
              left: 15,
              bottom: 50,
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                padding: const EdgeInsets.symmetric(vertical: 13),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFF1C2023),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Buy Now',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 15,
              bottom: MediaQuery.of(context).size.height / 2 - 20,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6 - 30,
                child: Text(
                  product.title ?? "Get the Pixel 7 and Pixel 7 pro",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Positioned(
              right: 15,
              bottom: MediaQuery.of(context).size.height / 2 - 10,
              child: Text(
                "\$ ${product.price?.toString() ?? "1.000.000"}",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Positioned(
              left: 15,
              bottom: MediaQuery.of(context).size.height / 2 - 50,
              child: SizedBox(
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF979599),
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 8,
                ),
              ),
            ),
            Positioned(
              left: 15,
              bottom: MediaQuery.of(context).size.height / 4 + 20,
              child: Text(
                'Color Available',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            Positioned(
              left: 23,
              bottom: MediaQuery.of(context).size.height / 5,
              child: SizedBox(
                height: 51,
                child: Row(
                  children: [
                    Container(
                      width: 45,
                      height: 50,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            product.images?[0] ??
                                "assets/pictures/phoneProfile.png",
                            scale: 3.0,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Container(
                      width: 45,
                      height: 50,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            product.images?[0] ??
                                "assets/pictures/phoneProfile.png",
                            scale: 3.0,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Container(
                      width: 45,
                      height: 50,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            product.images?[0] ??
                                "assets/pictures/phoneProfile.png",
                            scale: 3.0,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Container(
                      width: 45,
                      height: 50,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            product.images?[0] ??
                                "assets/pictures/phoneProfile.png",
                            scale: 3.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
