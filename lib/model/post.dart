import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String description;
  final String uid;
  final String postId;
  final String username;
  final String postUrl;
  final String profImagre;
  final DateTime datePublished;
  final List likes;

  PostModel({
    required this.description,
    required this.uid,
    required this.postId,
    required this.username,
    required this.postUrl,
    required this.profImagre,
    required this.datePublished,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        'description': description,
        'uid': uid,
        'postId': postId,
        'username': username,
        'postUrl': postUrl,
        'profImagre': profImagre,
        'datePublished':datePublished,
        'likes': likes,
      };

  static PostModel fromSnap(DocumentSnapshot snap) {
    final data = snap.data() as Map<String, dynamic>;

    return PostModel(
      description: data['description'],
      uid: data['uid'],
      postId: data['postId'],
      username: data['username'],
      postUrl: data['postUrl'],
      datePublished : data['datePublished'],
      profImagre: data['profImagre'],
      likes: data['likes'],
    );
  }
}
