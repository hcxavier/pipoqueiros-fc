import 'package:isar/isar.dart';

part 'participant_model.g.dart';

@embedded
class ParticipantModel {
  String? name;
  int? score;
  String? imageUrl;

  ParticipantModel({this.name, this.score, this.imageUrl});
}
