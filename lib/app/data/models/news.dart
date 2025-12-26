import 'package:live_beer/app/constants/enums.dart';

class NewsModel {
  final String title;
  final String date;
  final NewsButtonType type;
  final String image;
  final String largeImage;
  final String description;

  const NewsModel({
    required this.title,
    required this.date,
    required this.type,
    required this.image,
    required this.largeImage,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date,
      'type': type,
      'image': image,
      'large_image': largeImage,
      'description': description,
    };
  }
}
