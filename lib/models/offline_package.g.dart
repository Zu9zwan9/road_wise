// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_package.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOfflinePackageCollection on Isar {
  IsarCollection<OfflinePackage> get offlinePackages => this.collection();
}

const OfflinePackageSchema = CollectionSchema(
  name: r'OfflinePackage',
  id: 6003969846532826819,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'downloadDate': PropertySchema(
      id: 1,
      name: r'downloadDate',
      type: IsarType.dateTime,
    ),
    r'downloadProgress': PropertySchema(
      id: 2,
      name: r'downloadProgress',
      type: IsarType.double,
    ),
    r'expiryDate': PropertySchema(
      id: 3,
      name: r'expiryDate',
      type: IsarType.dateTime,
    ),
    r'formattedDownloadDate': PropertySchema(
      id: 4,
      name: r'formattedDownloadDate',
      type: IsarType.string,
    ),
    r'formattedSize': PropertySchema(
      id: 5,
      name: r'formattedSize',
      type: IsarType.string,
    ),
    r'hasExpired': PropertySchema(
      id: 6,
      name: r'hasExpired',
      type: IsarType.bool,
    ),
    r'hashCode': PropertySchema(
      id: 7,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'isDownloaded': PropertySchema(
      id: 8,
      name: r'isDownloaded',
      type: IsarType.bool,
    ),
    r'lessonCount': PropertySchema(
      id: 9,
      name: r'lessonCount',
      type: IsarType.long,
    ),
    r'lessonIds': PropertySchema(
      id: 10,
      name: r'lessonIds',
      type: IsarType.stringList,
    ),
    r'serial': PropertySchema(
      id: 11,
      name: r'serial',
      type: IsarType.string,
    ),
    r'sizeInKb': PropertySchema(
      id: 12,
      name: r'sizeInKb',
      type: IsarType.long,
    ),
    r'title': PropertySchema(
      id: 13,
      name: r'title',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 14,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _offlinePackageEstimateSize,
  serialize: _offlinePackageSerialize,
  deserialize: _offlinePackageDeserialize,
  deserializeProp: _offlinePackageDeserializeProp,
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
  links: {},
  embeddedSchemas: {},
  getId: _offlinePackageGetId,
  getLinks: _offlinePackageGetLinks,
  attach: _offlinePackageAttach,
  version: '3.1.0+1',
);

int _offlinePackageEstimateSize(
  OfflinePackage object,
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
  bytesCount += 3 + object.formattedDownloadDate.length * 3;
  bytesCount += 3 + object.formattedSize.length * 3;
  {
    final list = object.lessonIds;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
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
  {
    final value = object.userId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _offlinePackageSerialize(
  OfflinePackage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeDateTime(offsets[1], object.downloadDate);
  writer.writeDouble(offsets[2], object.downloadProgress);
  writer.writeDateTime(offsets[3], object.expiryDate);
  writer.writeString(offsets[4], object.formattedDownloadDate);
  writer.writeString(offsets[5], object.formattedSize);
  writer.writeBool(offsets[6], object.hasExpired);
  writer.writeLong(offsets[7], object.hashCode);
  writer.writeBool(offsets[8], object.isDownloaded);
  writer.writeLong(offsets[9], object.lessonCount);
  writer.writeStringList(offsets[10], object.lessonIds);
  writer.writeString(offsets[11], object.serial);
  writer.writeLong(offsets[12], object.sizeInKb);
  writer.writeString(offsets[13], object.title);
  writer.writeString(offsets[14], object.userId);
}

OfflinePackage _offlinePackageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OfflinePackage(
    description: reader.readStringOrNull(offsets[0]),
    downloadDate: reader.readDateTimeOrNull(offsets[1]),
    downloadProgress: reader.readDoubleOrNull(offsets[2]) ?? 0.0,
    expiryDate: reader.readDateTimeOrNull(offsets[3]),
    id: id,
    isDownloaded: reader.readBoolOrNull(offsets[8]) ?? false,
    lessonIds: reader.readStringList(offsets[10]),
    serial: reader.readStringOrNull(offsets[11]),
    sizeInKb: reader.readLongOrNull(offsets[12]) ?? 0,
    title: reader.readStringOrNull(offsets[13]),
    userId: reader.readStringOrNull(offsets[14]),
  );
  return object;
}

P _offlinePackageDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readStringList(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _offlinePackageGetId(OfflinePackage object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _offlinePackageGetLinks(OfflinePackage object) {
  return [];
}

void _offlinePackageAttach(
    IsarCollection<dynamic> col, Id id, OfflinePackage object) {
  object.id = id;
}

extension OfflinePackageByIndex on IsarCollection<OfflinePackage> {
  Future<OfflinePackage?> getBySerial(String? serial) {
    return getByIndex(r'serial', [serial]);
  }

  OfflinePackage? getBySerialSync(String? serial) {
    return getByIndexSync(r'serial', [serial]);
  }

  Future<bool> deleteBySerial(String? serial) {
    return deleteByIndex(r'serial', [serial]);
  }

  bool deleteBySerialSync(String? serial) {
    return deleteByIndexSync(r'serial', [serial]);
  }

  Future<List<OfflinePackage?>> getAllBySerial(List<String?> serialValues) {
    final values = serialValues.map((e) => [e]).toList();
    return getAllByIndex(r'serial', values);
  }

  List<OfflinePackage?> getAllBySerialSync(List<String?> serialValues) {
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

  Future<Id> putBySerial(OfflinePackage object) {
    return putByIndex(r'serial', object);
  }

  Id putBySerialSync(OfflinePackage object, {bool saveLinks = true}) {
    return putByIndexSync(r'serial', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySerial(List<OfflinePackage> objects) {
    return putAllByIndex(r'serial', objects);
  }

  List<Id> putAllBySerialSync(List<OfflinePackage> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'serial', objects, saveLinks: saveLinks);
  }
}

extension OfflinePackageQueryWhereSort
    on QueryBuilder<OfflinePackage, OfflinePackage, QWhere> {
  QueryBuilder<OfflinePackage, OfflinePackage, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OfflinePackageQueryWhere
    on QueryBuilder<OfflinePackage, OfflinePackage, QWhereClause> {
  QueryBuilder<OfflinePackage, OfflinePackage, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterWhereClause> idBetween(
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterWhereClause>
      serialIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serial',
        value: [null],
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterWhereClause>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterWhereClause> serialEqualTo(
      String? serial) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serial',
        value: [serial],
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterWhereClause>
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

extension OfflinePackageQueryFilter
    on QueryBuilder<OfflinePackage, OfflinePackage, QFilterCondition> {
  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      descriptionEqualTo(
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      descriptionGreaterThan(
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      descriptionLessThan(
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      descriptionBetween(
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      descriptionStartsWith(
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      descriptionEndsWith(
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadDate',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadDate',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadProgressEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadProgressGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadProgressLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadProgressBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadProgress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      expiryDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiryDate',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      expiryDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiryDate',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      expiryDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      expiryDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      expiryDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      expiryDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedDownloadDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedDownloadDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedDownloadDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formattedDownloadDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedDownloadDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formattedDownloadDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedDownloadDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formattedDownloadDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedDownloadDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formattedDownloadDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedDownloadDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formattedDownloadDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedDownloadDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedDownloadDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedDownloadDateMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedDownloadDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedDownloadDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedDownloadDate',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedDownloadDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedDownloadDate',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedSizeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedSizeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formattedSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedSizeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formattedSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedSizeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formattedSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedSizeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formattedSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedSizeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formattedSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedSizeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedSizeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedSize',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedSizeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedSize',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      formattedSizeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedSize',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      hasExpiredEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasExpired',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition> idBetween(
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      isDownloadedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDownloaded',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lessonCount',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lessonCount',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lessonCount',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lessonCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lessonIds',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lessonIds',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lessonIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lessonIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lessonIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lessonIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lessonIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lessonIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lessonIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lessonIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lessonIds',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lessonIds',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lessonIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lessonIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lessonIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lessonIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lessonIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lessonIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      serialIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serial',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      serialIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serial',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      serialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      serialMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      serialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serial',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      serialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serial',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      sizeInKbEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sizeInKb',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      sizeInKbGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sizeInKb',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      sizeInKbLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sizeInKb',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      sizeInKbBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sizeInKb',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      titleEqualTo(
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      titleGreaterThan(
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      titleLessThan(
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      titleBetween(
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      titleStartsWith(
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      titleEndsWith(
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension OfflinePackageQueryObject
    on QueryBuilder<OfflinePackage, OfflinePackage, QFilterCondition> {}

extension OfflinePackageQueryLinks
    on QueryBuilder<OfflinePackage, OfflinePackage, QFilterCondition> {}

extension OfflinePackageQuerySortBy
    on QueryBuilder<OfflinePackage, OfflinePackage, QSortBy> {
  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDownloadDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadDate', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDownloadDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadDate', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDownloadProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadProgress', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDownloadProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadProgress', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByFormattedDownloadDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedDownloadDate', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByFormattedDownloadDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedDownloadDate', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByFormattedSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedSize', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByFormattedSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedSize', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByHasExpired() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasExpired', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByHasExpiredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasExpired', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByIsDownloadedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByLessonCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonCount', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByLessonCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonCount', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortBySerial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortBySerialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortBySizeInKb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sizeInKb', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortBySizeInKbDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sizeInKb', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension OfflinePackageQuerySortThenBy
    on QueryBuilder<OfflinePackage, OfflinePackage, QSortThenBy> {
  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDownloadDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadDate', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDownloadDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadDate', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDownloadProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadProgress', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDownloadProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadProgress', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByFormattedDownloadDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedDownloadDate', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByFormattedDownloadDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedDownloadDate', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByFormattedSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedSize', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByFormattedSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedSize', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByHasExpired() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasExpired', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByHasExpiredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasExpired', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByIsDownloadedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByLessonCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonCount', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByLessonCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonCount', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenBySerial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenBySerialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenBySizeInKb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sizeInKb', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenBySizeInKbDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sizeInKb', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension OfflinePackageQueryWhereDistinct
    on QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> {
  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByDownloadDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadDate');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByDownloadProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadProgress');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiryDate');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByFormattedDownloadDate({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formattedDownloadDate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByFormattedSize({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formattedSize',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByHasExpired() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasExpired');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDownloaded');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByLessonCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lessonCount');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByLessonIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lessonIds');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctBySerial(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serial', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctBySizeInKb() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sizeInKb');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension OfflinePackageQueryProperty
    on QueryBuilder<OfflinePackage, OfflinePackage, QQueryProperty> {
  QueryBuilder<OfflinePackage, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OfflinePackage, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<OfflinePackage, DateTime?, QQueryOperations>
      downloadDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadDate');
    });
  }

  QueryBuilder<OfflinePackage, double, QQueryOperations>
      downloadProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadProgress');
    });
  }

  QueryBuilder<OfflinePackage, DateTime?, QQueryOperations>
      expiryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiryDate');
    });
  }

  QueryBuilder<OfflinePackage, String, QQueryOperations>
      formattedDownloadDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formattedDownloadDate');
    });
  }

  QueryBuilder<OfflinePackage, String, QQueryOperations>
      formattedSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formattedSize');
    });
  }

  QueryBuilder<OfflinePackage, bool, QQueryOperations> hasExpiredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasExpired');
    });
  }

  QueryBuilder<OfflinePackage, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<OfflinePackage, bool, QQueryOperations> isDownloadedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDownloaded');
    });
  }

  QueryBuilder<OfflinePackage, int, QQueryOperations> lessonCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lessonCount');
    });
  }

  QueryBuilder<OfflinePackage, List<String>?, QQueryOperations>
      lessonIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lessonIds');
    });
  }

  QueryBuilder<OfflinePackage, String?, QQueryOperations> serialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serial');
    });
  }

  QueryBuilder<OfflinePackage, int, QQueryOperations> sizeInKbProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sizeInKb');
    });
  }

  QueryBuilder<OfflinePackage, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<OfflinePackage, String?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
