import 'dart:io';

class Instagram {
  // Maps userId to a list of their posts
  Map<int, List<int>> _posts;
  // Maps userId to a set of users they are following
  Map<int, Set<int>> _following;

  Instagram() {
    _posts = Map<int, List<int>>();
    _following = Map<int, Set<int>>();
  }

  void post(int userId, int postId) {
    if (!_posts.containsKey(userId)) {
      _posts[userId] = List<int>;
    }
    _posts[userId]?.add(postId);
  }

  void follow(int userA, int userB) {
    if (!_following.containsKey(userA)) {
      _following[userA] = Set<int>();
    }
    _following[userA]?.add(userB);
  }

  void getFeed(int userId) {
    Set<int> following = _following[userId];

    List<int> posts = List<int>;

    for (int user in following) {
      posts.addAll(_posts[user]);
    }

    posts.sort((a, b) => b - a);

    for (int i = 0; i < 10 && i < posts.length; i++) {
      print(posts[i]);
    }
  }
}

void main() {
  Instagram instagram = Instagram();

  while (true) {
    print("Enter a command (post, follow, feed, quit):");
    String command = stdin.readLineSync()?.trim();
    if (command == "quit") {
      break;
    }
    if (command == "post") {
      print("Enter userId:");
      int userId = int.parse(stdin.readLineSync()?.trim());
      print("Enter postId:");
      int postId = int.parse(stdin.readLineSync()?.trim());
      instagram.post(userId, postId);
    } else if (command == "follow") {
      print("Enter userA:");
      int userA = int.parse(stdin.readLineSync()?.trim());
      print("Enter userB:");
      int userB = int.parse(stdin.readLineSync()?.trim());
      instagram.follow(userA, userB);
    } else if (command == "feed") {
      print("Enter userId:");
      int userId = int.parse(stdin.readLineSync()?.trim());
      instagram.getFeed(userId);
    } else {
      print("Invalid command.");
    }
  }
}
