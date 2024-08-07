import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_coffee/app/app.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _$FavoritePageState();
}

class _$FavoritePageState extends State<FavoritePage> {
  final _cubit = injection<FavoriteCubit>();

  @override
  void initState() {
    _cubit.getFavoriteImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite Coffees '),
      ),
      body: Center(
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) => switch (state) {
            FavoriteSuccess(:final files) => Visibility(
                visible: files.isNotEmpty,
                replacement: const Text('Favorites is Empty'),
                child: ListView.builder(
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    final image = files[index];
                    return ListTile(
                      leading: Image.file(image),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // final imageId =
                          //     image.path.split('/').last.split('.').first;
                          // coffeeCubit.deleteImage(imageId);
                        },
                      ),
                    );
                  },
                ),
              ),
            FavoriteError(:final errorMessage) => Text(errorMessage),
            _ => const CircularProgressIndicator(),
          },
        ),
      ),
    );
  }
}
