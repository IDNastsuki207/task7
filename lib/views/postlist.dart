import 'package:flutter/material.dart';
import 'package:socialmedia_clone/models/userdata.dart';
import 'package:socialmedia_clone/models/userpost.dart';
import 'package:socialmedia_clone/views/profile.view.dart';
class Postlist extends StatefulWidget {
  const Postlist({super.key, required this.userdata});

  final Userdata userdata;
  @override
  State<Postlist> createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {
  var nametxtStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  Future<void> gotoPage(BuildContext context, Userpost post) async {
    final updatedPost = await Navigator.push<Userpost>(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileView(userPost: post),
      ),
    );

    if (updatedPost != null) {
      // Update the post in the list if it was modified
      final index = widget.userdata.userList.indexWhere((p) => p == post);
      if (index != -1) {
        setState(() {
          widget.userdata.userList[index] = updatedPost;
        });
      }
    }
  }

  Widget buttons(Userpost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: (userPost.isLiked) ? Colors.blue : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            userPost.isLiked = (userPost.isLiked) ? false :true;
          });
        },
        icon: const Icon(Icons.thumb_up),
        label: const Text('Like'),
      ),

    TextButton.icon(
        style: TextButton.styleFrom(foregroundColor: Colors.grey),
        onPressed: () {},
        icon: const Icon(Icons.message),
        label: const Text('Comment'),
      ),

      TextButton.icon(
        style: TextButton.styleFrom(foregroundColor: Colors.grey),
        onPressed: () {},
        icon: const Icon(Icons.share),
        label: const Text('Share'),
      ),
    ],
  );


  Widget postCount(Userpost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text('${userPost.numcomments} Comments'),
      const Text(''),
      const SizedBox(width: 20),
      Text('${userPost.numshare} Shares'),
    ],
  );

  Widget postImage(Userpost userPost) => Padding(padding: const EdgeInsets.symmetric(vertical: 10),
  child: Container(
    height: 350,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(userPost.postimg),
        fit: BoxFit.fill 
      ),
    ),
  ),
  );

  Widget postHeader(Userpost userPost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userPost.userimg),
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
              const Icon(Icons.public, size: 15, color: Colors.grey),
            ],
          )
        ],
      )
    ],
  );

  Widget showPost(Userpost userPost) => InkWell(
    onTap: () => gotoPage(context, userPost),
    child: Column(
      children: [
        postHeader(userPost),
        Container(
          margin: const EdgeInsets.all(8),
          child: Row(children: [Text(userPost.postcontent, style: nametxtStyle,)],),
        ),
        postImage(userPost),
        postCount(userPost),
        const Divider(),
        buttons(userPost),
        SizedBox(height: 10, child: Container(color: Colors.grey)),
        const SizedBox(height: 15),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.userdata.userList.length,
      itemBuilder: (context, index) {
        final userPost = widget.userdata.userList[index];
        return showPost(userPost);
      },
    );
  }
}