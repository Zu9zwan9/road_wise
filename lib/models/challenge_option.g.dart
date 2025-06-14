// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_option.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChallengeOptionCollection on Isar {
  IsarCollection<ChallengeOption> get challengeOptions => this.collection();
}

const ChallengeOptionSchema = CollectionSchema(
  name: r'ChallengeOption',
  id: -1635537355990930336,
  properties: {
    r'audioSrc': PropertySchema(
      id: 0,
      name: r'audioSrc',
      type: IsarType.string,
    ),
    r'challengeId': PropertySchema(
      id: 1,
      name: r'challengeId',
      type: IsarType.long,
    ),
    r'correct': PropertySchema(
      id: 2,
      name: r'correct',
      type: IsarType.bool,
    ),
    r'imageSrc': PropertySchema(
      id: 3,
      name: r'imageSrc',
      type: IsarType.string,
    ),
    r'serial': PropertySchema(
      id: 4,
      name: r'serial',
      type: IsarType.string,
    ),
    r'text': PropertySchema(
      id: 5,
      name: r'text',
      type: IsarType.string,
    )
  },
  estimateSize: _challengeOptionEstimateSize,
  serialize: _challengeOptionSerialize,
  deserialize: _challengeOptionDeserialize,
  deserializeProp: _challengeOptionDeserializeProp,
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
      id: 3416271997732340331,
      name: r'challenge',
      target: r'Challenge',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _challengeOptionGetId,
  getLinks: _challengeOptionGetLinks,
  attach: _challengeOptionAttach,
  version: '3.1.0+1',
);

int _challengeOptionEstimateSize(
  ChallengeOption object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.audioSrc;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageSrc;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.serial;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.text;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _challengeOptionSerialize(
  ChallengeOption object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.audioSrc);
  writer.writeLong(offsets[1], object.challengeId);
  writer.writeBool(offsets[2], object.correct);
  writer.writeString(offsets[3], object.imageSrc);
  writer.writeString(offsets[4], object.serial);
  writer.writeString(offsets[5], object.text);
}

ChallengeOption _challengeOptionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChallengeOption();
  object.audioSrc = reader.readStringOrNull(offsets[0]);
  object.challengeId = reader.readLongOrNull(offsets[1]);
  object.correct = reader.readBoolOrNull(offsets[2]);
  object.id = id;
  object.imageSrc = reader.readStringOrNull(offsets[3]);
  object.serial = reader.readStringOrNull(offsets[4]);
  object.text = reader.readStringOrNull(offsets[5]);
  return object;
}

P _challengeOptionDeserializeProp<P>(
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
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _challengeOptionGetId(ChallengeOption object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _challengeOptionGetLinks(ChallengeOption object) {
  return [object.challenge];
}

void _challengeOptionAttach(
    IsarCollection<dynamic> col, Id id, ChallengeOption object) {
  object.id = id;
  object.challenge
      .attach(col, col.isar.collection<Challenge>(), r'challenge', id);
}

extension ChallengeOptionByIndex on IsarCollection<ChallengeOption> {
  Future<ChallengeOption?> getBySerial(String? serial) {
    return getByIndex(r'serial', [serial]);
  }

  ChallengeOption? getBySerialSync(String? serial) {
    return getByIndexSync(r'serial', [serial]);
  }

  Future<bool> deleteBySerial(String? serial) {
    return deleteByIndex(r'serial', [serial]);
  }

  bool deleteBySerialSync(String? serial) {
    return deleteByIndexSync(r'serial', [serial]);
  }

  Future<List<ChallengeOption?>> getAllBySerial(List<String?> serialValues) {
    final values = serialValues.map((e) => [e]).toList();
    return getAllByIndex(r'serial', values);
  }

  List<ChallengeOption?> getAllBySerialSync(List<String?> serialValues) {
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

  Future<Id> putBySerial(ChallengeOption object) {
    return putByIndex(r'serial', object);
  }

  Id putBySerialSync(ChallengeOption object, {bool saveLinks = true}) {
    return putByIndexSync(r'serial', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySerial(List<ChallengeOption> objects) {
    return putAllByIndex(r'serial', objects);
  }

  List<Id> putAllBySerialSync(List<ChallengeOption> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'serial', objects, saveLinks: saveLinks);
  }
}

extension ChallengeOptionQueryWhereSort
    on QueryBuilder<ChallengeOption, ChallengeOption, QWhere> {
  QueryBuilder<ChallengeOption, ChallengeOption, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChallengeOptionQueryWhere
    on QueryBuilder<ChallengeOption, ChallengeOption, QWhereClause> {
  QueryBuilder<ChallengeOption, ChallengeOption, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterWhereClause>
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

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterWhereClause> idBetween(
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

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterWhereClause>
      serialIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serial',
        value: [null],
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterWhereClause>
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

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterWhereClause>
      serialEqualTo(String? serial) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serial',
        value: [serial],
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterWhereClause>
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

extension ChallengeOptionQueryFilter
    on QueryBuilder<ChallengeOption, ChallengeOption, QFilterCondition> {
  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      audioSrcIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'audioSrc',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      audioSrcIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'audioSrc',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      audioSrcEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'audioSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      audioSrcGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'audioSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      audioSrcLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'audioSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      audioSrcBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'audioSrc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      audioSrcStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'audioSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      audioSrcEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'audioSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      audioSrcContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'audioSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      audioSrcMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'audioSrc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      audioSrcIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'audioSrc',
        value: '',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      audioSrcIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'audioSrc',
        value: '',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      challengeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'challengeId',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      challengeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'challengeId',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      challengeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'challengeId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
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

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
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

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
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

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      correctIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correct',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      correctIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correct',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      correctEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correct',
        value: value,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
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

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
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

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
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

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      imageSrcIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageSrc',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      imageSrcIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageSrc',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      imageSrcEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      imageSrcGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      imageSrcLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      imageSrcBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageSrc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      imageSrcStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      imageSrcEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      imageSrcContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      imageSrcMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageSrc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      imageSrcIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageSrc',
        value: '',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      imageSrcIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageSrc',
        value: '',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      serialIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serial',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      serialIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serial',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
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

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
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

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
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

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
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

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
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

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
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

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      serialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      serialMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      serialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serial',
        value: '',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      serialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serial',
        value: '',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      textIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      textIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      textEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      textGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      textLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      textBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      textMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }
}

extension ChallengeOptionQueryObject
    on QueryBuilder<ChallengeOption, ChallengeOption, QFilterCondition> {}

extension ChallengeOptionQueryLinks
    on QueryBuilder<ChallengeOption, ChallengeOption, QFilterCondition> {
  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      challenge(FilterQuery<Challenge> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'challenge');
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterFilterCondition>
      challengeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'challenge', 0, true, 0, true);
    });
  }
}

extension ChallengeOptionQuerySortBy
    on QueryBuilder<ChallengeOption, ChallengeOption, QSortBy> {
  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      sortByAudioSrc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioSrc', Sort.asc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      sortByAudioSrcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioSrc', Sort.desc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      sortByChallengeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'challengeId', Sort.asc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      sortByChallengeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'challengeId', Sort.desc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy> sortByCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.asc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      sortByCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.desc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      sortByImageSrc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageSrc', Sort.asc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      sortByImageSrcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageSrc', Sort.desc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy> sortBySerial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.asc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      sortBySerialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.desc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy> sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }
}

extension ChallengeOptionQuerySortThenBy
    on QueryBuilder<ChallengeOption, ChallengeOption, QSortThenBy> {
  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      thenByAudioSrc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioSrc', Sort.asc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      thenByAudioSrcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioSrc', Sort.desc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      thenByChallengeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'challengeId', Sort.asc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      thenByChallengeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'challengeId', Sort.desc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy> thenByCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.asc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      thenByCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.desc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      thenByImageSrc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageSrc', Sort.asc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      thenByImageSrcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageSrc', Sort.desc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy> thenBySerial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.asc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      thenBySerialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.desc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy> thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QAfterSortBy>
      thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }
}

extension ChallengeOptionQueryWhereDistinct
    on QueryBuilder<ChallengeOption, ChallengeOption, QDistinct> {
  QueryBuilder<ChallengeOption, ChallengeOption, QDistinct> distinctByAudioSrc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'audioSrc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QDistinct>
      distinctByChallengeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'challengeId');
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QDistinct>
      distinctByCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correct');
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QDistinct> distinctByImageSrc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageSrc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QDistinct> distinctBySerial(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serial', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChallengeOption, ChallengeOption, QDistinct> distinctByText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }
}

extension ChallengeOptionQueryProperty
    on QueryBuilder<ChallengeOption, ChallengeOption, QQueryProperty> {
  QueryBuilder<ChallengeOption, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChallengeOption, String?, QQueryOperations> audioSrcProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'audioSrc');
    });
  }

  QueryBuilder<ChallengeOption, int?, QQueryOperations> challengeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'challengeId');
    });
  }

  QueryBuilder<ChallengeOption, bool?, QQueryOperations> correctProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correct');
    });
  }

  QueryBuilder<ChallengeOption, String?, QQueryOperations> imageSrcProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageSrc');
    });
  }

  QueryBuilder<ChallengeOption, String?, QQueryOperations> serialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serial');
    });
  }

  QueryBuilder<ChallengeOption, String?, QQueryOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }
}
