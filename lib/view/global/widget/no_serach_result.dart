import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoSearchResultGlobalWidget extends StatelessWidget {
  const NoSearchResultGlobalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: SvgPicture.asset(
          'assets/icons/noresult.svg',
        ),
      ),
    );
  }
}
