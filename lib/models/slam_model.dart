
import 'dart:convert';

class Slam {//class for slam
  String? id;
  late String name;
  final String nickname;//parameters
  final String age;
  final double happiness;
  final bool status;
  final String superpower;
  final String motto;

  Slam({
    this.id,
    required this.name,
    required this.nickname,
    required this.age,
    required this.happiness,
    required this.status,
    required this.superpower,
    required this.motto
  });

  // constructor from json
  factory Slam.fromJson(Map<String, dynamic> json) {
    return Slam(
      name: json['name'],
      id: json['id'],
      nickname: json['nickname'],
      age: json['age'],
      happiness: json['happiness'],
      status: json['status'],
      superpower: json['superpower'],
      motto: json['motto'],
    );
  }

  static List<Slam> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Slam>((dynamic d) => Slam.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Slam slam) {//map
    return {
      'name': slam.name,
      'nickname': slam.nickname,
      'age': slam.age,
      'happiness': slam.happiness,
      'status': slam.status,
      'superpower': slam.superpower,
      'motto': slam.motto,
    };
  }
}
