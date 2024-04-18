import 'package:flutter/material.dart';
import 'package:place_app/models/place.dart';
import 'package:place_app/screens/add_place.dart';
import 'package:place_app/widgets/place_list.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Place> places = [
      Place(title: 'Place title'),
      Place(title: 'Your favorite place'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => AddPlaceScreen())));
            },
          ),
        ],
      ),
      body: PlacesList(places: places),
    );
  }
}
