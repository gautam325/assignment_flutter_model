import 'package:assignment/homepage/state_management/state_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddData extends ConsumerWidget {
  const AddData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String title = '';
    String dec = '';

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
        actions: [
          IconButton(
              onPressed: () {
                if (title.isNotEmpty && dec.isNotEmpty) {
                  ref.read(hiveDataProvider.notifier).addData(title, dec);
                  Navigator.of(context).pop(); // Close the screen
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill in all fields')),
                  );
                }
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              onChanged: (value) {
                title = value;
              },
            ),
            SizedBox(height: 20),
            Text("Description"),
            Expanded(
              child: TextField(
                maxLines: 25,
                decoration: InputDecoration(border: InputBorder.none),
                onChanged: (value) {
                  dec = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
