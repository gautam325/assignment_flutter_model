import 'package:hive/hive.dart';
part 'hive_data.g.dart';
@HiveType(typeId:0)
class HiveData{
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String dec;

  HiveData({required this.id,required this.title,required this.dec});
}