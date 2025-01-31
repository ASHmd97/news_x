import 'package:flutter/material.dart';
import 'package:news_x/news/view/widgets/news_list.dart';
import 'package:news_x/sources/data/models/source_model.dart';
import 'package:news_x/sources/view/widgets/source_item.dart';

class SourcesTabs extends StatefulWidget {
  const SourcesTabs({super.key, required this.sources});
  final List<SourceModel> sources;

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            onTap: (value) {
              selectedTabIndex = value;
              setState(() {});
            },
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            tabs: widget.sources
                .map(
                  (source) => SourceItem(
                    sourceName: source.name,
                    isSelected:
                        widget.sources.indexOf(source) == selectedTabIndex,
                  ),
                )
                .toList(),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
            tabAlignment: TabAlignment.start,
          ),
        ),
        Expanded(child: NewsList(sourceId: widget.sources[selectedTabIndex].id))
      ],
    );
  }
}
