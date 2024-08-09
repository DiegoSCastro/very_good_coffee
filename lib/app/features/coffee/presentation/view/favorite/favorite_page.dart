import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_coffee/app/app.dart';
import 'package:very_good_coffee/l10n/l10n.dart';

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
        leading: IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).clearMaterialBanners();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(context.l10n.myFavoriteCoffees),
        actions: const [RemoveFavoriteAlertBanner()],
      ),
      body: Center(
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) => switch (state) {
            FavoriteSuccess(:final coffeImages) => Visibility(
                visible: coffeImages.isNotEmpty,
                replacement: Text(context.l10n.favoritesEmpty),
                child: ListView.builder(
                  itemCount: coffeImages.length,
                  itemBuilder: (context, index) {
                    final coffeeImage = coffeImages[index];
                    return FavoriteImageItem(
                      coffeeImage: coffeeImage,
                      onDismissed: () => _cubit.removeFavoriteImage(
                        imageUrl: coffeeImage.imageUrl,
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
