class VideoNewsItemModel {
  final int id;
  final String? thumb;
  final String title;
  final DateTime time;
  final String location;
  final String article;
  final String video;

  const VideoNewsItemModel(
    this.id,
    this.title,
    this.time,
    this.location,
    this.article,
    this.video, [
    this.thumb,
  ]);
}
