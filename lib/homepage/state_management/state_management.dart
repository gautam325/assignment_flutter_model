import 'package:assignment/homepage/model/hive_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final hiveDataProvider = StateNotifierProvider<HiveDataNotifier,List<HiveData>>((ref) => HiveDataNotifier(),);

class HiveDataNotifier extends StateNotifier<List<HiveData>> {
  HiveDataNotifier() : super([]) {
    _loadData();
  }

  void _loadData() {
    final box = Hive.box<HiveData>("openBox");
    state = box.values.toList();
  }

  void addData(String title, String dec) {
    final box = Hive.box<HiveData>("openBox");
    final newData = HiveData(id: box.length, title: title, dec: dec);
    box.add(newData);
    _loadData();
  }

  void updateData(int index, String title, String dec) {
    final box = Hive.box<HiveData>("openBox");
    final updatedData = HiveData(id: index, title: title, dec: dec);
    box.putAt(index, updatedData);
    _loadData();
  }

  void deleteData(int index) {
    final box = Hive.box<HiveData>("openBox");
    box.deleteAt(index);
    _loadData();
  }
}