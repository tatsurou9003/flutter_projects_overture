import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:place_app/models/place.dart';
import 'dart:io';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super([]);

  void addPlace(String title, File image) {
    final newPlace = Place(
      title: title,
      image: image,
    );
    state = [...state, newPlace];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
