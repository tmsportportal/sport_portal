import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/network/dio_helper.dart';

class CachingImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fit;
  final Color? color;

  const CachingImage(this.imageUrl, {super.key, this.fit, this.color});

  @override
  Widget build(BuildContext context) {
    return imageUrl == null
        ? const SizedBox.expand(
            child: ColoredBox(color: Color(0xFFE9E9E9)),
          )
        : CachedNetworkImage(
            fit: fit ?? BoxFit.contain,
            imageUrl: "${Configs.baseUrl}/$imageUrl",
            width: double.infinity,
            color: color,
            errorWidget: (context, _, __) => const SizedBox.expand(
              child: ColoredBox(
                color: Color(0xFFE9E9E9),
              ),
            ),
            progressIndicatorBuilder: (context, _, progress) {
              return const SizedBox.expand(
                child: ColoredBox(
                  color: Color(0xFFE9E9E9),
                ),
              );
            },
          );
  }
}
