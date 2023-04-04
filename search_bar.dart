import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchBarDemo(),
    );
  }
}

class SearchBarDemo extends StatefulWidget {
  @override
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  List<String> _items = [    'apple',    'banana',    'cherry',    'date',    'elderberry',    'fig',    'grape',    'kiwi',    'lemon',    'mango',    'nectarine',    'orange',    'pear',    'quince',    'raspberry',    'strawberry',    'tangerine',    'ugli fruit',    'watermelon'  ];

  List<String> _filteredItems = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredItems.addAll(_items);
  }

  void _filterItems(String query) {
    _filteredItems.clear();
    if (query.isNotEmpty) {
      _items.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          _filteredItems.add(item);
        }
      });
    } else {
      _filteredItems.addAll(_items);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
          ),
          onChanged: (value) {
            _filterItems(value);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_filteredItems[index]),
          );
        },
      ),
    );
  }
}