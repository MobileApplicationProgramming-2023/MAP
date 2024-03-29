class Reservation {
  final int guestNum;
  final String specialReq;
  final String setting;
  final DateTime date;
  final String reserveid;
  final String state;

  Reservation({
    required this.guestNum,
    required this.specialReq,
    required this.setting,
    required this.date,
    required this.reserveid,
    required this.state,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      guestNum: json['guestNum'] ?? 0,
      specialReq: json['specialReq'] ?? '',
      setting: json['setting'] ?? '',
      date: DateTime.parse(json['date'] ?? ''),
      reserveid: json['reserveid'] ?? '',
      state: json['state'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'guestNum': guestNum,
      'specialReq': specialReq,
      'setting': setting,
      'date': date.toIso8601String(),
      'reserveid': reserveid,
      'state': state,
    };
  }

  factory Reservation.fromMap(Map<String, dynamic> map) {
    return Reservation(
      guestNum: map['guestNum'],
      specialReq: map['specialReq'],
      setting: map['setting'],
      date: DateTime.parse(map['date']),
      reserveid: map['reserveid'],
      state: map['state'],
    );
  }
}
