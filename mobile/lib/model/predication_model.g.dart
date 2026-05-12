// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predication_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PredicationModelSchema = Schema(
  name: r'PredicationModel',
  id: 7694962462721032921,
  properties: {
    r'awayName': PropertySchema(
      id: 0,
      name: r'awayName',
      type: IsarType.string,
    ),
    r'awayScore': PropertySchema(
      id: 1,
      name: r'awayScore',
      type: IsarType.long,
    ),
    r'awayScorePrediction': PropertySchema(
      id: 2,
      name: r'awayScorePrediction',
      type: IsarType.long,
    ),
    r'awayTeamAbbreviation': PropertySchema(
      id: 3,
      name: r'awayTeamAbbreviation',
      type: IsarType.string,
    ),
    r'homeName': PropertySchema(
      id: 4,
      name: r'homeName',
      type: IsarType.string,
    ),
    r'homeScore': PropertySchema(
      id: 5,
      name: r'homeScore',
      type: IsarType.long,
    ),
    r'homeScorePrediction': PropertySchema(
      id: 6,
      name: r'homeScorePrediction',
      type: IsarType.long,
    ),
    r'homeTeamAbbreviation': PropertySchema(
      id: 7,
      name: r'homeTeamAbbreviation',
      type: IsarType.string,
    ),
    r'matchDate': PropertySchema(
      id: 8,
      name: r'matchDate',
      type: IsarType.dateTime,
    ),
    r'matchStatus': PropertySchema(
      id: 9,
      name: r'matchStatus',
      type: IsarType.byte,
      enumMap: _PredicationModelmatchStatusEnumValueMap,
    ),
    r'resultGuess': PropertySchema(
      id: 10,
      name: r'resultGuess',
      type: IsarType.byte,
      enumMap: _PredicationModelresultGuessEnumValueMap,
    ),
    r'type': PropertySchema(
      id: 11,
      name: r'type',
      type: IsarType.byte,
      enumMap: _PredicationModeltypeEnumValueMap,
    )
  },
  estimateSize: _predicationModelEstimateSize,
  serialize: _predicationModelSerialize,
  deserialize: _predicationModelDeserialize,
  deserializeProp: _predicationModelDeserializeProp,
);

int _predicationModelEstimateSize(
  PredicationModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.awayName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.awayTeamAbbreviation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.homeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.homeTeamAbbreviation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _predicationModelSerialize(
  PredicationModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.awayName);
  writer.writeLong(offsets[1], object.awayScore);
  writer.writeLong(offsets[2], object.awayScorePrediction);
  writer.writeString(offsets[3], object.awayTeamAbbreviation);
  writer.writeString(offsets[4], object.homeName);
  writer.writeLong(offsets[5], object.homeScore);
  writer.writeLong(offsets[6], object.homeScorePrediction);
  writer.writeString(offsets[7], object.homeTeamAbbreviation);
  writer.writeDateTime(offsets[8], object.matchDate);
  writer.writeByte(offsets[9], object.matchStatus.index);
  writer.writeByte(offsets[10], object.resultGuess.index);
  writer.writeByte(offsets[11], object.type.index);
}

PredicationModel _predicationModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PredicationModel(
    awayName: reader.readStringOrNull(offsets[0]),
    awayScore: reader.readLongOrNull(offsets[1]),
    awayScorePrediction: reader.readLongOrNull(offsets[2]),
    awayTeamAbbreviation: reader.readStringOrNull(offsets[3]),
    homeName: reader.readStringOrNull(offsets[4]),
    homeScore: reader.readLongOrNull(offsets[5]),
    homeScorePrediction: reader.readLongOrNull(offsets[6]),
    homeTeamAbbreviation: reader.readStringOrNull(offsets[7]),
    matchDate: reader.readDateTimeOrNull(offsets[8]),
    matchStatus: _PredicationModelmatchStatusValueEnumMap[
            reader.readByteOrNull(offsets[9])] ??
        MatchStatus.upcoming,
    resultGuess: _PredicationModelresultGuessValueEnumMap[
            reader.readByteOrNull(offsets[10])] ??
        ResultGuessEnum.nulled,
    type:
        _PredicationModeltypeValueEnumMap[reader.readByteOrNull(offsets[11])] ??
            TypePredicationEnum.nulled,
  );
  return object;
}

P _predicationModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (_PredicationModelmatchStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          MatchStatus.upcoming) as P;
    case 10:
      return (_PredicationModelresultGuessValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ResultGuessEnum.nulled) as P;
    case 11:
      return (_PredicationModeltypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          TypePredicationEnum.nulled) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PredicationModelmatchStatusEnumValueMap = {
  'upcoming': 0,
  'live': 1,
  'finished': 2,
};
const _PredicationModelmatchStatusValueEnumMap = {
  0: MatchStatus.upcoming,
  1: MatchStatus.live,
  2: MatchStatus.finished,
};
const _PredicationModelresultGuessEnumValueMap = {
  'homeWin': 0,
  'draw': 1,
  'awayWin': 2,
  'nulled': 3,
};
const _PredicationModelresultGuessValueEnumMap = {
  0: ResultGuessEnum.homeWin,
  1: ResultGuessEnum.draw,
  2: ResultGuessEnum.awayWin,
  3: ResultGuessEnum.nulled,
};
const _PredicationModeltypeEnumValueMap = {
  'exact': 0,
  'result': 1,
  'nulled': 2,
};
const _PredicationModeltypeValueEnumMap = {
  0: TypePredicationEnum.exact,
  1: TypePredicationEnum.result,
  2: TypePredicationEnum.nulled,
};

extension PredicationModelQueryFilter
    on QueryBuilder<PredicationModel, PredicationModel, QFilterCondition> {
  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'awayName',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'awayName',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'awayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'awayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'awayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'awayName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'awayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'awayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'awayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'awayName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'awayName',
        value: '',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'awayName',
        value: '',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'awayScore',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'awayScore',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayScoreEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'awayScore',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayScoreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'awayScore',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayScoreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'awayScore',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayScoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'awayScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayScorePredictionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'awayScorePrediction',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayScorePredictionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'awayScorePrediction',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayScorePredictionEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'awayScorePrediction',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayScorePredictionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'awayScorePrediction',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayScorePredictionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'awayScorePrediction',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayScorePredictionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'awayScorePrediction',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayTeamAbbreviationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'awayTeamAbbreviation',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayTeamAbbreviationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'awayTeamAbbreviation',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayTeamAbbreviationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'awayTeamAbbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayTeamAbbreviationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'awayTeamAbbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayTeamAbbreviationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'awayTeamAbbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayTeamAbbreviationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'awayTeamAbbreviation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayTeamAbbreviationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'awayTeamAbbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayTeamAbbreviationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'awayTeamAbbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayTeamAbbreviationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'awayTeamAbbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayTeamAbbreviationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'awayTeamAbbreviation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayTeamAbbreviationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'awayTeamAbbreviation',
        value: '',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      awayTeamAbbreviationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'awayTeamAbbreviation',
        value: '',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'homeName',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'homeName',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'homeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'homeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'homeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'homeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'homeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'homeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'homeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'homeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'homeName',
        value: '',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'homeName',
        value: '',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'homeScore',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'homeScore',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeScoreEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'homeScore',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeScoreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'homeScore',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeScoreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'homeScore',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeScoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'homeScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeScorePredictionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'homeScorePrediction',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeScorePredictionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'homeScorePrediction',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeScorePredictionEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'homeScorePrediction',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeScorePredictionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'homeScorePrediction',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeScorePredictionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'homeScorePrediction',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeScorePredictionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'homeScorePrediction',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeTeamAbbreviationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'homeTeamAbbreviation',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeTeamAbbreviationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'homeTeamAbbreviation',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeTeamAbbreviationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'homeTeamAbbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeTeamAbbreviationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'homeTeamAbbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeTeamAbbreviationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'homeTeamAbbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeTeamAbbreviationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'homeTeamAbbreviation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeTeamAbbreviationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'homeTeamAbbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeTeamAbbreviationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'homeTeamAbbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeTeamAbbreviationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'homeTeamAbbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeTeamAbbreviationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'homeTeamAbbreviation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeTeamAbbreviationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'homeTeamAbbreviation',
        value: '',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      homeTeamAbbreviationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'homeTeamAbbreviation',
        value: '',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      matchDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'matchDate',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      matchDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'matchDate',
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      matchDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      matchDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matchDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      matchDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matchDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      matchDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matchDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      matchStatusEqualTo(MatchStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      matchStatusGreaterThan(
    MatchStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matchStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      matchStatusLessThan(
    MatchStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matchStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      matchStatusBetween(
    MatchStatus lower,
    MatchStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matchStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      resultGuessEqualTo(ResultGuessEnum value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resultGuess',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      resultGuessGreaterThan(
    ResultGuessEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resultGuess',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      resultGuessLessThan(
    ResultGuessEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resultGuess',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      resultGuessBetween(
    ResultGuessEnum lower,
    ResultGuessEnum upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resultGuess',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      typeEqualTo(TypePredicationEnum value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      typeGreaterThan(
    TypePredicationEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      typeLessThan(
    TypePredicationEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<PredicationModel, PredicationModel, QAfterFilterCondition>
      typeBetween(
    TypePredicationEnum lower,
    TypePredicationEnum upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PredicationModelQueryObject
    on QueryBuilder<PredicationModel, PredicationModel, QFilterCondition> {}
