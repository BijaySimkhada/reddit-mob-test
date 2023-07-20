class PostModel {
  String? title;
  String? selfText;
  num ups;
  String? author;
  String? url;

  PostModel(
      {this.title, this.selfText, required this.ups, this.author, this.url});

  PostModel.fromJson(Map<String, dynamic> json)
      : title = json['data']['title'],
        url = json['data']['permalink'],
        ups = json['data']['ups'],
        selfText =
            json['data']['selftext'] == "" ? null : json['data']['selftext'],
        author = json['data']['author'];
}
