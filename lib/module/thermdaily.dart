import 'dart:convert';

import '../cash/cost_shared.dart';

class Therment {
  final String cost;
  final String nametherment;
  Therment({
    required this.cost,
    required this.nametherment,
  });
  static Map<String, dynamic> toMap(Therment music) => {
        'cost': music.cost,
        'nametherment': music.nametherment,
      };
  Map<String, dynamic> toJson() => {
        'nametherment': nametherment,
        'cost': cost,
      };
  Therment.fromJson(Map<String, dynamic> json)
      : nametherment = json['nametherment'],
        cost = json['cost'];
  static String encode(List<Therment> musics) => json.encode(
        musics
            .map<Map<String, dynamic>>((music) => Therment.toMap(music))
            .toList(),
      );

  static List<Therment> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<Therment>((item) => Therment.fromJson(item))
          .toList();
}

class BoostCost {
  final int boostcost;

  BoostCost({required this.boostcost});
}

class SalaryCost {
  final dynamic salary;
  final dynamic currencyname;
  final dynamic balance;
  SalaryCost({this.salary, this.balance, this.currencyname});
}

class SelfaThemer {
  final String costofselfa;
  final DateTime dateforselfa;

  SelfaThemer(this.costofselfa, this.dateforselfa);
}
