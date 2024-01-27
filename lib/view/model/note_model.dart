import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel /*extends HiveObject*/ {
  @HiveField(0)
  late String id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? subTitle;
  @HiveField(3)
  String? date;
  @HiveField(4)
  bool? favorite;
  @HiveField(5)
  bool? deleted;

  NoteModel(
      {required this.id,
      this.title,
      this.subTitle,
      this.date,
      this.favorite,
      this.deleted});

  // NoteModel.fromJson(Map<String, dynamic> json) {
  //   title = json['title'];
  //   subTitle = json['subTitle'];
  //   date = json['date'];
  //   favorite = json['favorite'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['title'] = this.title;
  //   data['subTitle'] = this.subTitle;
  //   data['date'] = this.date;
  //   data['favorite'] = this.favorite;
  //   return data;
  // }
}
