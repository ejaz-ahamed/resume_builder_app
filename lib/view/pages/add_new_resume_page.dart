import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Model class to handle the text editing controller
final class TextEditingControllers {
  final TextEditingController titleController;
  final TextEditingController contentController;

  TextEditingControllers({
    required this.contentController,
    required this.titleController,
  });
}

class AddNewResumePage extends HookConsumerWidget {
  /// The index of the resume to edit
  final int? index;
  const AddNewResumePage({
    super.key,
    required this.index,
  });
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
