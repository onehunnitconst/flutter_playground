class Message {
  final String id;
  final String message;

  Message({required this.id, required this.message});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "message": message,
    };
  }
}
