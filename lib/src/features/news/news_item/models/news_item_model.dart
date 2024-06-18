class NewsItemModel {
  final int id;
  final String? thumb;
  final String title;
  final DateTime time;
  final String location;
  final String article;

  const NewsItemModel(
    this.id,
    this.title,
    this.time,
    this.location,
    this.article, [
    this.thumb,
  ]);
}

class NewsItemScreenArguments {
  final int id;

  NewsItemScreenArguments(this.id);
}
