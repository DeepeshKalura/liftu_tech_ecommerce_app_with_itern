import 'package:flutter/material.dart';

class HeroContainerWidget extends StatelessWidget {
  const HeroContainerWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.color,
  });
  final String image;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160,
      color: color,
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 22,
              top: 10,
              bottom: 10,
              right: 23,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  // width: MediaQuery.of(context).size.width * 0.3,
                  // height: 40,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 24,
                          height: 1.1,
                          letterSpacing: -0.29,
                        ),
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 16,
                      ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(
                        0xFF484848,
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(
                      Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 16,
                          ),
                    ),
                    fixedSize: MaterialStateProperty.all(
                      const Size(125, 35),
                    ),
                  ),
                  onPressed: () {},
                  child: const Center(
                    child: Text('Shop Now'),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              image,
              width: MediaQuery.of(context).size.width * 0.4,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
