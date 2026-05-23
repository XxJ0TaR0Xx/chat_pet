import 'dart:convert';

class MessageModel {
  MessageModel({
    required this.id,
    required this.type,
    required this.data,
    required this.time,
  });

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String,
      type: map['type'] as String,
      data: map['data'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
    );
  }

  final String id;
  final String type;
  final String data;
  final DateTime time;

  MessageModel copyWith({
    String? id,
    String? type,
    String? data,
    DateTime? time,
  }) {
    return MessageModel(
      id: id ?? this.id,
      type: type ?? this.type,
      data: data ?? this.data,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'data': data,
      'time': time.millisecondsSinceEpoch,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'MessageModel(id: $id, type: $type, data: $data, time: $time)';
  }

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.type == type && other.data == data && other.time == time;
  }

  @override
  int get hashCode {
    return id.hashCode ^ type.hashCode ^ data.hashCode ^ time.hashCode;
  }
}
