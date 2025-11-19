import 'package:socialmedia_clone/models/account.dart';
import 'package:socialmedia_clone/models/friend.dart';
import 'package:socialmedia_clone/models/usercomment.dart';
import 'package:socialmedia_clone/models/userpost.dart';

class Userdata {
  List<Userpost> userList = [
    Userpost(
      userimg: 'assets/friend1.jpg',
      username: 'Angelica',
      time: '2 hrs ago',
      postcontent: 'Take the Risk!!!',
      postimg: 'assets/post1.jpg',
      numcomments: '10k',
      numshare: '11.3k',
      isLiked: false,
      comments: [
        Usercomment(
          commenterImg: 'assets/friend2.jpg',
          commenterName: 'Yuji', 
          commenterTime: '3 hrs ago', 
          commenterContent: 'hala ka oie',
        ),
        Usercomment(
          commenterImg: 'assets/friend5.jpg',
          commenterName: 'Saitama', 
          commenterTime: '5 hrs ago', 
          commenterContent: 'Kuyaw',
        ),
      ],
    ),

    Userpost(
      userimg: 'assets/friend2.jpg',
      username: 'Yuji',
      time: '2 hrs ago',
      postcontent: 'Be my Devil',
      postimg: 'assets/post2.jpg',
      numcomments: '14.3k',
      numshare: '55.3k',
      isLiked: false,
      comments: [
        Usercomment(
          commenterImg: 'assets/friend3.jpg',
          commenterName: 'Gojo', 
          commenterTime: '3 hrs ago', 
          commenterContent: 'Sugoi',
        ),
      ],
    ),

    Userpost(
      userimg: 'assets/friend3.jpg',
      username: 'Gojo',
      time: '3 hrs ago',
      postcontent: 'I alone is the honored One',
      postimg: 'assets/post3.jpg',
      numcomments: '12.8k',
      numshare: '56.2k',
      isLiked: false,
      comments: [
        Usercomment(
          commenterImg: 'assets/friend2.jpg',
          commenterName: 'Yuji', 
          commenterTime: '4 hrs ago', 
          commenterContent: 'Sensei cool!',
        ),
        Usercomment(
          commenterImg: 'assets/friend5.jpg',
          commenterName: 'Saitama', 
          commenterTime: '5 hrs ago', 
          commenterContent: 'Unli power naman!',
        ),
      ],
    ),

    Userpost(
      userimg: 'assets/post4.jpg',
      username: 'Sakamoto',
      time: '4 hrs ago',
      postcontent: 'Bangon',
      postimg: 'assets/friend6.jpg',
      numcomments: '60.7k',
      numshare: '90.1k',
      isLiked: false,
      comments: [
        Usercomment(
          commenterImg: 'assets/friend1.jpg',
          commenterName: 'Angelica', 
          commenterTime: '5 hrs ago', 
          commenterContent: 'Push lang!',
        ),
        Usercomment(
          commenterImg: 'assets/friend3.jpg',
          commenterName: 'Gojo', 
          commenterTime: '6 hrs ago', 
          commenterContent: 'Respect 💪',
        ),
      ],
    ),
  ];

  List<Friend> friendList = [
    Friend(img: 'assets/friend1.jpg', name: 'Angelica'),
    Friend(img: 'assets/friend2.jpg', name: 'Yuji'),
    Friend(img: 'assets/friend3.jpg', name: 'Gojo'),
    Friend(img: 'assets/friend4.jpg', name: 'Gintoki'),
    Friend(img: 'assets/friend5.jpg', name: 'Saitama'),
    Friend(img: 'assets/friend6.jpg', name: 'Sakamoto'),
  ];

  Account myUserAccount = Account(
    name: 'Israel Diputado', 
    email: 'duisrael40@gmail.com', 
    img: 'assets/Israel.png', 
    numFollowers: '2.01M', 
    numPosts: '10', 
    numFollowing: '1', 
    numFriends: '10k',
  );

  get commentList => null;
}
