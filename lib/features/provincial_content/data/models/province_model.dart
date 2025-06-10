import 'package:equatable/equatable.dart';

/// Province model representing Canadian provinces and territories
class ProvinceModel extends Equatable {
  final String id;
  final String name;
  final String code;
  final String flagAsset;
  final String description;

  const ProvinceModel({
    required this.id,
    required this.name,
    required this.code,
    required this.flagAsset,
    required this.description,
  });

  /// Create a copy of this ProvinceModel with the given fields replaced
  ProvinceModel copyWith({
    String? id,
    String? name,
    String? code,
    String? flagAsset,
    String? description,
  }) {
    return ProvinceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      flagAsset: flagAsset ?? this.flagAsset,
      description: description ?? this.description,
    );
  }

  /// Convert ProvinceModel to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'flagAsset': flagAsset,
      'description': description,
    };
  }

  /// Create ProvinceModel from Map
  factory ProvinceModel.fromMap(Map<String, dynamic> map) {
    return ProvinceModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      code: map['code'] ?? '',
      flagAsset: map['flagAsset'] ?? '',
      description: map['description'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name, code, flagAsset, description];

  /// List of all Canadian provinces and territories
  static List<ProvinceModel> allProvinces() {
    return [
      const ProvinceModel(
        id: 'ab',
        name: 'Alberta',
        code: 'AB',
        flagAsset: 'assets/images/flags/alberta.png',
        description:
            'Alberta\'s traffic rules focus on safety in diverse conditions, from urban centers to rural highways.',
      ),
      const ProvinceModel(
        id: 'bc',
        name: 'British Columbia',
        code: 'BC',
        flagAsset: 'assets/images/flags/british_columbia.png',
        description:
            'British Columbia\'s driving regulations address mountainous terrain, coastal highways, and dense urban areas.',
      ),
      const ProvinceModel(
        id: 'mb',
        name: 'Manitoba',
        code: 'MB',
        flagAsset: 'assets/images/flags/manitoba.png',
        description:
            'Manitoba\'s traffic laws emphasize safety on prairie highways and in varying weather conditions.',
      ),
      const ProvinceModel(
        id: 'nb',
        name: 'New Brunswick',
        code: 'NB',
        flagAsset: 'assets/images/flags/new_brunswick.png',
        description:
            'New Brunswick\'s bilingual province has rules adapted to coastal and inland driving conditions.',
      ),
      const ProvinceModel(
        id: 'nl',
        name: 'Newfoundland and Labrador',
        code: 'NL',
        flagAsset: 'assets/images/flags/newfoundland.png',
        description:
            'Newfoundland and Labrador\'s regulations address coastal highways and challenging weather conditions.',
      ),
      const ProvinceModel(
        id: 'nt',
        name: 'Northwest Territories',
        code: 'NT',
        flagAsset: 'assets/images/flags/northwest_territories.png',
        description:
            'Northwest Territories\' rules focus on remote driving, winter roads, and wildlife awareness.',
      ),
      const ProvinceModel(
        id: 'ns',
        name: 'Nova Scotia',
        code: 'NS',
        flagAsset: 'assets/images/flags/nova_scotia.png',
        description:
            'Nova Scotia\'s traffic laws cover coastal highways, urban centers, and rural communities.',
      ),
      const ProvinceModel(
        id: 'nu',
        name: 'Nunavut',
        code: 'NU',
        flagAsset: 'assets/images/flags/nunavut.png',
        description:
            'Nunavut\'s unique driving environment includes remote communities and seasonal ice roads.',
      ),
      const ProvinceModel(
        id: 'on',
        name: 'Ontario',
        code: 'ON',
        flagAsset: 'assets/images/flags/ontario.png',
        description:
            'Ontario\'s comprehensive traffic system covers Canada\'s busiest highways and diverse driving conditions.',
      ),
      const ProvinceModel(
        id: 'pe',
        name: 'Prince Edward Island',
        code: 'PE',
        flagAsset: 'assets/images/flags/prince_edward_island.png',
        description:
            'Prince Edward Island\'s compact province has rules for rural roads and seasonal tourist traffic.',
      ),
      const ProvinceModel(
        id: 'qc',
        name: 'Quebec',
        code: 'QC',
        flagAsset: 'assets/images/flags/quebec.png',
        description:
            'Quebec\'s distinct traffic code includes French signage and regulations for varied terrain.',
      ),
      const ProvinceModel(
        id: 'sk',
        name: 'Saskatchewan',
        code: 'SK',
        flagAsset: 'assets/images/flags/saskatchewan.png',
        description:
            'Saskatchewan\'s rules address grid road systems, prairie highways, and agricultural vehicle traffic.',
      ),
      const ProvinceModel(
        id: 'yt',
        name: 'Yukon',
        code: 'YT',
        flagAsset: 'assets/images/flags/yukon.png',
        description:
            'Yukon\'s traffic regulations focus on mountain driving, wildlife awareness, and remote highway safety.',
      ),
    ];
  }
}
