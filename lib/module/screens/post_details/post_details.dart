import 'package:flutter/material.dart';
import 'package:reddit/constant/text_style.dart';
import 'package:reddit/module/components/reddit_comment.dart';
import 'package:reddit/module/model/post_model.dart';
import 'package:reddit/service/dio_service.dart';

class PostDetails extends StatefulWidget {
  PostModel? data;
  PostDetails({required this.data, super.key});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  List<dynamic> commentList = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    commentList = await DioService().getDataDetails(widget.data!.url!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reddit r/Books"),
        actions: const [
          Icon(Icons.reddit),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data!.title!,
                style: header1,
              ),
              // const Divider(color: Colors.deepOrange),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.data!.selfText == null ? '' : widget.data!.selfText!,
                style: bodyText,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    '- ${widget.data!.author!}',
                    style: lightText,
                  ),
                ],
              ),
              const Divider(color: Colors.deepOrange),
              CommentWidget(comments: commentList)
            ],
          ),
        ),
      ),
    );
  }
}
