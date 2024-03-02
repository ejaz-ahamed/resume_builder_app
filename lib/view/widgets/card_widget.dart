import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;

  /// Callback to execute when the delete button is clicked
  final VoidCallback onDeletePressed;

  /// Callback to execute when the up arrow clicked
  final VoidCallback onUpPressed;

  /// Callback to execute when the down arrow clicked
  final VoidCallback onDownPressed;

  const CardWidget({
    super.key,
    required this.titleController,
    required this.contentController,
    required this.onDeletePressed,
    required this.onUpPressed,
    required this.onDownPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: Theme.of(context).shadowColor.withAlpha(60)),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Title',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Container(
              height: 60,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.black.withOpacity(.30))),
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: InputBorder.none,
                    hintText: 'Enter title here...'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Content',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Container(
              height: 150,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.black.withOpacity(.30))),
              child: TextField(
                controller: contentController,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: InputBorder.none,
                    hintText: 'Enter content here...'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: onUpPressed,
                      icon: const Icon(Icons.arrow_upward)),
                  IconButton(
                      onPressed: onDownPressed,
                      icon: const Icon(Icons.arrow_downward_outlined)),
                  const Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: onDeletePressed,
                    icon: const Icon(Icons.delete),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
