import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resume_builder_app/controller/resume_provider.dart';
import 'package:resume_builder_app/view/pages/add_or_edit_resume_page.dart';
import 'package:resume_builder_app/view/pages/view_resume_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerWidget {
  final ValueNotifier<bool> themeNotifier;
  const HomePage({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Change theme
    void changeTheme() async {
      themeNotifier.value = !themeNotifier.value;
      (await SharedPreferences.getInstance())
          .setBool('theme', themeNotifier.value);
    }

    /// Add a new resume
    void addNewResume() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddNewResumePage(),
          ));
    }

    /// View the resume
    void viewResume(int index) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewResumePage(
              index: index,
            ),
          ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quick Resume"),
        actions: [
          IconButton(
            onPressed: changeTheme,
            icon:
                Icon(themeNotifier.value ? Icons.light_mode : Icons.dark_mode),
          )
        ],
      ),
      body: ref.watch(resumeProvider).isEmpty
          ? const Center(
              child: Text("Add a new resume"),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                final resume = ref.watch(resumeProvider)[index];

                return ListTile(
                  onTap: () => viewResume(index),
                  title: Text(resume.name),
                  leading: CircleAvatar(
                    radius: 15,
                    child: Text("${index + 1}"),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: ref.watch(resumeProvider).length,
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => addNewResume(),
        label: const Text(
          "Add New Resume",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
