
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:innsouls_flutter/app/widgets/app_shimmer.dart';
import 'package:octo_image/octo_image.dart';

class CustomImageWidget extends StatelessWidget {
  final String? imageUrl;
  final Size? size;
  final double? height, width, radius;
  final BorderRadius? borderRadius;
  final Color? color;
  final BoxFit? fit;
  final bool? enableGreyScale;
  final Widget? placeholder;

  const CustomImageWidget({
    super.key,
    required this.imageUrl,
    this.size,
    this.radius,
    this.borderRadius,
    this.color,
    this.height,
    this.width,
    this.fit,
    this.enableGreyScale,
    this.placeholder,
  }) : assert(
          borderRadius == null || radius == null,
          'Cannot provide both a borderRadius and a radius\n',
        );

  @override
  Widget build(BuildContext context) {
    return (radius != null || borderRadius != null)
        ? ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular((radius ?? 0)),
            child: enableGreyScale == null || enableGreyScale == false
                ? child
                : ColorFiltered(
                    colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.saturation),
                    child: child,
                  ),
          )
        : child;
  }

  Widget get child => imageUrl == null || (imageUrl != null && imageUrl!.isEmpty)
      ? placeholder ?? _placeholder
      : (GetUtils.isURL(imageUrl!) || imageUrl!.startsWith('https') || imageUrl!.startsWith('http')
          ? OctoImage(
              image: CachedNetworkImageProvider(imageUrl!),
              errorBuilder: (context, error, stackTrace) => placeholder ?? _placeholder,
              fadeInDuration: const Duration(milliseconds: 300),
              placeholderFadeInDuration: const Duration(milliseconds: 300),
              fit: fit ?? BoxFit.cover,
              width: width ?? size?.width,
              height: height ?? size?.height,
              color: color,
            )
          : imageUrl!.startsWith("assets/")
              ? imageUrl!.toLowerCase().endsWith(".svg")
                  ? SvgPicture.asset(
                      imageUrl!,
                      width: width ?? size?.width,
                      height: height ?? size?.height,
                      fit: fit ?? BoxFit.cover,
                      colorFilter: color == null ? null : ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn),
                    )
                  : Image(
                      image: AssetImage(imageUrl!),
                      width: width ?? size?.width,
                      height: height ?? size?.height,
                      fit: fit ?? BoxFit.cover,
                      color: color,
                    )
              : (File(imageUrl!).existsSync()
                  ? imageUrl!.toLowerCase().endsWith(".svg")
                      ? SvgPicture.file(
                          File(imageUrl!),
                          width: width ?? size?.width,
                          height: height ?? size?.height,
                          fit: fit ?? BoxFit.cover,
                          colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
                        )
                      : Image.file(
                          File(imageUrl!),
                          width: width ?? size?.width,
                          height: height ?? size?.height,
                          fit: fit ?? BoxFit.cover,
                          color: color,
                        )
                  : _placeholder));
  Widget get _placeholder => SizedBox(
        width: width ?? size?.width,
        height: height ?? size?.height,
        child: const AppShimmer(),
      );


  }
