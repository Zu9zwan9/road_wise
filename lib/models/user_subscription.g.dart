// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_subscription.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserSubscriptionCollection on Isar {
  IsarCollection<UserSubscription> get userSubscriptions => this.collection();
}

const UserSubscriptionSchema = CollectionSchema(
  name: r'UserSubscription',
  id: 950687617358749933,
  properties: {
    r'serial': PropertySchema(
      id: 0,
      name: r'serial',
      type: IsarType.string,
    ),
    r'stripeCurrentPeriodEnd': PropertySchema(
      id: 1,
      name: r'stripeCurrentPeriodEnd',
      type: IsarType.dateTime,
    ),
    r'stripeCustomerId': PropertySchema(
      id: 2,
      name: r'stripeCustomerId',
      type: IsarType.string,
    ),
    r'stripePriceId': PropertySchema(
      id: 3,
      name: r'stripePriceId',
      type: IsarType.string,
    ),
    r'stripeSubscriptionId': PropertySchema(
      id: 4,
      name: r'stripeSubscriptionId',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 5,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _userSubscriptionEstimateSize,
  serialize: _userSubscriptionSerialize,
  deserialize: _userSubscriptionDeserialize,
  deserializeProp: _userSubscriptionDeserializeProp,
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
    ),
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
  links: {},
  embeddedSchemas: {},
  getId: _userSubscriptionGetId,
  getLinks: _userSubscriptionGetLinks,
  attach: _userSubscriptionAttach,
  version: '3.1.0+1',
);

int _userSubscriptionEstimateSize(
  UserSubscription object,
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
    final value = object.stripeCustomerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stripePriceId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stripeSubscriptionId;
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

void _userSubscriptionSerialize(
  UserSubscription object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.serial);
  writer.writeDateTime(offsets[1], object.stripeCurrentPeriodEnd);
  writer.writeString(offsets[2], object.stripeCustomerId);
  writer.writeString(offsets[3], object.stripePriceId);
  writer.writeString(offsets[4], object.stripeSubscriptionId);
  writer.writeString(offsets[5], object.userId);
}

UserSubscription _userSubscriptionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserSubscription();
  object.id = id;
  object.serial = reader.readStringOrNull(offsets[0]);
  object.stripeCurrentPeriodEnd = reader.readDateTimeOrNull(offsets[1]);
  object.stripeCustomerId = reader.readStringOrNull(offsets[2]);
  object.stripePriceId = reader.readStringOrNull(offsets[3]);
  object.stripeSubscriptionId = reader.readStringOrNull(offsets[4]);
  object.userId = reader.readStringOrNull(offsets[5]);
  return object;
}

P _userSubscriptionDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
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

Id _userSubscriptionGetId(UserSubscription object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userSubscriptionGetLinks(UserSubscription object) {
  return [];
}

void _userSubscriptionAttach(
    IsarCollection<dynamic> col, Id id, UserSubscription object) {
  object.id = id;
}

extension UserSubscriptionByIndex on IsarCollection<UserSubscription> {
  Future<UserSubscription?> getBySerial(String? serial) {
    return getByIndex(r'serial', [serial]);
  }

  UserSubscription? getBySerialSync(String? serial) {
    return getByIndexSync(r'serial', [serial]);
  }

  Future<bool> deleteBySerial(String? serial) {
    return deleteByIndex(r'serial', [serial]);
  }

  bool deleteBySerialSync(String? serial) {
    return deleteByIndexSync(r'serial', [serial]);
  }

  Future<List<UserSubscription?>> getAllBySerial(List<String?> serialValues) {
    final values = serialValues.map((e) => [e]).toList();
    return getAllByIndex(r'serial', values);
  }

  List<UserSubscription?> getAllBySerialSync(List<String?> serialValues) {
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

  Future<Id> putBySerial(UserSubscription object) {
    return putByIndex(r'serial', object);
  }

  Id putBySerialSync(UserSubscription object, {bool saveLinks = true}) {
    return putByIndexSync(r'serial', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySerial(List<UserSubscription> objects) {
    return putAllByIndex(r'serial', objects);
  }

  List<Id> putAllBySerialSync(List<UserSubscription> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'serial', objects, saveLinks: saveLinks);
  }

  Future<UserSubscription?> getByUserId(String? userId) {
    return getByIndex(r'userId', [userId]);
  }

  UserSubscription? getByUserIdSync(String? userId) {
    return getByIndexSync(r'userId', [userId]);
  }

  Future<bool> deleteByUserId(String? userId) {
    return deleteByIndex(r'userId', [userId]);
  }

  bool deleteByUserIdSync(String? userId) {
    return deleteByIndexSync(r'userId', [userId]);
  }

  Future<List<UserSubscription?>> getAllByUserId(List<String?> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'userId', values);
  }

  List<UserSubscription?> getAllByUserIdSync(List<String?> userIdValues) {
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

  Future<Id> putByUserId(UserSubscription object) {
    return putByIndex(r'userId', object);
  }

  Id putByUserIdSync(UserSubscription object, {bool saveLinks = true}) {
    return putByIndexSync(r'userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserId(List<UserSubscription> objects) {
    return putAllByIndex(r'userId', objects);
  }

  List<Id> putAllByUserIdSync(List<UserSubscription> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
  }
}

extension UserSubscriptionQueryWhereSort
    on QueryBuilder<UserSubscription, UserSubscription, QWhere> {
  QueryBuilder<UserSubscription, UserSubscription, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserSubscriptionQueryWhere
    on QueryBuilder<UserSubscription, UserSubscription, QWhereClause> {
  QueryBuilder<UserSubscription, UserSubscription, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterWhereClause>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterWhereClause> idBetween(
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterWhereClause>
      serialIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serial',
        value: [null],
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterWhereClause>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterWhereClause>
      serialEqualTo(String? serial) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serial',
        value: [serial],
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterWhereClause>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterWhereClause>
      userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [null],
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterWhereClause>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterWhereClause>
      userIdEqualTo(String? userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterWhereClause>
      userIdNotEqualTo(String? userId) {
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

extension UserSubscriptionQueryFilter
    on QueryBuilder<UserSubscription, UserSubscription, QFilterCondition> {
  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      serialIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serial',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      serialIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serial',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      serialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      serialMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      serialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serial',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      serialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serial',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCurrentPeriodEndIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stripeCurrentPeriodEnd',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCurrentPeriodEndIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stripeCurrentPeriodEnd',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCurrentPeriodEndEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stripeCurrentPeriodEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCurrentPeriodEndGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stripeCurrentPeriodEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCurrentPeriodEndLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stripeCurrentPeriodEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCurrentPeriodEndBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stripeCurrentPeriodEnd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCustomerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stripeCustomerId',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCustomerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stripeCustomerId',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCustomerIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stripeCustomerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCustomerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stripeCustomerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCustomerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stripeCustomerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCustomerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stripeCustomerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCustomerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stripeCustomerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCustomerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stripeCustomerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCustomerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stripeCustomerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCustomerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stripeCustomerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCustomerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stripeCustomerId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeCustomerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stripeCustomerId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripePriceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stripePriceId',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripePriceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stripePriceId',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripePriceIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stripePriceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripePriceIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stripePriceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripePriceIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stripePriceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripePriceIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stripePriceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripePriceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stripePriceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripePriceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stripePriceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripePriceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stripePriceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripePriceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stripePriceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripePriceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stripePriceId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripePriceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stripePriceId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeSubscriptionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stripeSubscriptionId',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeSubscriptionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stripeSubscriptionId',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeSubscriptionIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stripeSubscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeSubscriptionIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stripeSubscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeSubscriptionIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stripeSubscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeSubscriptionIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stripeSubscriptionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeSubscriptionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stripeSubscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeSubscriptionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stripeSubscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeSubscriptionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stripeSubscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeSubscriptionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stripeSubscriptionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeSubscriptionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stripeSubscriptionId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      stripeSubscriptionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stripeSubscriptionId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
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

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension UserSubscriptionQueryObject
    on QueryBuilder<UserSubscription, UserSubscription, QFilterCondition> {}

extension UserSubscriptionQueryLinks
    on QueryBuilder<UserSubscription, UserSubscription, QFilterCondition> {}

extension UserSubscriptionQuerySortBy
    on QueryBuilder<UserSubscription, UserSubscription, QSortBy> {
  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      sortBySerial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.asc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      sortBySerialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.desc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      sortByStripeCurrentPeriodEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stripeCurrentPeriodEnd', Sort.asc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      sortByStripeCurrentPeriodEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stripeCurrentPeriodEnd', Sort.desc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      sortByStripeCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stripeCustomerId', Sort.asc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      sortByStripeCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stripeCustomerId', Sort.desc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      sortByStripePriceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stripePriceId', Sort.asc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      sortByStripePriceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stripePriceId', Sort.desc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      sortByStripeSubscriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stripeSubscriptionId', Sort.asc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      sortByStripeSubscriptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stripeSubscriptionId', Sort.desc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserSubscriptionQuerySortThenBy
    on QueryBuilder<UserSubscription, UserSubscription, QSortThenBy> {
  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      thenBySerial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.asc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      thenBySerialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.desc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      thenByStripeCurrentPeriodEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stripeCurrentPeriodEnd', Sort.asc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      thenByStripeCurrentPeriodEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stripeCurrentPeriodEnd', Sort.desc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      thenByStripeCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stripeCustomerId', Sort.asc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      thenByStripeCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stripeCustomerId', Sort.desc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      thenByStripePriceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stripePriceId', Sort.asc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      thenByStripePriceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stripePriceId', Sort.desc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      thenByStripeSubscriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stripeSubscriptionId', Sort.asc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      thenByStripeSubscriptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stripeSubscriptionId', Sort.desc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserSubscriptionQueryWhereDistinct
    on QueryBuilder<UserSubscription, UserSubscription, QDistinct> {
  QueryBuilder<UserSubscription, UserSubscription, QDistinct> distinctBySerial(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serial', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QDistinct>
      distinctByStripeCurrentPeriodEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stripeCurrentPeriodEnd');
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QDistinct>
      distinctByStripeCustomerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stripeCustomerId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QDistinct>
      distinctByStripePriceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stripePriceId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QDistinct>
      distinctByStripeSubscriptionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stripeSubscriptionId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSubscription, UserSubscription, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension UserSubscriptionQueryProperty
    on QueryBuilder<UserSubscription, UserSubscription, QQueryProperty> {
  QueryBuilder<UserSubscription, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserSubscription, String?, QQueryOperations> serialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serial');
    });
  }

  QueryBuilder<UserSubscription, DateTime?, QQueryOperations>
      stripeCurrentPeriodEndProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stripeCurrentPeriodEnd');
    });
  }

  QueryBuilder<UserSubscription, String?, QQueryOperations>
      stripeCustomerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stripeCustomerId');
    });
  }

  QueryBuilder<UserSubscription, String?, QQueryOperations>
      stripePriceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stripePriceId');
    });
  }

  QueryBuilder<UserSubscription, String?, QQueryOperations>
      stripeSubscriptionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stripeSubscriptionId');
    });
  }

  QueryBuilder<UserSubscription, String?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
