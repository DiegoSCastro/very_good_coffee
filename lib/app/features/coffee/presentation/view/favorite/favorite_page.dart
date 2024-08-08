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
        actions: const [RemoveFavoriteAlertBanner()],
      ),
      body: Center(
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) => switch (state) {
            FavoriteSuccess(:final coffeImages) => Visibility(
                visible: coffeImages.isNotEmpty,
                replacement: const Text('Favorites is Empty'),
                child: ListView.builder(
                  itemCount: coffeImages.length,
                  itemBuilder: (context, index) {
                    final coffeeImage = coffeImages[index];
                    return FavoriteImageItem(
                      coffeeImage: coffeeImage,
                      onDismissed: () =>
                          _cubit.removeFavoriteImage(imageId: coffeeImage.id),
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
