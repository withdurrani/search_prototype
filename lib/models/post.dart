enum PostType { post, survey, contest, undefined }

extension EnumString on String {
  PostType toPostType() {
    switch (this) {
      case 'POST':
        return PostType.post;
      case 'SURVEY':
        return PostType.survey;
      case 'CONTEST':
        return PostType.contest;
      default:
        return PostType.undefined;
    }
  }
}

class Post {
  late String id;
  String? createdAt;
  String? lastUpdatedAt;
  late PostType postType;
  String? name;
  UserInfo? userInfo;
  List<ShareLinks>? shareLinks;
  List<PostComments>? postComments;
  String? liked;
  LikesCount? likesCount;
  List<Likes>? likes;
  List<ContestPrizes>? contestPrizes;
  List<ActionButtons>? actionButtons;
  List<Assets>? assets;
  String? publishAt;
  bool? canEdit;
  bool? canDelete;
  bool? futureDated;
  bool? pinned;
  String? reward;
  String? viewUrl;
  String? activityType;
  UserInfo? activityUserInfo;
  String? text;
  int? favouriteCounter;
  String? deadlineAt;
  String? tcUrl;
  bool? canEnter;
  String? quizState;
  String? status;
  int? totalQuestions;
  int? completedQuestions;
  int? successRate;

  Post(
      {required this.id,
      this.createdAt,
      this.lastUpdatedAt,
      required this.postType,
      this.name,
      this.userInfo,
      this.shareLinks,
      this.postComments,
      this.liked,
      this.likesCount,
      this.likes,
      this.contestPrizes,
      this.actionButtons,
      this.assets,
      this.publishAt,
      this.canEdit,
      this.canDelete,
      this.futureDated,
      this.pinned,
      this.reward,
      this.viewUrl,
      this.activityType,
      this.activityUserInfo,
      this.text,
      this.favouriteCounter,
      this.deadlineAt,
      this.tcUrl,
      this.canEnter,
      this.quizState,
      this.status,
      this.totalQuestions,
      this.completedQuestions,
      this.successRate});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    lastUpdatedAt = json['lastUpdatedAt'];
    postType = json['postType'].toString().toPostType();
    name = json['name'];
    userInfo =
        json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
    if (json['shareLinks'] != null) {
      shareLinks = <ShareLinks>[];
      json['shareLinks'].forEach((v) {
        shareLinks!.add(ShareLinks.fromJson(v));
      });
    }
    if (json['postComments'] != null) {
      postComments = <PostComments>[];
      json['postComments'].forEach((v) {
        postComments!.add(PostComments.fromJson(v));
      });
    }
    liked = json['liked'];
    likesCount = json['likesCount'] != null
        ? LikesCount.fromJson(json['likesCount'])
        : null;
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(Likes.fromJson(v));
      });
    }
    if (json['contestPrizes'] != null) {
      contestPrizes = <ContestPrizes>[];
      json['contestPrizes'].forEach((v) {
        contestPrizes!.add(ContestPrizes.fromJson(v));
      });
    }
    if (json['actionButtons'] != null) {
      actionButtons = <ActionButtons>[];
      json['actionButtons'].forEach((v) {
        actionButtons!.add(ActionButtons.fromJson(v));
      });
    }
    if (json['assets'] != null) {
      assets = <Assets>[];
      json['assets'].forEach((v) {
        assets!.add(Assets.fromJson(v));
      });
    }
    publishAt = json['publishAt'];
    canEdit = json['canEdit'];
    canDelete = json['canDelete'];
    futureDated = json['futureDated'];
    pinned = json['pinned'];
    reward = json['reward'];
    viewUrl = json['viewUrl'];
    activityType = json['activityType'];
    activityUserInfo = json['activityUserInfo'] != null
        ? UserInfo.fromJson(json['activityUserInfo'])
        : null;
    text = json['text'];
    favouriteCounter = json['favouriteCounter'];
    deadlineAt = json['deadlineAt'];
    tcUrl = json['tcUrl'];
    canEnter = json['canEnter'];
    quizState = json['quizState'];
    status = json['status'];
    totalQuestions = json['totalQuestions'];
    completedQuestions = json['completedQuestions'];
    successRate = json['successRate'];
  }
}

class UserInfo {
  String? id;
  bool? guest;
  String? photoUrl;
  String? nickname;
  String? name;
  String? surname;
  String? type;
  String? displayName;

  UserInfo(
      {this.id,
      this.guest,
      this.photoUrl,
      this.nickname,
      this.name,
      this.surname,
      this.type,
      this.displayName});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guest = json['guest'];
    photoUrl = json['photoUrl'];
    nickname = json['nickname'];
    name = json['name'];
    surname = json['surname'];
    type = json['type'];
    displayName = json['displayName'];
  }
}

class ShareLinks {
  String? name;
  String? icon;
  String? shareUrl;

  ShareLinks({this.name, this.icon, this.shareUrl});

  ShareLinks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    shareUrl = json['shareUrl'];
  }
}

class PostComments {
  String? id;
  String? createdAt;
  String? lastUpdatedAt;
  String? text;
  UserInfo? userInfo;
  String? liked;
  LikesCount? likesCount;
  List<Likes>? likes;
  bool? display;
  String? type;

  PostComments(
      {this.id,
      this.createdAt,
      this.lastUpdatedAt,
      this.text,
      this.userInfo,
      this.liked,
      this.likesCount,
      this.likes,
      this.display,
      this.type});

  PostComments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    lastUpdatedAt = json['lastUpdatedAt'];
    text = json['text'];
    userInfo =
        json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
    liked = json['liked'];
    likesCount = json['likesCount'] != null
        ? LikesCount.fromJson(json['likesCount'])
        : null;
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(Likes.fromJson(v));
      });
    }
    display = json['display'];
    type = json['type'];
  }
}

class LikesCount {
  int? thumbUp;
  int? thumbDown;
  int? smile;

  LikesCount({this.thumbUp, this.thumbDown, this.smile});

  LikesCount.fromJson(Map<String, dynamic> json) {
    thumbUp = json['THUMB_UP'];
    thumbDown = json['THUMB_DOWN'];
    smile = json['SMILE'];
  }
}

class Likes {
  String? id;
  String? createdAt;
  String? lastUpdatedAt;
  UserInfo? userInfo;
  String? emotion;

  Likes(
      {this.id,
      this.createdAt,
      this.lastUpdatedAt,
      this.userInfo,
      this.emotion});

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    lastUpdatedAt = json['lastUpdatedAt'];
    userInfo =
        json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
    emotion = json['emotion'];
  }
}

class ContestPrizes {
  String? id;
  int? position;
  String? place;
  int? count;
  String? description;

  ContestPrizes(
      {this.id, this.position, this.place, this.count, this.description});

  ContestPrizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
    place = json['place'];
    count = json['count'];
    description = json['description'];
  }
}

class ActionButtons {
  String? actionUrl;
  String? actionDescription;
  String? actionTextColor;
  String? actionBackgroundColor;

  ActionButtons(
      {this.actionUrl,
      this.actionDescription,
      this.actionTextColor,
      this.actionBackgroundColor});

  ActionButtons.fromJson(Map<String, dynamic> json) {
    actionUrl = json['actionUrl'];
    actionDescription = json['actionDescription'];
    actionTextColor = json['actionTextColor'];
    actionBackgroundColor = json['actionBackgroundColor'];
  }
}

class Assets {
  String? id;
  String? createdAt;
  String? lastUpdatedAt;
  String? url;
  String? bucket;
  String? type;
  String? mimeType;
  int? filesize;
  int? width;
  int? height;
  int? durationSeconds;
  String? profileId;
  String? description;
  List<Thumbnails>? thumbnails;
  String? hash;

  Assets(
      {this.id,
      this.createdAt,
      this.lastUpdatedAt,
      this.url,
      this.bucket,
      this.type,
      this.mimeType,
      this.filesize,
      this.width,
      this.height,
      this.durationSeconds,
      this.profileId,
      this.description,
      this.thumbnails,
      this.hash});

  Assets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    lastUpdatedAt = json['lastUpdatedAt'];
    url = json['url'];
    bucket = json['bucket'];
    type = json['type'];
    mimeType = json['mimeType'];
    filesize = json['filesize'];
    width = json['width'];
    height = json['height'];
    durationSeconds = json['durationSeconds'];
    profileId = json['profileId'];
    description = json['description'];
    if (json['thumbnails'] != null) {
      thumbnails = <Thumbnails>[];
      json['thumbnails'].forEach((v) {
        thumbnails!.add(Thumbnails.fromJson(v));
      });
    }
    hash = json['hash'];
  }
}

class Thumbnails {
  String? id;
  String? createdAt;
  String? lastUpdatedAt;
  String? type;
  String? url;
  String? mimeType;
  int? filesize;
  int? width;
  int? height;
  int? durationSeconds;

  Thumbnails(
      {this.id,
      this.createdAt,
      this.lastUpdatedAt,
      this.type,
      this.url,
      this.mimeType,
      this.filesize,
      this.width,
      this.height,
      this.durationSeconds});

  Thumbnails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    lastUpdatedAt = json['lastUpdatedAt'];
    type = json['type'];
    url = json['url'];
    mimeType = json['mimeType'];
    filesize = json['filesize'];
    width = json['width'];
    height = json['height'];
    durationSeconds = json['durationSeconds'];
  }
}
