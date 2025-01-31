import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_x/news/data/models/news_model.dart';
import 'package:news_x/shared/app_theme.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: newsModel.imageUrl,
            height: MediaQuery.sizeOf(context).height * 0.26,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: AppTheme.primary,
              ),
            ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.image_not_supported),
            ),
          ),
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
