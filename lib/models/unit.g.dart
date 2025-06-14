// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUnitCollection on Isar {
  IsarCollection<Unit> get units => this.collection();
}

const UnitSchema = CollectionSchema(
  name: r'Unit',
  id: 5852079958688209740,
  properties: {
    r'courseId': PropertySchema(
      id: 0,
      name: r'courseId',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'order': PropertySchema(
      id: 2,
      name: r'order',
      type: IsarType.long,
    ),
    r'serial': PropertySchema(
      id: 3,
      name: r'serial',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 4,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _unitEstimateSize,
  serialize: _unitSerialize,
  deserialize: _unitDeserialize,
  deserializeProp: _unitDeserializeProp,
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
    r'course': LinkSchema(
      id: 68464249850225589,
      name: r'course',
      target: r'Course',
      single: true,
    ),
    r'lessons': LinkSchema(
      id: 7335742697656104369,
      name: r'lessons',
      target: r'Lesson',
      single: false,
      linkName: r'unit',
    )
  },
  embeddedSchemas: {},
  getId: _unitGetId,
  getLinks: _unitGetLinks,
  attach: _unitAttach,
  version: '3.1.0+1',
);

int _unitEstimateSize(
  Unit object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
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
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _unitSerialize(
  Unit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.courseId);
  writer.writeString(offsets[1], object.description);
  writer.writeLong(offsets[2], object.order);
  writer.writeString(offsets[3], object.serial);
  writer.writeString(offsets[4], object.title);
}

Unit _unitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Unit();
  object.courseId = reader.readLongOrNull(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.order = reader.readLongOrNull(offsets[2]);
  object.serial = reader.readStringOrNull(offsets[3]);
  object.title = reader.readStringOrNull(offsets[4]);
  return object;
}

P _unitDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _unitGetId(Unit object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _unitGetLinks(Unit object) {
  return [object.course, object.lessons];
}

void _unitAttach(IsarCollection<dynamic> col, Id id, Unit object) {
  object.id = id;
  object.course.attach(col, col.isar.collection<Course>(), r'course', id);
  object.lessons.attach(col, col.isar.collection<Lesson>(), r'lessons', id);
}

extension UnitByIndex on IsarCollection<Unit> {
  Future<Unit?> getBySerial(String? serial) {
    return getByIndex(r'serial', [serial]);
  }

  Unit? getBySerialSync(String? serial) {
    return getByIndexSync(r'serial', [serial]);
  }

  Future<bool> deleteBySerial(String? serial) {
    return deleteByIndex(r'serial', [serial]);
  }

  bool deleteBySerialSync(String? serial) {
    return deleteByIndexSync(r'serial', [serial]);
  }

  Future<List<Unit?>> getAllBySerial(List<String?> serialValues) {
    final values = serialValues.map((e) => [e]).toList();
    return getAllByIndex(r'serial', values);
  }

  List<Unit?> getAllBySerialSync(List<String?> serialValues) {
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

  Future<Id> putBySerial(Unit object) {
    return putByIndex(r'serial', object);
  }

  Id putBySerialSync(Unit object, {bool saveLinks = true}) {
    return putByIndexSync(r'serial', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySerial(List<Unit> objects) {
    return putAllByIndex(r'serial', objects);
  }

  List<Id> putAllBySerialSync(List<Unit> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'serial', objects, saveLinks: saveLinks);
  }
}

extension UnitQueryWhereSort on QueryBuilder<Unit, Unit, QWhere> {
  QueryBuilder<Unit, Unit, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UnitQueryWhere on QueryBuilder<Unit, Unit, QWhereClause> {
  QueryBuilder<Unit, Unit, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Unit, Unit, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Unit, Unit, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Unit, Unit, QAfterWhereClause> idBetween(
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

  QueryBuilder<Unit, Unit, QAfterWhereClause> serialIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serial',
        value: [null],
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterWhereClause> serialIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'serial',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterWhereClause> serialEqualTo(String? serial) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serial',
        value: [serial],
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterWhereClause> serialNotEqualTo(String? serial) {
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

extension UnitQueryFilter on QueryBuilder<Unit, Unit, QFilterCondition> {
  QueryBuilder<Unit, Unit, QAfterFilterCondition> courseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'courseId',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> courseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'courseId',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> courseIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'courseId',
        value: value,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> courseIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'courseId',
        value: value,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> courseIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'courseId',
        value: value,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> courseIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'courseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Unit, Unit, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Unit, Unit, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Unit, Unit, QAfterFilterCondition> orderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'order',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> orderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'order',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> orderEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> orderGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> orderLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> orderBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'order',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> serialIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serial',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> serialIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serial',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> serialEqualTo(
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

  QueryBuilder<Unit, Unit, QAfterFilterCondition> serialGreaterThan(
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

  QueryBuilder<Unit, Unit, QAfterFilterCondition> serialLessThan(
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

  QueryBuilder<Unit, Unit, QAfterFilterCondition> serialBetween(
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

  QueryBuilder<Unit, Unit, QAfterFilterCondition> serialStartsWith(
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

  QueryBuilder<Unit, Unit, QAfterFilterCondition> serialEndsWith(
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

  QueryBuilder<Unit, Unit, QAfterFilterCondition> serialContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> serialMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> serialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serial',
        value: '',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> serialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serial',
        value: '',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension UnitQueryObject on QueryBuilder<Unit, Unit, QFilterCondition> {}

extension UnitQueryLinks on QueryBuilder<Unit, Unit, QFilterCondition> {
  QueryBuilder<Unit, Unit, QAfterFilterCondition> course(
      FilterQuery<Course> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'course');
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> courseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'course', 0, true, 0, true);
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> lessons(
      FilterQuery<Lesson> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'lessons');
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> lessonsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lessons', length, true, length, true);
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> lessonsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lessons', 0, true, 0, true);
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> lessonsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lessons', 0, false, 999999, true);
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> lessonsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lessons', 0, true, length, include);
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> lessonsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lessons', length, include, 999999, true);
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> lessonsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'lessons', lower, includeLower, upper, includeUpper);
    });
  }
}

extension UnitQuerySortBy on QueryBuilder<Unit, Unit, QSortBy> {
  QueryBuilder<Unit, Unit, QAfterSortBy> sortByCourseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseId', Sort.asc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> sortByCourseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseId', Sort.desc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> sortBySerial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.asc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> sortBySerialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.desc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension UnitQuerySortThenBy on QueryBuilder<Unit, Unit, QSortThenBy> {
  QueryBuilder<Unit, Unit, QAfterSortBy> thenByCourseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseId', Sort.asc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> thenByCourseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseId', Sort.desc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> thenBySerial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.asc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> thenBySerialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.desc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Unit, Unit, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension UnitQueryWhereDistinct on QueryBuilder<Unit, Unit, QDistinct> {
  QueryBuilder<Unit, Unit, QDistinct> distinctByCourseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'courseId');
    });
  }

  QueryBuilder<Unit, Unit, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Unit, Unit, QDistinct> distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }

  QueryBuilder<Unit, Unit, QDistinct> distinctBySerial(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serial', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Unit, Unit, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension UnitQueryProperty on QueryBuilder<Unit, Unit, QQueryProperty> {
  QueryBuilder<Unit, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Unit, int?, QQueryOperations> courseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'courseId');
    });
  }

  QueryBuilder<Unit, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Unit, int?, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<Unit, String?, QQueryOperations> serialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serial');
    });
  }

  QueryBuilder<Unit, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
