import 'ride.dart';

class RidesData {
  RidesData({
    this.searching,
    this.placed,
    this.started,
    this.completed,
    this.canceled,
  });

  RidesData.fromJson(dynamic json) {
    if (json['searching'] != null) {
      searching = [];
      json['searching'].forEach((v) {
        searching?.add(Ride.fromJson(v));
      });
    }
    if (json['placed'] != null) {
      placed = [];
      json['placed'].forEach((v) {
        placed?.add(Ride.fromJson(v));
      });
    }
    if (json['started'] != null) {
      started = [];
      json['started'].forEach((v) {
        started?.add(Ride.fromJson(v));
      });
    }
    if (json['completed'] != null) {
      completed = [];
      json['completed'].forEach((v) {
        completed?.add(Ride.fromJson(v));
      });
    }
    if (json['canceled'] != null) {
      canceled = [];
      json['canceled'].forEach((v) {
        canceled?.add(Ride.fromJson(v));
      });
    }
  }

  List<Ride>? searching;
  List<Ride>? placed;
  List<Ride>? started;
  List<Ride>? completed;
  List<Ride>? canceled;
}
