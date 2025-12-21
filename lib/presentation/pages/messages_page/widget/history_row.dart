import 'package:avatar_plus/avatar_plus.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_extractor/flutter_color_extractor.dart';
import 'package:flutter_svg/svg.dart';

class HistoryRow extends StatefulWidget {
  final BuildContext context;
  const HistoryRow({super.key, required this.context});

  @override
  State<HistoryRow> createState() => _HistoryRowState();
}

class _HistoryRowState extends State<HistoryRow> {
  static const _extractor = ColorExtractor();
  final List<Color> _colors = List.empty(growable: true);

  bool _isLoading = false;

  @override
  void initState() {
    _isLoading = true;
    _getColor().whenComplete(
      () {
        _isLoading = false;
        setState(() {});
      },
    );

    super.initState();
  }

  Future<void> _getColor() async {
    for (int i = 0; i < 12; i++) {
      final bytes = await SvgPicture.string(
        AvatarPlusGen.instance.generate("asd"),
      ).bytesLoader.loadBytes(widget.context);
      final data = bytes.buffer.asUint8List();
      final colors = await _extractor.extractColorsFromBytes(data);

      if (colors.isNotEmpty) {
        _colors.add(colors.last);
      } else {
        _colors.add(ColorsFoundation.surfaceBase);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              )
            ],
          )
        : ListView.separated(
            itemCount: 12,
            separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace24,
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            itemBuilder: (context, index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: _colors[index], width: 0.9.w),
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: 52.w,
                  height: 52.w,
                  decoration: BoxDecoration(
                    color: _colors[index],
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.string(
                    AvatarPlusGen.instance.generate("asd"),
                  ),
                ).paddingAll(EdgeInsetsFoundation.all4),
              ).paddingOnly(
                left: index == 0 ? SpacingFoundation.horizontalSpacing24 : 0,
                right: index == 12 ? SpacingFoundation.horizontalSpacing24 : 0,
              );
            },
          );
  }
}

String timeAgo(DateTime dateTime, {bool isUtc = false}) {
  final now = DateTime.now();
  final date = isUtc ? dateTime.toLocal() : dateTime;
  final difference = now.difference(date);

  if (difference.inSeconds < 5) {
    return 'just now';
  } else if (difference.inSeconds < 60) {
    return '${difference.inSeconds} sec ago';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} min ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
  } else if (difference.inDays < 30) {
    return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
  } else if (difference.inDays < 365) {
    final months = (difference.inDays / 30).floor();
    return '$months month${months > 1 ? 's' : ''} ago';
  } else {
    final years = (difference.inDays / 365).floor();
    return '$years year${years > 1 ? 's' : ''} ago';
  }
}
