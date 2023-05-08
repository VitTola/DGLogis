import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/components/m_gallery_picker.dart';
import 'package:skailab_dg_logis_app/dispute/models/dispute_reason.dart';

class DisputeReasonsCard extends StatefulWidget {
  final String title;
  final List<DisputeReason> reasons;

  const DisputeReasonsCard(
      {super.key, required this.title, required this.reasons});

  @override
  State<StatefulWidget> createState() => _DisputeReasonsCardState();
}

class _DisputeReasonsCardState extends State<DisputeReasonsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            spacing: 8,
            children: List<Widget>.generate(widget.reasons.length, (index) {
              return ChoiceChip(
                  onSelected: (bool selected) =>
                      setState(() => widget.reasons[index].selected = selected),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  avatar: widget.reasons[index].selected
                      ? const Icon(
                          Icons.done,
                          size: 12,
                        )
                      : null,
                  label: Text(
                    widget.reasons[index].label,
                  ),
                  selected: widget.reasons[index].selected);
            }).toList(),
          ),
          const SizedBox(height: 16),
          const Text(
            "References",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Column(
                children: const [
                  MGallaryPicker(type: 'image'),
                  Text(
                    'Picture',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                children: const [
                  MGallaryPicker(type: 'video'),
                  Text(
                    'Video',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
