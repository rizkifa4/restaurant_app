import 'package:flutter/material.dart';

import '../models/resto_model.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key, required this.restaurant});
  static const routeName = '/Restaurant_detail';
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('restaurant'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(restaurant.pictureId),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(fontSize: 30),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_pin),
                      Text(restaurant.city)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star_half_sharp),
                      Text(restaurant.rating.toString()),
                    ],
                  ),
                  const Divider(
                    height: 10,
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Description'),
                          const Divider(height: 10),
                          Text(restaurant.description)
                        ],
                      )),
                  const Divider(
                    height: 10,
                  ),
                  Column(
                    children: [
                      const Text('Menu Food'),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: restaurant.menus.foods.length,
                        itemBuilder: (_, index) {
                          return Text(restaurant.menus.foods[index].name);
                        },
                      ),
                      const Text('Menu Drinks'),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: restaurant.menus.drinks.length,
                        itemBuilder: (_, index) {
                          return Text(restaurant.menus.drinks[index].name);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
