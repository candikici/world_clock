class Timezone {
  String abbreviation;
  DateTime datetime;
  String timezone;
  DateTime utcDatetime;
  String utcOffset;
  Timezone({
    required this.abbreviation,
    required this.datetime,
    required this.timezone,
    required this.utcDatetime,
    required this.utcOffset,
  });

  Map<String, dynamic> toMap() {
    return {
      'abbreviation': abbreviation,
      'datetime': datetime.millisecondsSinceEpoch,
      'timezone': timezone,
      'utcDatetime': utcDatetime.millisecondsSinceEpoch,
      'utcOffset': utcOffset,
    };
  }

  factory Timezone.fromMap(Map<String, dynamic> map) {
    return Timezone(
      abbreviation: map['abbreviation'] ?? '',
      datetime: DateTime.parse(map['datetime']),
      timezone: map['timezone'] ?? '',
      utcDatetime: DateTime.parse(map['utc_datetime']),
      utcOffset: map['utc_offset'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Timezone(abbreviation: $abbreviation, datetime: $datetime, timezone: $timezone, utcDatetime: $utcDatetime, utcOffset: $utcOffset)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Timezone &&
        other.abbreviation == abbreviation &&
        other.datetime == datetime &&
        other.timezone == timezone &&
        other.utcDatetime == utcDatetime &&
        other.utcOffset == utcOffset;
  }

  @override
  int get hashCode {
    return abbreviation.hashCode ^
        datetime.hashCode ^
        timezone.hashCode ^
        utcDatetime.hashCode ^
        utcOffset.hashCode;
  }
}
