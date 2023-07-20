class CommentModel {
  String? body;
  String? commentBy;
  List<dynamic> replies;

  CommentModel(
      {required this.body,
      required this.commentBy,
      this.replies = const <dynamic>[]});

  CommentModel.fromJson(Map<String, dynamic> json)
      : body = json['data']['body'],
        commentBy = json['data']['author'],
        replies =
            json['data']['replies'] == "" || json['data']['replies'] == null
                ? []
                : json['data']['replies']["data"]["children"]
                    .map((reply) => CommentModel.fromJson(reply))
                    .toList();
}
