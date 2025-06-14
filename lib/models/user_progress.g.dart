// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserProgressCollection on Isar {
  IsarCollection<UserProgress> get userProgress => this.collection();
}

const UserProgressSchema = CollectionSchema(
  name: r'UserProgress',
  id: 518958300452706037,
  properties: {
    r'activeCourseId': PropertySchema(
      id: 0,
      name: r'activeCourseId',
      type: IsarType.long,
    ),
    r'hearts': PropertySchema(
      id: 1,
      name: r'hearts',
      type: IsarType.long,
    ),
    r'points': PropertySchema(
      id: 2,
      name: r'points',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(
      id: 3,
      name: r'userId',
      type: IsarType.string,
    ),
    r'userImageSrc': PropertySchema(
      id: 4,
      name: r'userImageSrc',
      type: IsarType.string,
    ),
    r'userName': PropertySchema(
      id: 5,
      name: r'userName',
      type: IsarType.string,
    )
  },
  estimateSize: _userProgressEstimateSize,
  serialize: _userProgressSerialize,
  deserialize: _userProgressDeserialize,
  deserializeProp: _userProgressDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'activeCourse': LinkSchema(
      id: -6413287315109926150,
      name: r'activeCourse',
      target: r'Course',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _userProgressGetId,
  getLinks: _userProgressGetLinks,
  attach: _userProgressAttach,
  version: '3.1.0+1',
);

int _userProgressEstimateSize(
  UserProgress object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.userId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userImageSrc;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userProgressSerialize(
  UserProgress object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.activeCourseId);
  writer.writeLong(offsets[1], object.hearts);
  writer.writeLong(offsets[2], object.points);
  writer.writeString(offsets[3], object.userId);
  writer.writeString(offsets[4], object.userImageSrc);
  writer.writeString(offsets[5], object.userName);
}

UserProgress _userProgressDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserProgress();
  object.activeCourseId = reader.readLongOrNull(offsets[0]);
  object.hearts = reader.readLongOrNull(offsets[1]);
  object.id = id;
  object.points = reader.readLongOrNull(offsets[2]);
  object.userId = reader.readStringOrNull(offsets[3]);
  object.userImageSrc = reader.readStringOrNull(offsets[4]);
  object.userName = reader.readStringOrNull(offsets[5]);
  return object;
}

P _userProgressDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
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

Id _userProgressGetId(UserProgress object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userProgressGetLinks(UserProgress object) {
  return [object.activeCourse];
}

void _userProgressAttach(
    IsarCollection<dynamic> col, Id id, UserProgress object) {
  object.id = id;
  object.activeCourse
      .attach(col, col.isar.collection<Course>(), r'activeCourse', id);
}

extension UserProgressByIndex on IsarCollection<UserProgress> {
  Future<UserProgress?> getByUserId(String? userId) {
    return getByIndex(r'userId', [userId]);
  }

  UserProgress? getByUserIdSync(String? userId) {
    return getByIndexSync(r'userId', [userId]);
  }

  Future<bool> deleteByUserId(String? userId) {
    return deleteByIndex(r'userId', [userId]);
  }

  bool deleteByUserIdSync(String? userId) {
    return deleteByIndexSync(r'userId', [userId]);
  }

  Future<List<UserProgress?>> getAllByUserId(List<String?> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'userId', values);
  }

  List<UserProgress?> getAllByUserIdSync(List<String?> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'userId', values);
  }

  Future<int> deleteAllByUserId(List<String?> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'userId', values);
  }

  int deleteAllByUserIdSync(List<String?> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'userId', values);
  }

  Future<Id> putByUserId(UserProgress object) {
    return putByIndex(r'userId', object);
  }

  Id putByUserIdSync(UserProgress object, {bool saveLinks = true}) {
    return putByIndexSync(r'userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserId(List<UserProgress> objects) {
    return putAllByIndex(r'userId', objects);
  }

  List<Id> putAllByUserIdSync(List<UserProgress> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
  }
}

extension UserProgressQueryWhereSort
    on QueryBuilder<UserProgress, UserProgress, QWhere> {
  QueryBuilder<UserProgress, UserProgress, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserProgressQueryWhere
    on QueryBuilder<UserProgress, UserProgress, QWhereClause> {
  QueryBuilder<UserProgress, UserProgress, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<UserProgress, UserProgress, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterWhereClause> idBetween(
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

  QueryBuilder<UserProgress, UserProgress, QAfterWhereClause> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [null],
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterWhereClause>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterWhereClause> userIdEqualTo(
      String? userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterWhereClause> userIdNotEqualTo(
      String? userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension UserProgressQueryFilter
    on QueryBuilder<UserProgress, UserProgress, QFilterCondition> {
  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      activeCourseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'activeCourseId',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      activeCourseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'activeCourseId',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      activeCourseIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeCourseId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      activeCourseIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activeCourseId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      activeCourseIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activeCourseId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      activeCourseIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activeCourseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      heartsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hearts',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      heartsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hearts',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition> heartsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hearts',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      heartsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hearts',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      heartsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hearts',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition> heartsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hearts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      pointsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'points',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      pointsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'points',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition> pointsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'points',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      pointsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'points',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      pointsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'points',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition> pointsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'points',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition> userIdEqualTo(
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

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
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

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
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

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
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

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
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

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition> userIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userImageSrcIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userImageSrc',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userImageSrcIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userImageSrc',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userImageSrcEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userImageSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userImageSrcGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userImageSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userImageSrcLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userImageSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userImageSrcBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userImageSrc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userImageSrcStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userImageSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userImageSrcEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userImageSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userImageSrcContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userImageSrc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userImageSrcMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userImageSrc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userImageSrcIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userImageSrc',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userImageSrcIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userImageSrc',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userName',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userName',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      userNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userName',
        value: '',
      ));
    });
  }
}

extension UserProgressQueryObject
    on QueryBuilder<UserProgress, UserProgress, QFilterCondition> {}

extension UserProgressQueryLinks
    on QueryBuilder<UserProgress, UserProgress, QFilterCondition> {
  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition> activeCourse(
      FilterQuery<Course> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'activeCourse');
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterFilterCondition>
      activeCourseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'activeCourse', 0, true, 0, true);
    });
  }
}

extension UserProgressQuerySortBy
    on QueryBuilder<UserProgress, UserProgress, QSortBy> {
  QueryBuilder<UserProgress, UserProgress, QAfterSortBy>
      sortByActiveCourseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeCourseId', Sort.asc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy>
      sortByActiveCourseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeCourseId', Sort.desc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> sortByHearts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearts', Sort.asc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> sortByHeartsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearts', Sort.desc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> sortByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.asc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> sortByPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.desc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> sortByUserImageSrc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userImageSrc', Sort.asc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy>
      sortByUserImageSrcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userImageSrc', Sort.desc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> sortByUserName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.asc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> sortByUserNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.desc);
    });
  }
}

extension UserProgressQuerySortThenBy
    on QueryBuilder<UserProgress, UserProgress, QSortThenBy> {
  QueryBuilder<UserProgress, UserProgress, QAfterSortBy>
      thenByActiveCourseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeCourseId', Sort.asc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy>
      thenByActiveCourseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeCourseId', Sort.desc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> thenByHearts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearts', Sort.asc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> thenByHeartsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearts', Sort.desc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> thenByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.asc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> thenByPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.desc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> thenByUserImageSrc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userImageSrc', Sort.asc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy>
      thenByUserImageSrcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userImageSrc', Sort.desc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> thenByUserName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.asc);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QAfterSortBy> thenByUserNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.desc);
    });
  }
}

extension UserProgressQueryWhereDistinct
    on QueryBuilder<UserProgress, UserProgress, QDistinct> {
  QueryBuilder<UserProgress, UserProgress, QDistinct>
      distinctByActiveCourseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeCourseId');
    });
  }

  QueryBuilder<UserProgress, UserProgress, QDistinct> distinctByHearts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hearts');
    });
  }

  QueryBuilder<UserProgress, UserProgress, QDistinct> distinctByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'points');
    });
  }

  QueryBuilder<UserProgress, UserProgress, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QDistinct> distinctByUserImageSrc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userImageSrc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProgress, UserProgress, QDistinct> distinctByUserName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userName', caseSensitive: caseSensitive);
    });
  }
}

extension UserProgressQueryProperty
    on QueryBuilder<UserProgress, UserProgress, QQueryProperty> {
  QueryBuilder<UserProgress, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserProgress, int?, QQueryOperations> activeCourseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeCourseId');
    });
  }

  QueryBuilder<UserProgress, int?, QQueryOperations> heartsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hearts');
    });
  }

  QueryBuilder<UserProgress, int?, QQueryOperations> pointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'points');
    });
  }

  QueryBuilder<UserProgress, String?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<UserProgress, String?, QQueryOperations> userImageSrcProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userImageSrc');
    });
  }

  QueryBuilder<UserProgress, String?, QQueryOperations> userNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userName');
    });
  }
}
