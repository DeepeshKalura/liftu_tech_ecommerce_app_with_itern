import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            )
          ],
        ),
      ),
    );
  }
}
