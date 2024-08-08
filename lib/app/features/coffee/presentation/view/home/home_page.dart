import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_coffee/app/app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cubit = injection<HomeCubit>();
  final _favoriteCubit = injection<FavoriteCubit>();

  bool isFavorite = false;

  Future<void> _checkIsFavorite() async {
    isFavorite = await _favoriteCubit.containsImageUrl(
      imageUrl: (_cubit.state as HomeSuccess).fileUrl,
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _cubit.getRandomCoffeeImage().then((v) async => _checkIsFavorite());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) => switch (state) {
                    HomeSuccess(:final fileUrl) => ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          fileUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    HomeError(:final errorMessage) => Text(errorMessage),
                    _ => const Center(
                        child: SizedBox.square(
                          dimension: 48,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _cubit.getRandomCoffeeImage,
                child: const Text('Refresh'),
              ),
              FilledButton(
                onPressed: () async {
                  final fileUrl = (_cubit.state as HomeSuccess).fileUrl;

                  isFavorite
                      ? await _favoriteCubit.removeFavoriteImage(
                          imageUrl: fileUrl,
                        )
                      : await _favoriteCubit.saveFavoriteImage(
                          imageUrl: fileUrl,
                        );

                  await _checkIsFavorite();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(isFavorite ? 'Remove Favorites' : 'Add to Favorites'),
                    const SizedBox(width: 16),
                    Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () => Navigator.of(context)
                    .pushNamed(AppRoutes.favorite)
                    .then((v) => _checkIsFavorite()),
                child: const Text('Go to Favorites'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
