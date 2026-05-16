// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'betting_group_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBettingGroupModelCollection on Isar {
  IsarCollection<BettingGroupModel> get bettingGroupModels => this.collection();
}

const BettingGroupModelSchema = CollectionSchema(
  name: r'BettingGroupModel',
  id: 3584857403832336229,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.string,
    ),
    r'members': PropertySchema(
      id: 1,
      name: r'members',
      type: IsarType.objectList,
      target: r'ParticipantModel',
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'owner': PropertySchema(
      id: 3,
      name: r'owner',
      type: IsarType.object,
      target: r'ParticipantModel',
    ),
    r'predications': PropertySchema(
      id: 4,
      name: r'predications',
      type: IsarType.objectList,
      target: r'PredicationModel',
    )
  },
  estimateSize: _bettingGroupModelEstimateSize,
  serialize: _bettingGroupModelSerialize,
  deserialize: _bettingGroupModelDeserialize,
  deserializeProp: _bettingGroupModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ParticipantModel': ParticipantModelSchema,
    r'PredicationModel': PredicationModelSchema
  },
  getId: _bettingGroupModelGetId,
  getLinks: _bettingGroupModelGetLinks,
  attach: _bettingGroupModelAttach,
  version: '3.1.0+1',
);

int _bettingGroupModelEstimateSize(
  BettingGroupModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.members.length * 3;
  {
    final offsets = allOffsets[ParticipantModel]!;
    for (var i = 0; i < object.members.length; i++) {
      final value = object.members[i];
      bytesCount +=
          ParticipantModelSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 +
      ParticipantModelSchema.estimateSize(
          object.owner, allOffsets[ParticipantModel]!, allOffsets);
  bytesCount += 3 + object.predications.length * 3;
  {
    final offsets = allOffsets[PredicationModel]!;
    for (var i = 0; i < object.predications.length; i++) {
      final value = object.predications[i];
      bytesCount +=
          PredicationModelSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _bettingGroupModelSerialize(
  BettingGroupModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeObjectList<ParticipantModel>(
    offsets[1],
    allOffsets,
    ParticipantModelSchema.serialize,
    object.members,
  );
  writer.writeString(offsets[2], object.name);
  writer.writeObject<ParticipantModel>(
    offsets[3],
    allOffsets,
    ParticipantModelSchema.serialize,
    object.owner,
  );
  writer.writeObjectList<PredicationModel>(
    offsets[4],
    allOffsets,
    PredicationModelSchema.serialize,
    object.predications,
  );
}

BettingGroupModel _bettingGroupModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BettingGroupModel(
    code: reader.readString(offsets[0]),
    id: id,
    members: reader.readObjectList<ParticipantModel>(
          offsets[1],
          ParticipantModelSchema.deserialize,
          allOffsets,
          ParticipantModel(),
        ) ??
        const [],
    name: reader.readString(offsets[2]),
    owner: reader.readObjectOrNull<ParticipantModel>(
          offsets[3],
          ParticipantModelSchema.deserialize,
          allOffsets,
        ) ??
        ParticipantModel(),
    predications: reader.readObjectList<PredicationModel>(
          offsets[4],
          PredicationModelSchema.deserialize,
          allOffsets,
          PredicationModel(),
        ) ??
        const [],
  );
  return object;
}

P _bettingGroupModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectList<ParticipantModel>(
            offset,
            ParticipantModelSchema.deserialize,
            allOffsets,
            ParticipantModel(),
          ) ??
          const []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<ParticipantModel>(
            offset,
            ParticipantModelSchema.deserialize,
            allOffsets,
          ) ??
          ParticipantModel()) as P;
    case 4:
      return (reader.readObjectList<PredicationModel>(
            offset,
            PredicationModelSchema.deserialize,
            allOffsets,
            PredicationModel(),
          ) ??
          const []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bettingGroupModelGetId(BettingGroupModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bettingGroupModelGetLinks(
    BettingGroupModel object) {
  return [];
}

void _bettingGroupModelAttach(
    IsarCollection<dynamic> col, Id id, BettingGroupModel object) {
  object.id = id;
}

extension BettingGroupModelQueryWhereSort
    on QueryBuilder<BettingGroupModel, BettingGroupModel, QWhere> {
  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BettingGroupModelQueryWhere
    on QueryBuilder<BettingGroupModel, BettingGroupModel, QWhereClause> {
  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BettingGroupModelQueryFilter
    on QueryBuilder<BettingGroupModel, BettingGroupModel, QFilterCondition> {
  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      membersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'members',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      membersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'members',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      membersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'members',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      membersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'members',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      membersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'members',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      membersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'members',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      predicationsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'predications',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      predicationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'predications',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      predicationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'predications',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      predicationsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'predications',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      predicationsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'predications',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      predicationsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'predications',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension BettingGroupModelQueryObject
    on QueryBuilder<BettingGroupModel, BettingGroupModel, QFilterCondition> {
  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      membersElement(FilterQuery<ParticipantModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'members');
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      owner(FilterQuery<ParticipantModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'owner');
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterFilterCondition>
      predicationsElement(FilterQuery<PredicationModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'predications');
    });
  }
}

extension BettingGroupModelQueryLinks
    on QueryBuilder<BettingGroupModel, BettingGroupModel, QFilterCondition> {}

extension BettingGroupModelQuerySortBy
    on QueryBuilder<BettingGroupModel, BettingGroupModel, QSortBy> {
  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterSortBy>
      sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterSortBy>
      sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension BettingGroupModelQuerySortThenBy
    on QueryBuilder<BettingGroupModel, BettingGroupModel, QSortThenBy> {
  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterSortBy>
      thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterSortBy>
      thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension BettingGroupModelQueryWhereDistinct
    on QueryBuilder<BettingGroupModel, BettingGroupModel, QDistinct> {
  QueryBuilder<BettingGroupModel, BettingGroupModel, QDistinct> distinctByCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BettingGroupModel, BettingGroupModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension BettingGroupModelQueryProperty
    on QueryBuilder<BettingGroupModel, BettingGroupModel, QQueryProperty> {
  QueryBuilder<BettingGroupModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BettingGroupModel, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<BettingGroupModel, List<ParticipantModel>, QQueryOperations>
      membersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'members');
    });
  }

  QueryBuilder<BettingGroupModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<BettingGroupModel, ParticipantModel, QQueryOperations>
      ownerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'owner');
    });
  }

  QueryBuilder<BettingGroupModel, List<PredicationModel>, QQueryOperations>
      predicationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'predications');
    });
  }
}
