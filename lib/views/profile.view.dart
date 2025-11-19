import 'package:flutter/material.dart';
import 'package:socialmedia_clone/models/usercomment.dart';
import 'package:socialmedia_clone/models/userdata.dart';
import 'package:socialmedia_clone/models/userpost.dart';

// ignore: must_be_immutable
class ProfileView extends StatefulWidget {
  final Userpost userPost;
  
  const ProfileView({super.key, required this.userPost});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Userpost _userPost;
  final Userdata userData = Userdata();
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Create a copy of the post to avoid modifying the original
    _userPost = Userpost(
      userimg: widget.userPost.userimg,
      username: widget.userPost.username,
      time: widget.userPost.time,
      postcontent: widget.userPost.postcontent,
      postimg: widget.userPost.postimg,
      numcomments: widget.userPost.comments.length.toString(),
      numshare: widget.userPost.numshare,
      isLiked: widget.userPost.isLiked,
      comments: List.from(widget.userPost.comments),
    );
  }

  void _showCommentDialog() {
    showDialog(
      context: context,
      builder: (context) => CommentDialog(
        currentUserImg: userData.myUserAccount.img,
        currentUserName: userData.myUserAccount.name,
        onCommentAdded: (comment) {
          setState(() {
            _userPost.addComment(comment);
          });
        },
      ),
    );
  }

  var nametxtStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  var boldtxtStyle = const TextStyle(fontWeight: FontWeight.bold);

  var boldtxtStyle1 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16
  );

  Widget commentBtn (Usercomment userComment) => Padding(
    padding: const EdgeInsets.only(left: 12, top: 2, bottom: 4),
    child: Row(
      children: [
        const Text(
          'Like',
          style: TextStyle(
            color: Color(0xFF65676B),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Reply',
          style: TextStyle(
            color: Color(0xFF65676B),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          userComment.commenterTime,
          style: const TextStyle(
            color: Color(0xFF65676B),
            fontSize: 12,
          ),
        ),
      ],
    ),
  );


  Widget commentDesc (Usercomment userComment) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(userComment.commenterName, style: boldtxtStyle),
        const SizedBox(height: 5),
        Row(children: [Text(userComment.commenterContent)]),
      ],
    ),
  );


  Widget commentSpace (Usercomment userComment) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        userComment.commenterName,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 13,
          color: Colors.black87,
        ),
      ),
      const SizedBox(width: 6),
      Text(
        userComment.commenterTime,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 11,
        ),
      ),
    ],
  );


  Widget commenterPic(Usercomment userComment) => CircleAvatar(
    backgroundImage: AssetImage(userComment.commenterImg),
    radius: 14,
  );


  Widget usercommenterLine(Usercomment userComment) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commenterPic(userComment),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F2F5),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  commentSpace(userComment),
                  const SizedBox(height: 2),
                  Text(
                    userComment.commenterContent,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
            commentBtn(userComment),
          ],
        ),
      ],
    ),
  );

  
Widget userpostdetails(Usercomment userComment) => Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    const SizedBox(height: 8),
    usercommenterLine(userComment),
    const SizedBox(height: 8),
  ],
);

Widget commenters(Userpost userPost) => Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Divider(color: Colors.grey),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text('${userPost.comments.length} comments', style: boldtxtStyle1),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    ),
    const SizedBox(height: 8),
  ],
);


Widget buttons() => Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Divider(
      color: Colors.grey,
    ),
    Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon( 
          style: TextButton.styleFrom(
            foregroundColor: _userPost.isLiked ? Colors.blue : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _userPost.isLiked = !_userPost.isLiked;
            });
          },
          icon: Icon(Icons.thumb_up, size: 20),
          label: const Text('Like'),
        ),

        TextButton.icon( 
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey),
          onPressed: _showCommentDialog,
          icon: const Icon(Icons.chat_bubble, size: 20),
          label: const Text('Comment'),
        ),

        TextButton.icon( 
          style: TextButton.styleFrom(
            foregroundColor:Colors.grey),
          onPressed: () {},
          icon: const Icon(Icons.share, size: 20),
          label: const Text(''),
        ),
      ],
    ),
    ),
    const Divider(color: Colors.grey),
  ],
);

Widget userLine(Userpost userPost) => Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CircleAvatar(
        backgroundImage: AssetImage(userPost.userimg),
        radius: 20
      ),
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(userPost.username, style: nametxtStyle),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(userPost.time),
            const Text('.'),
            const Icon(Icons.group, size: 15, color: Colors.grey),
          ],
        )
      ],
    )
  ],
);

Widget postimage(Userpost userPost) => Padding(
  padding: const EdgeInsets.all(10.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(children: [Text(userPost.postcontent)]),
      const SizedBox(height: 15),
      Container(
        height: 350,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(userPost.postimg),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ],
  ),
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, _userPost);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                userLine(_userPost),
                postimage(_userPost),
                buttons(),
                commenters(_userPost),
                if (_userPost.comments.isNotEmpty) ..._userPost.comments.map((comment) => userpostdetails(comment)).toList()
                else
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('No comments yet. Be the first to comment!',
                      style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                    ),
                  ),
              ],
            ),
          ),
          // Comment input field
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    ),
                    onSubmitted: (value) {
                      if (value.trim().isNotEmpty) {
                        final newComment = Usercomment(
                          commenterImg: userData.myUserAccount.img,
                          commenterName: userData.myUserAccount.name,
                          commenterTime: 'Just now',
                          commenterContent: value.trim(),
                        );
                        setState(() {
                          _userPost.addComment(newComment);
                          _commentController.clear();
                        });
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    if (_commentController.text.trim().isNotEmpty) {
                      final newComment = Usercomment(
                        commenterImg: userData.myUserAccount.img,
                        commenterName: userData.myUserAccount.name,
                        commenterTime: 'Just now',
                        commenterContent: _commentController.text.trim(),
                      );
                      setState(() {
                        _userPost.addComment(newComment);
                        _commentController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommentDialog extends StatelessWidget {
  final String currentUserImg;
  final String currentUserName;
  final Function(Usercomment) onCommentAdded;

  const CommentDialog({
    super.key,
    required this.currentUserImg,
    required this.currentUserName,
    required this.onCommentAdded,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return AlertDialog(
      title: const Text('Add a Comment'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Write your comment...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_controller.text.trim().isNotEmpty) {
              final newComment = Usercomment(
                commenterImg: currentUserImg,
                commenterName: currentUserName,
                commenterTime: 'Just now',
                commenterContent: _controller.text.trim(),
              );
              onCommentAdded(newComment);
              Navigator.pop(context); // Close dialog after posting
            }
          },
          child: const Text('Post'),
        ),
      ],
    );
  }
}
