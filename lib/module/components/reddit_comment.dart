import 'package:flutter/material.dart';
import 'package:reddit/constant/text_style.dart';
import 'package:reddit/module/model/comment_model.dart';

class CommentWidget extends StatelessWidget {
  List<dynamic> comments;
  CommentWidget({required this.comments, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: comments[index].body != null ||
                      comments[index].commentBy != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.reddit,
                              color: Colors.deepOrange,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              comments[index].commentBy ?? '',
                              style: bodyText,
                            ),
                          ],
                        ),
                        const Divider(color: Colors.deepOrange),
                        Text(comments[index].body ?? ''),
                        comments[index].replies.length != 0
                            ? comments[index].replies.length == 1
                                ? comments[index].replies[0].commentBy != null
                                    ? ExpansionTile(
                                        title: const Text("Replies"),
                                        children: [
                                          CommentWidget(
                                              comments: comments[index].replies)
                                        ],
                                      )
                                    : const SizedBox()
                                : const SizedBox()
                            : const SizedBox(),
                      ],
                    )
                  : const SizedBox(),
            ),
          );
        },
        itemCount: comments.length,
      ),
    );
  }
}
