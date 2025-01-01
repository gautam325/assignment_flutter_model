import 'package:assignment/homepage/state_management/state_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/hive_data.dart';

class UpdateData extends ConsumerWidget {
  final int index;
  final HiveData data;
  const UpdateData({super.key, required this.index, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController(text: data.title);
    final descriptionController = TextEditingController(text: data.dec);

    return Scaffold(
      appBar: AppBar(
        title: Text("Update"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              data.title = titleController.text;
              data.dec = descriptionController.text;
              ref.read(hiveDataProvider.notifier).updateData(index, titleController.text, descriptionController.text);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Expanded(
              child: TextField(
                controller: descriptionController,
                maxLines: 24,
                decoration: InputDecoration(
                    labelText: 'Description', border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
