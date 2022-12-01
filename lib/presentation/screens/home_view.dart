import 'package:api_with_solid/presentation/screens/add_view.dart';
import 'package:api_with_solid/presentation/screens/details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/post_model.dart';
import '../logic/api_cubit/api_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Architecture'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade900,
      ),
      body: BlocBuilder<ApiCubit, ApiState>(
        builder: (context, state) {
          if (state is ReadDataState) {
            List<Post> posts = state.posts;
            return Padding(
              padding: const EdgeInsets.only(
                top: 25,
                bottom: 10,
                left: 10,
                right: 10,
              ),
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  Post post = posts[index];
                  return ListTile(
                    leading: Text('${index + 1}'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => DetailsView(post: post))));
                    },
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(post.title.toString()),
                    ),
                    subtitle: Column(
                      children: [
                        Text(post.body.toString()),
                        const SizedBox(height: 10),
                        const Divider(color: Colors.deepPurple)
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple.shade900,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => AddView())));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
