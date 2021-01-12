import 'package:hive/hive.dart';

part 'states_checked_hivedb.g.dart';

@HiveType(typeId: 0)
class StatesCheck {
  @HiveField(0)
  String name;

  @HiveField(1)
  bool state;
  StatesCheck({this.name, this.state});
}
