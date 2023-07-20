import 'package:flutter/material.dart';
import 'package:reddit/constant/text_style.dart';
import 'package:reddit/module/model/post_model.dart';
import 'package:reddit/module/screens/post_details/post_details.dart';
import 'package:reddit/service/dio_service.dart';

class RedditCard extends StatelessWidget {
  PostModel data;
  RedditCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
               Text(data.author!),
             ],
           ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.deepOrange,
                ),
                Text(
                  "${data.ups}",
                  style: lightText,
                )
              ],
            )
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            data.title!,
            style: bodyText,
          ),
        ),
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => PostDetails(data: data))),
      ),
    );
  }
}
