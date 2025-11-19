import 'package:socialmedia_clone/models/usercomment.dart';

class Userpost {
  final String userimg;
  final String username;
  final String time;
  final String postcontent;
  final String postimg;
  final String numshare;
  bool isLiked;
  List<Usercomment> comments;

  Userpost({
    required this.userimg,
    required this.username,
    required this.time,
    required this.postcontent,
    required this.postimg,
    required String numcomments,
    required this.numshare,
    required this.isLiked,
    List<Usercomment>? comments,
  }) : comments = comments ?? [];

  String get numcomments => comments.length.toString();
  
  void addComment(Usercomment comment) {
    comments.add(comment);
  }
}