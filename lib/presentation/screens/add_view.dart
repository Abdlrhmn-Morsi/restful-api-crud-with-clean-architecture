import 'package:api_with_solid/presentation/logic/crud_cubit/crud_cubit.dart';
import 'package:flutter/material.dart';

class AddView extends StatelessWidget {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'title',
              ),
              controller: titleController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                hintText: 'content',
              ),
              maxLines: null,
              controller: contentController,
            ),
            const SizedBox(height: 30),
            FittedBox(
              child: MaterialButton(
                color: Colors.deepPurple.shade900,
                onPressed: () {
                  CrudCubit.get(context).createPost(
                    title: titleController.text,
                    content: contentController.text,
                    context: context,
                  );
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
