import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:place_app/providers/user_places.dart';
import 'package:place_app/widgets/image_input.dart';
import 'dart:io';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  void _savePlace() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty || _selectedImage == null) {
      return;
    }
    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredTitle, _selectedImage!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add a new place'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              const SizedBox(height: 24),
              ImageInput(
                onPickImage: (image) {
                  _selectedImage = image;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _savePlace,
                child: const Text('Add place'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
