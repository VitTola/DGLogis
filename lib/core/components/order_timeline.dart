import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:skailab_dg_logis_app/core/consts/app_color.dart';

class OrderTimeline extends StatefulWidget {
  const OrderTimeline({super.key});

  @override
  State<OrderTimeline> createState() => _OrderTimelineState();
}

class _OrderTimelineState extends State<OrderTimeline> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        TimelineItem(
          icon: LineIcons.store,
          color: AppColor.deliveryInState,
        ),
        Expanded(child: SizedBox(width: 5)),
        Icon(LineIcons.minus, size: 40, color: AppColor.deliveryInState),
        Expanded(child: SizedBox(width: 5)),
        TimelineItem(
          icon: LineIcons.truckMoving,
          color: AppColor.deliveryInState,
        ),
        Expanded(child: SizedBox(width: 5)),
        Icon(
          LineIcons.minus,
          size: 40,
        ),
        Expanded(child: SizedBox(width: 5)),
        TimelineItem(
          icon: LineIcons.home,
        ),
        Expanded(child: SizedBox(width: 5)),
        Icon(
          LineIcons.minus,
          size: 40,
        ),
        Expanded(child: SizedBox(width: 5)),
        TimelineItem(
          icon: Icons.handshake_rounded,
          isLastItem: true,
        ),
      ],
    );
  }
}

class TimelineItem extends StatefulWidget {
  final bool isLastItem;
  final IconData icon;
  final bool isCurrent;
  final Color color;
  const TimelineItem(
      {super.key,
      this.isLastItem = false,
      required this.icon,
      this.isCurrent = false,
      this.color = Colors.black});

  @override
  State<TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<TimelineItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.icon,
          size: 40,
          color: widget.color,
        ),
      ],
    );
  }
}
