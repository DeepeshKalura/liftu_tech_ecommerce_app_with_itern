import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.price,
    this.width = 165,
    this.height = 200,
  });
  final String image;
  final String title;
  final String subtitle;
  final int color;
  final String price;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        left: 10,
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.45, 0.45],
          colors: [Color(color), const Color.fromARGB(0, 255, 255, 255)],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: width * 0.25,
            child: Image.asset(
              image,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 9,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.5,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 16,
                            height: 1.1,
                            letterSpacing: -0.29,
                          ),
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      subtitle,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 12,
                            color: const Color(0xFF979599),
                          ),
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '\$ $price',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                      ),
                      SizedBox(
                        width: width * 0.5,
                      ),
                      SizedBox(
                        child: SvgPicture.asset(
                          'assets/icons/add.svg',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}