// users message list
List userMessages = [
  {
    "id" : 1,
    "name" : "Hoàng Dũng",
    "img" : "https://nhattientuu.com/wp-content/uploads/2020/08/hinh-anh-cute-7.jpg",
    "message" : "Chào bạn",
     "created_at" : "1 phút",
     "unread": true
  },
  {
    "id" : 2,
    "name" : "Hoàng Dũng",
    "img" : "https://nhattientuu.com/wp-content/uploads/2020/08/hinh-anh-cute-7.jpg",
    "message" : "Long time no see!!",
    "created_at" : "3 phút",
    "unread": true
  },
  {
    "id" : 3,
    "name" : "Andrew Garfield",
    "img" : "https://66.media.tumblr.com/d6642e68a1973fa3b0a2e5006e0ce89d/073056dd29a2ec59-81/s1280x1920/d5949b2596995b1665e6bf41b1c5f623ccd89e8b.jpg",
    "message": "Chào bạn",
    "created_at" : "30 phút",
    "unread": true
  },
  {
    "id" : 4,
    "name" : "Andrew Garfield",
    "img" : "https://66.media.tumblr.com/d6642e68a1973fa3b0a2e5006e0ce89d/073056dd29a2ec59-81/s1280x1920/d5949b2596995b1665e6bf41b1c5f623ccd89e8b.jpg",
    "message": "Hi you",
    "created_at" : "35 phút",
    "unread": false
  },
  {
    "id" : 5,
    "name" : "Andrew Garfield",
    "img" : "https://66.media.tumblr.com/d6642e68a1973fa3b0a2e5006e0ce89d/073056dd29a2ec59-81/s1280x1920/d5949b2596995b1665e6bf41b1c5f623ccd89e8b.jpg",
    "message": "What is your real name?",
     "created_at" : "55 phút",
     "unread": false
  },
  {
    "id" : 6,
    "name" : "Chris Evans",
    "img" : "https://tophinhanhdep.com/wp-content/uploads/2021/11/Cute-Seals-Wallpapers.jpg",
    "message": "I'm happy to be your friend",
    "created_at" : "13 giờ",
    "unread": false
  },
  {
    "id" : 7,
    "name" : "Mẫn Nguyễn",
    "img" : "https://i.pinimg.com/564x/e7/2e/85/e72e8598bd95b5b77da1f41cb4d7109a.jpg",
    "message": "Chào bạn",
    "created_at" : "11 ngày",
    "unread": false
  },
  {
    "id" : 8,
    "name" : "Quân AP",
    "img" : "https://th.bing.com/th/id/OIP.qe55cs-7S81KDy6VE_ENQAHaEK?pid=ImgDet&rs=1",
    "message": "I just arrived home.",
    "created_at" : "3 ngày",
    "unread": false
  },
  {
    "id" : 9,
    "name" : "Quân AP",
    "img" : "https://th.bing.com/th/id/OIP.qe55cs-7S81KDy6VE_ENQAHaEK?pid=ImgDet&rs=1",
    "message": "Chào bạn",
    "created_at" : "6 ngày",
    "unread": false
  }
];

// list of messages
List messages = [
      {
        "isMe" : true,
        "messageType" : 1,
        "message" : "Chào buổi chiều",
        "profileImg" : "https://nhattientuu.com/wp-content/uploads/2020/08/hinh-anh-cute-7.jpg"
      },
      {
        "isMe" : false,
        "messageType" : 2,
        "message" : "Xin chào bạn, mình tên là Tân, hân hạnh gặp bạn",
        "profileImg" : "https://nhattientuu.com/wp-content/uploads/2020/08/hinh-anh-cute-7.jpg"
      },
      {
        "isMe" : false,
        "messageType" : 3,
        "message" : "Mình 20 tuổi",
        "profileImg" : "https://nhattientuu.com/wp-content/uploads/2020/08/hinh-anh-cute-7.jpg"
      },
      {
        "isMe" : true,
        "messageType" : 1,
        "message" : "Bạn đã ăn này chưa",
        "profileImg" : "https://nhattientuu.com/wp-content/uploads/2020/08/hinh-anh-cute-7.jpg"
      },
      {
        "isMe" : true,
        "messageType" : 2,
        "message" : "Chào bạn",
        "profileImg" : "https://nhattientuu.com/wp-content/uploads/2020/08/hinh-anh-cute-7.jpg"
      },
      {
        "isMe" : false,
        "messageType" : 3,
        "message" : "Mình đã ăn rồi đó bạn. Từ khoảng một năm trước.",
        "profileImg" : "https://nhattientuu.com/wp-content/uploads/2020/08/hinh-anh-cute-7.jpg"
      },
      {
        "isMe" : false,
        "messageType" : 1,
        "message" : "Rất ngon",
        "profileImg" : "https://nhattientuu.com/wp-content/uploads/2020/08/hinh-anh-cute-7.jpg"
      },
      {
        "isMe" : true,
        "messageType" : 3,
        "message" : "Bạn hay làm gì khi rảnh rỗi",
        "profileImg" : "https://nhattientuu.com/wp-content/uploads/2020/08/hinh-anh-cute-7.jpg"
      },
      {
        "isMe" : false,
        "messageType" : 1,
        "message" : "Nghe nhạc",
        "profileImg" : "https://nhattientuu.com/wp-content/uploads/2020/08/hinh-anh-cute-7.jpg"
      },
      {
        "isMe" : false,
        "messageType" : 2,
        "message" : "Hoặc mình sẽ xem phim",
        "profileImg" : "https://nhattientuu.com/wp-content/uploads/2020/08/hinh-anh-cute-7.jpg0"
      },
      {
        "isMe" : true,
        "messageType" : 3,
        "message" : "À còn mình thì sẽ vẽ",
        "profileImg" : "https://nhattientuu.com/wp-content/uploads/2020/08/hinh-anh-cute-7.jpg"
      },
      {
        "isMe" : true,
        "messageType" : 4,
        "message" : "Bye bye",
        "profileImg" : "https://nhattientuu.com/wp-content/uploads/2020/08/hinh-anh-cute-7.jpg"
      },
      {
        "isMe" : false,
        "messageType" : 4,
        "message" : "Pai pai",
        "profileImg" : "https://nhattientuu.com/wp-content/uploads/2020/08/hinh-anh-cute-7.jpg"
      }
    ];

