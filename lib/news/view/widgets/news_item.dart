import 'package:flutter/material.dart';
import 'package:news_x/news/data/models/news_model.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          newsModel.imageUrl,
          height: MediaQuery.sizeOf(context).height * 0.26,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          newsModel.sourceName,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text(
          newsModel.title,
          style: Theme.of(context).textTheme.titleSmall,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Text(
            newsModel.date,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    );
  }
}
