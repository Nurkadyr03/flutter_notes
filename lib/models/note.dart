import 'package:isar/isar.dart';
//this line is needed to generete file 
//the run : dart run build_runner build
part 'note.g.dart';
@Collection()
class Note{
  Id id=Isar.autoIncrement;
  late String text;
}