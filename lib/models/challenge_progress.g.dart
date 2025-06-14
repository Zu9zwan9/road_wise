// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_progress.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChallengeProgressCollection on Isar {
  IsarCollection<ChallengeProgress> get challengeProgress => this.collection();
}

const ChallengeProgressSchema = CollectionSchema(
  name: r'ChallengeProgress',
  id: 8455457793909078700,
  properties: {
    r'challengeId': PropertySchema(
      id: 0,
      name: r'challengeId',
      type: IsarType.long,
    ),
    r'completed': PropertySchema(
      id: 1,
      name: r'completed',
      type: IsarType.bool,
    ),
    r'serial': PropertySchema(
      id: 2,
      name: r'serial',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 3,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _challengeProgressEstimateSize,
  serialize: _challengeProgressSerialize,
  deserialize: _challengeProgressDeserialize,
  deserializeProp: _challengeProgressDeserializeProp,
  idName: r'id',
  indexes: {
    r'serial': IndexSchema(
      id: 731055148763487417,
      name: r'serial',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'serial',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'challenge': LinkSchema(
      id: 43704985546883482,
      name: r'challenge',
      target: r'Challenge',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _challengeProgressGetId,
  getLinks: _challengeProgressGetLinks,
  attach: _challengeProgressAttach,
  version: '3.1.0+1',
);

int _challengeProgressEstimateSize(
  ChallengeProgress object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.serial;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _challengeProgressSerialize(
  ChallengeProgress object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.challengeId);
  writer.writeBool(offsets[1], object.completed);
  writer.writeString(offsets[2], object.serial);
  writer.writeString(offsets[3], object.userId);
}

ChallengeProgress _challengeProgressDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChallengeProgress();
  object.challengeId = reader.readLongOrNull(offsets[0]);
  object.completed = reader.readBoolOrNull(offsets[1]);
  object.id = id;
  object.serial = reader.readStringOrNull(offsets[2]);
  object.userId = reader.readStringOrNull(offsets[3]);
  return object;
}

P _challengeProgressDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _challengeProgressGetId(ChallengeProgress object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _challengeProgressGetLinks(
    ChallengeProgress object) {
  return [object.challenge];
}

void _challengeProgressAttach(
    IsarCollection<dynamic> col, Id id, ChallengeProgress object) {
  object.id = id;
  object.challenge
      .attach(col, col.isar.collection<Challenge>(), r'challenge', id);
}

extension ChallengeProgressByIndex on IsarCollection<ChallengeProgress> {
  Future<ChallengeProgress?> getBySerial(String? serial) {
    return getByIndex(r'serial', [serial]);
  }

  ChallengeProgress? getBySerialSync(String? serial) {
    return getByIndexSync(r'serial', [serial]);
  }

  Future<bool> deleteBySerial(String? serial) {
    return deleteByIndex(r'serial', [serial]);
  }

  bool deleteBySerialSync(String? serial) {
    return deleteByIndexSync(r'serial', [serial]);
  }

  Future<List<ChallengeProgress?>> getAllBySerial(List<String?> serialValues) {
    final values = serialValues.map((e) => [e]).toList();
    return getAllByIndex(r'serial', values);
  }

  List<ChallengeProgress?> getAllBySerialSync(List<String?> serialValues) {
    final values = serialValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'serial', values);
  }

  Future<int> deleteAllBySerial(List<String?> serialValues) {
    final values = serialValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'serial', values);
  }

  int deleteAllBySerialSync(List<String?> serialValues) {
    final values = serialValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'serial', values);
  }

  Future<Id> putBySerial(ChallengeProgress object) {
    return putByIndex(r'serial', object);
  }

  Id putBySerialSync(ChallengeProgress object, {bool saveLinks = true}) {
    return putByIndexSync(r'serial', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySerial(List<ChallengeProgress> objects) {
    return putAllByIndex(r'serial', objects);
  }

  List<Id> putAllBySerialSync(List<ChallengeProgress> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'serial', objects, saveLinks: saveLinks);
  }
}

extension ChallengeProgressQueryWhereSort
    on QueryBuilder<ChallengeProgress, ChallengeProgress, QWhere> {
  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChallengeProgressQueryWhere
    on QueryBuilder<ChallengeProgress, ChallengeProgress, QWhereClause> {
  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterWhereClause>
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

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterWhereClause>
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

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterWhereClause>
      serialIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serial',
        value: [null],
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterWhereClause>
      serialIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'serial',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterWhereClause>
      serialEqualTo(String? serial) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serial',
        value: [serial],
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterWhereClause>
      serialNotEqualTo(String? serial) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serial',
              lower: [],
              upper: [serial],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serial',
              lower: [serial],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serial',
              lower: [serial],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serial',
              lower: [],
              upper: [serial],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ChallengeProgressQueryFilter
    on QueryBuilder<ChallengeProgress, ChallengeProgress, QFilterCondition> {
  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      challengeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'challengeId',
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      challengeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'challengeId',
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      challengeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'challengeId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      challengeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'challengeId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      challengeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'challengeId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      challengeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'challengeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      completedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completed',
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      completedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completed',
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      completedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completed',
        value: value,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
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

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
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

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
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

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      serialIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serial',
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      serialIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serial',
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      serialEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      serialGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      serialLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      serialBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serial',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      serialStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      serialEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      serialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      serialMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      serialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serial',
        value: '',
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      serialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serial',
        value: '',
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      userIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      userIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      userIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      userIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension ChallengeProgressQueryObject
    on QueryBuilder<ChallengeProgress, ChallengeProgress, QFilterCondition> {}

extension ChallengeProgressQueryLinks
    on QueryBuilder<ChallengeProgress, ChallengeProgress, QFilterCondition> {
  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      challenge(FilterQuery<Challenge> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'challenge');
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterFilterCondition>
      challengeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'challenge', 0, true, 0, true);
    });
  }
}

extension ChallengeProgressQuerySortBy
    on QueryBuilder<ChallengeProgress, ChallengeProgress, QSortBy> {
  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      sortByChallengeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'challengeId', Sort.asc);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      sortByChallengeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'challengeId', Sort.desc);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      sortByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.asc);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      sortByCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.desc);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      sortBySerial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.asc);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      sortBySerialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.desc);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension ChallengeProgressQuerySortThenBy
    on QueryBuilder<ChallengeProgress, ChallengeProgress, QSortThenBy> {
  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      thenByChallengeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'challengeId', Sort.asc);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      thenByChallengeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'challengeId', Sort.desc);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      thenByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.asc);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      thenByCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.desc);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      thenBySerial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.asc);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      thenBySerialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.desc);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension ChallengeProgressQueryWhereDistinct
    on QueryBuilder<ChallengeProgress, ChallengeProgress, QDistinct> {
  QueryBuilder<ChallengeProgress, ChallengeProgress, QDistinct>
      distinctByChallengeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'challengeId');
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QDistinct>
      distinctByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completed');
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QDistinct>
      distinctBySerial({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serial', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChallengeProgress, ChallengeProgress, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension ChallengeProgressQueryProperty
    on QueryBuilder<ChallengeProgress, ChallengeProgress, QQueryProperty> {
  QueryBuilder<ChallengeProgress, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChallengeProgress, int?, QQueryOperations>
      challengeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'challengeId');
    });
  }

  QueryBuilder<ChallengeProgress, bool?, QQueryOperations> completedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completed');
    });
  }

  QueryBuilder<ChallengeProgress, String?, QQueryOperations> serialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serial');
    });
  }

  QueryBuilder<ChallengeProgress, String?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
