import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:place_app/models/place.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super([]);

  void addPlace(String title) {
    final newPlace = Place(title: title);
    state = [...state, newPlace];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
