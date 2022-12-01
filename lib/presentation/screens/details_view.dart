// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_with_solid/presentation/screens/edite_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:api_with_solid/data/models/post_model.dart';

import '../logic/crud_cubit/crud_cubit.dart';

class DetailsView extends StatelessWidget {
  final Post post;
  const DetailsView({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                post.title.toString(),
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            subtitle: Text(
              post.body.toString(),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                color: Colors.deepPurple.shade900,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => EditeView(post: post))));
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Edite',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  CrudCubit.get(context).deletePost(post.id!, context);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'delete',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
