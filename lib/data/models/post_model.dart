import '../../domain/entities/post.dart';

class Post extends PostModel {
  const Post({int? id, required String title, required String body})
      : super(id: id, title: title, body: body);

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
