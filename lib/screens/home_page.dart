import 'package:flutter/material.dart';

import '../models/resto_model.dart';
import 'resto_detail_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const routeName = '/restaurant_List';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant'),
      ),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurant = parseRestaurant(snapshot.data);
          return ListView.builder(
            itemCount: restaurant.length,
            itemBuilder: (context, index) {
              return _buildRestaurantItem(context, restaurant[index]);
            },
          );
        },
      ),
    );
  }
}

Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 10,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5.0,
          spreadRadius: 1.0,
          offset: Offset(0.0, 0.0),
        ),
      ],
    ),
    child: ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(restaurant.pictureId),
      title: Text(restaurant.name),
      subtitle: Text(restaurant.city),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_half_sharp),
          Text(
            restaurant.rating.toString(),
          )
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetailPage.routeName,
            arguments: restaurant);
      },
    ),
  );
}
