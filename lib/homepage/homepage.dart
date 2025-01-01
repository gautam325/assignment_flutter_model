import 'package:assignment/homepage/add_data/add_data.dart';
import 'package:assignment/homepage/state_management/state_management.dart';
import 'package:assignment/homepage/theme_page/theme_page.dart';
import 'package:assignment/homepage/update_data/update_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hiveDataList = ref.watch(hiveDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'theme') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThemePage(),
                    ));
              }
            },
            itemBuilder: (context) {
              return [PopupMenuItem(value: "theme", child: Text("Setting"))];
            },
          )
        ],
      ),
      body: hiveDataList.isEmpty
          ? Center(
              child: Text(
              "Not Found",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ))
          : ListView.builder(
              itemCount: hiveDataList.length,
              itemBuilder: (context, index) {
                final data = hiveDataList[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      title: Text(
                        data.title,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                      ),
                      subtitle: Text(
                        data.dec,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: SizedBox(
                        width: MediaQuery.of(context).size.width * .15,
                        child: Row(
                          children: [
                            InkWell(
                              child: Icon(Icons.edit),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateData(index: index, data: data),
                                    ));
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: const Icon(Icons.delete),
                              onTap: () {
                                ref
                                    .read(hiveDataProvider.notifier)
                                    .deleteData(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddData(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
