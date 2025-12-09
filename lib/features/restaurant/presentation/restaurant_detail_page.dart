import 'package:flutter/material.dart';

class RestaurantDetailPage extends StatelessWidget {
  final String id;
  const RestaurantDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Restaurant $id')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Menu Item ${index + 1}'),
            subtitle: const Text('Description of the item...'),
            trailing: const Text('\$12.99'),
            leading: Container(width: 50, height: 50, color: Colors.grey[300]),
          );
        },
      ),
    );
  }
}