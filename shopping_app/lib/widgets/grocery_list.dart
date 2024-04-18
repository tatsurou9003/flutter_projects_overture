import 'package:flutter/material.dart';
import 'package:shopping_app/models/grocery_item.dart';
import 'package:shopping_app/widgets/new_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shopping_app/data/categories.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  var isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() async {
    final url = Uri.https('flutter-rtdb-test-7beb4-default-rtdb.firebaseio.com',
        'shopping_list.json');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        setState(() {
          _error = 'Failed to load items';
        });
        return;
      }

      if (response.body == 'null') {
        setState(() {
          isLoading = false;
        });
        return;
      }

      final Map<String, dynamic> listData = json.decode(response.body);
      final List<GroceryItem> loadedItems = [];
      for (final item in listData.entries) {
        // postするデータにcolorがないため、categoriesから取り出す
        final category = categories.entries.firstWhere(
          (element) => element.value.name == item.value['category'],
        );
        loadedItems.add(GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category.value));
      }
      setState(() {
        _groceryItems = loadedItems;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        _error = 'Failed to load items';
      });
    }
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    final itemId = item.id;
    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https('flutter-rtdb-test-7beb4-default-rtdb.firebaseio.com',
        'shopping_list/$itemId.json');

    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      // Optional: Show error message
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No items yet!'),
    );

    if (isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: (ctx, index) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.6),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          ),
          onDismissed: (direction) {
            _removeItem(_groceryItems[index]);
          },
          key: ValueKey(_groceryItems[index].id),
          child: ListTile(
              title: Text(_groceryItems[index].name),
              leading: Container(
                width: 24,
                height: 24,
                color: _groceryItems[index].category.color,
              ),
              trailing: Text(
                _groceryItems[index].quantity.toString(),
              )),
        ),
        itemCount: _groceryItems.length,
      );
    }

    if (_error != null) {
      content = Center(
        child: Text(_error!),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Grocery'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: content,
    );
  }
}
