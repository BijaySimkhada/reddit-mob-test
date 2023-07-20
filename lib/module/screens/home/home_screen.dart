import 'package:flutter/material.dart';
import 'package:reddit/module/components/reddit_card.dart';
import 'package:reddit/service/dio_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic>? data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    data = await DioService().getRedditData();
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
        body: data != null
            ? ListView.builder(
                itemBuilder: (BuildContext context, index) {
                  return RedditCard(
                    data: data![index],
                  );
                },
                itemCount: data!.length,
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
