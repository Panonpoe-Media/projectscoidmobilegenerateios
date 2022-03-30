/*
class UserRole {
  final int id;
  final String name;

  UserRole({
    this.id,
    this.name,
  });
}

// USER_ROLE
final UserRole owner = UserRole(id: 1, name: 'Owner');
final UserRole worker = UserRole(id: 2, name: 'Worker');
*/

enum UserType {owner, worker, admin}
enum UserRole {none, bidder, selected_worker, seller}

/*

extension UserTypeExtension on UserType {
  static const names = {
    UserType.admin: 'Admin',
    UserType.owner: 'Owner',
    UserType.worker: 'Worker',
  };

  String get name => names[this];
  
}


enum UserRole {none, bidder, selected_worker, seller}

extension UserRoleExtension on UserRole {
  final names = {
    UserRole.none: 'None',
    UserRole.bidder: 'Bidder',
    UserRole.selected_worker: 'Selected Worker',
    UserRole.seller: 'Seller',
  };

  String get name => names[this];
}


 */


class UserModel {
  String? sId;
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? imageUrl;
  String? fullName;
  int? age;
  String? gender;

  UserModel(
      {this.sId,
        this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.birthDate,
        this.imageUrl,
        this.fullName,
        this.age,
        this.gender});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json != null && json['_id'] != null ? json['_id'] : null;
    id = json != null && json['id'] != null ? json['id'] : null;
    email = json != null && json['email'] != null ? json['email'] : null;
    firstName =
    json != null && json['firstName'] != null ? json['firstName'] : null;
    lastName =
    json != null && json['lastName'] != null ? json['lastName'] : null;
    birthDate =
    json != null && json['birthDate'] != null ? json['birthDate'] : null;
    imageUrl =
    json != null && json['imageUrl'] != null ? json['imageUrl'] : null;
    fullName =
    json != null && json['fullName'] != null ? json['fullName'] : null;
    age = json != null && json['age'] != null ? json['age'] : null;
    gender = json != null && json['gender'] != null ? json['gender'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['birthDate'] = this.birthDate;
    data['imageUrl'] = this.imageUrl;
    data['fullName'] = this.fullName;
    data['age'] = this.age;
    data['gender'] = this.gender;
    return data;
  }
}

class User {
  final int? id;
  final String? name;
  final String? avatarUrl;
  final String? status;
  final bool? isonline;
  final String? lastseen;
  final UserRole? userrole;
  final UserType? usertype;
  final int? rating;
  final int? ranking;
  final bool? hasunseenmsg;
  final int? unseencount;
  final String? lastmsg;
  final String? lastmsgtime;
  final bool? seen;

  User({
    this.id,
    this.name,
    this.avatarUrl,
    this.status,
    this.isonline,
    this.lastseen,
    this.userrole,
    this.usertype,
    this.rating,
    this.ranking,
    this.hasunseenmsg,
    this.unseencount,
    this.lastmsg,
    this.lastmsgtime,
    this.seen,
  });
}

// CURRENT_USER
final User currentUser = User(
  id: 0,
  name: 'Current User',
  avatarUrl: 'assets/images/greg.jpg',
  userrole: UserRole.none,
  usertype: UserType.owner,
  isonline: true,
  hasunseenmsg: false,
  unseencount: 0,
);

// USERS
final User greg = User(
    id: 1,
    name: 'Greg',
    avatarUrl: 'assets/images/greg.jpg',
    userrole: UserRole.none,
    usertype: UserType.owner,
    isonline: true,
    rating: 5,
    ranking: 10,
    hasunseenmsg: false,
    unseencount: 0,
    lastmsg: 'Hey, how\'s it going? What did you do today?',
    lastmsgtime: '11:30 AM',
    seen: false);
final User james = User(
    id: 2,
    name: 'James',
    avatarUrl: 'assets/images/james.jpg',
    userrole: UserRole.none,
    usertype: UserType.worker,
    isonline: true,
    rating: 4,
    ranking: 75,
    hasunseenmsg: false,
    unseencount: 0,
    lastmsg: 'Hey Flutter, you are so amazing!',
    lastmsgtime: '10:15 AM',
    seen: true,);
final User john = User(
    id: 3,
    name: 'John',
    avatarUrl: 'assets/images/john.jpg',
    userrole: UserRole.none,
    usertype: UserType.worker,
    isonline: true,
    rating: 4,
    ranking: 90,
    hasunseenmsg: true,
    unseencount: 3,
    lastmsg: 'I personally think that an enum should be able to store const values',
    lastmsgtime: '3:30 PM',
    seen: false,);
final User olivia = User(
    id: 4,
    name: 'Olivia',
    avatarUrl: 'assets/images/olivia.jpg',
    userrole: UserRole.none,
    usertype: UserType.worker,
    isonline: false,
    rating: 3,
    ranking: 275,
    hasunseenmsg: false,
    unseencount: 0,
    lastmsg: 'I couldn\'t find relevant issue which is strange, so if it already exists please pardon me.',
    lastmsgtime: '4:30 PM',
    seen: false,);
final User sam = User(
    id: 5,
    name: 'Sam',
    avatarUrl: 'assets/images/sam.jpg',
    userrole: UserRole.none,
    usertype: UserType.worker,
    isonline: true,
    rating: 2,
    ranking: 400,
    hasunseenmsg: true,
    unseencount: 2,
    lastmsg: 'Starting with Dart 2.6 you can define extensions on classes.',
    lastmsgtime: '12:30 PM',
    seen: false,);
final User sophia = User(
    id: 3,
    name: 'Sophia',
    avatarUrl: 'assets/images/sophia.jpg',
    userrole: UserRole.none,
    usertype: UserType.worker,
    isonline: false,
    rating: 2,
    ranking: 375,
    hasunseenmsg: false,
    unseencount: 0,
    lastmsg: 'This is fine, but what if we had the value of the status stored as a String, and wanted to convert it into a PizzaStatusEnum?',
    lastmsgtime: '2:30 PM',
    seen: true,);
final User steven = User(
    id: 7,
    name: 'Steven',
    avatarUrl: 'assets/images/steven.jpg',
    userrole: UserRole.none,
    usertype: UserType.worker,
    isonline: true,
    rating: 1,
    ranking: 750,
    hasunseenmsg: true,
    unseencount: 2,
    lastmsg: 'I come from an iOS background and recently decided to learn about Flutter. I am curios to know if things like Protocols and Enums exist in the Dart Programming',
    lastmsgtime: '1:30 PM',
    seen: false);

// Example threads on thread screen
List<User> buddylist = [
  new User(
    id: 1,
    name: 'Greg',
    avatarUrl: 'assets/images/greg.jpg',
    userrole: UserRole.none,
    usertype: UserType.owner,
    isonline: true,
    rating: 5,
    ranking: 10,
    hasunseenmsg: false,
    unseencount: 0,
    lastmsg: 'Hey, how\'s it going? What did you do today?',
    lastmsgtime: '11:30 AM',
    seen: true,
  ),
  new User(
    id: 2,
    name: 'James',
    avatarUrl: 'assets/images/james.jpg',
    userrole: UserRole.none,
    usertype: UserType.worker,
    isonline: true,
    rating: 4,
    ranking: 75,
    hasunseenmsg: false,
    unseencount: 0,
    lastmsg: 'Hey Flutter, you are so amazing!',
    lastmsgtime: '10:15 AM',
    seen: true,
  ),
  new User(
    id: 3,
    name: 'John',
    avatarUrl: 'assets/images/john.jpg',
    userrole: UserRole.none,
    usertype: UserType.worker,
    isonline: true,
    rating: 4,
    ranking: 90,
    hasunseenmsg: true,
    unseencount: 3,
    lastmsg: 'I personally think that an enum should be able to store const values',
    lastmsgtime: '3:30 PM',
    seen: false,
  ),
  new User(
    id: 4,
    name: 'Olivia',
    avatarUrl: 'assets/images/olivia.jpg',
    userrole: UserRole.none,
    usertype: UserType.worker,
    isonline: false,
    rating: 3,
    ranking: 275,
    hasunseenmsg: false,
    unseencount: 0,
    lastmsg: 'I couldn\'t find relevant issue which is strange, so if it already exists please pardon me.',
    lastmsgtime: '4:30 PM',
    seen: true,
  ),
  new User(
    id: 5,
    name: 'Sam',
    avatarUrl: 'assets/images/sam.jpg',
    userrole: UserRole.none,
    usertype: UserType.worker,
    isonline: true,
    rating: 2,
    ranking: 400,
    hasunseenmsg: true,
    unseencount: 2,
    lastmsg: 'Starting with Dart 2.6 you can define extensions on classes.',
    lastmsgtime: '12:30 PM',
    seen: false,
  ),
  new User(
    id: 3,
    name: 'Sophia',
    avatarUrl: 'assets/images/sophia.jpg',
    userrole: UserRole.none,
    usertype: UserType.worker,
    isonline: false,
    rating: 2,
    ranking: 375,
    hasunseenmsg: false,
    unseencount: 0,
    lastmsg: 'This is fine, but what if we had the value of the status stored as a String, and wanted to convert it into a PizzaStatusEnum?',
    lastmsgtime: '2:30 PM',
    seen: true,
  ),
  new User(
    id: 7,
    name: 'Steven',
    avatarUrl: 'assets/images/steven.jpg',
    userrole: UserRole.none,
    usertype: UserType.worker,
    isonline: true,
    rating: 1,
    ranking: 750,
    hasunseenmsg: true,
    unseencount: 2,
    lastmsg: 'I come from an iOS background and recently decided to learn about Flutter. I am curios to know if things like Protocols and Enums exist in the Dart Programming',
    lastmsgtime: '1:30 PM',
    seen: false,
  ),
];