import 'package:flutter/material.dart';
import 'package:place_app/models/place.dart';
import 'package:place_app/screens/place_detail.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({
    super.key,
    required this.places,
  });

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet!',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: FileImage(places[index].image),
            ),
            title: Text(
              places[index].title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              places[index].location.address,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PlaceDetailScreen(place: places[index]),
              ));
            },
          ),
        );
      },
    );
  }
}
