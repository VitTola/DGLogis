import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../consts/app_color.dart';

class MGallaryPicker extends StatefulWidget {
  final String type;
  const MGallaryPicker({super.key, required this.type});

  @override
  State<StatefulWidget> createState() => _MGallaryPickerState();
}

class _MGallaryPickerState extends State<MGallaryPicker> {
  XFile? _pickedFile;
  Uint8List? _video_thumnail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.type == 'image' ? _pickImage() : _pickVideo(),
      child: Column(children: [
        ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(72),
          child: Container(
            width: 72,
            height: 72,
            decoration: const BoxDecoration(
              color: AppColor.boldGrey,
            ),
            child: _pickedFile != null
                ? widget.type == 'image'
                    ? Image.file(
                        File(_pickedFile!.path),
                        fit: BoxFit.cover,
                      )
                    : Stack(
                        fit: StackFit.expand,
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.memory(
                            _video_thumnail!,
                            fit: BoxFit.cover,
                          ),
                          const Icon(
                            Icons.play_circle,
                            color: Colors.white,
                            shadows: [
                              Shadow(color: AppColor.black50, blurRadius: 10)
                            ],
                          ),
                        ],
                      )
                : Image.asset(
                    'assets/images/placeholder.png',
                  ),
          ),
        ),
      ]),
    );
  }

  void _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  void _pickVideo() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      Uint8List? uint8list = await VideoThumbnail.thumbnailData(
        video: pickedFile.path,
        imageFormat: ImageFormat.JPEG,
        maxWidth:
            250, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
        quality: 25,
      );
      pickedFile.path;

      setState(() {
        _pickedFile = pickedFile;
        _video_thumnail = uint8list;
      });
    }
  }
}
