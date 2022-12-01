// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_with_solid/presentation/logic/crud_cubit/crud_cubit.dart';
import 'package:flutter/material.dart';

import 'package:api_with_solid/data/models/post_model.dart';

class EditeView extends StatelessWidget {
  final Post post;
  EditeView({
    Key? key,
    required this.post,
  }) : super(key: key);
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = post.title;
    contentController.text = post.body;
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
              controller: titleController,
            ),
            const SizedBox(height: 20),
            TextField(
              maxLines: null,
              controller: contentController,
            ),
            const SizedBox(height: 30),
            FittedBox(
              child: MaterialButton(
                color: Colors.deepPurple.shade900,
                onPressed: () {
                  CrudCubit.get(context).updatePost(
                    id: post.id,
                    title: titleController.text,
                    content: contentController.text,
                    context: context,
                  );
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Update',
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
