class NewsListModel {
  final int id;
  final String? thumb;
  final String title;
  final DateTime time;
  final String location;

  const NewsListModel(
    this.id,
    this.title,
    this.time,
    this.location, [
    this.thumb,
  ]);
}

class VideoNewsListModel {
  final int id;
  final String? thumb;
  final String title;
  final DateTime time;
  final String location;
  final String video;

  const VideoNewsListModel(
    this.id,
    this.title,
    this.time,
    this.location,
    this.video, [
    this.thumb,
  ]);
}
