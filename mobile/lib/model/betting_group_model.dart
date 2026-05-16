import 'package:isar/isar.dart';
import 'package:mobile/model/participant_model.dart';
import 'package:mobile/model/predication_model.dart';

part 'betting_group_model.g.dart';

@collection
class BettingGroupModel {
  Id id;
  String name;
  String code;
  ParticipantModel owner;
  List<ParticipantModel> members;
  List<PredicationModel> predications;

  BettingGroupModel({
    required this.id,
    required this.name,
    required this.code,
    required this.owner,
    this.members = const [],
    this.predications = const [],
  });
}
