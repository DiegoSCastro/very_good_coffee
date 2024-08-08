import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
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
  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  bool _isConnected = true;
  bool _isFavorite = false;

  String get _fileUrl =>
      _cubit.state is HomeSuccess ? (_cubit.state as HomeSuccess).fileUrl : '';

  Future<void> _checkIsFavorite() async {
    _isFavorite = await _favoriteCubit.containsImageUrl(imageUrl: _fileUrl);
    setState(() {});
  }

  Future<void> _toggleFavorite() async {
    _isFavorite
        ? await _favoriteCubit.removeFavoriteImage(imageUrl: _fileUrl)
        : await _favoriteCubit.saveFavoriteImage(imageUrl: _fileUrl);
    await _checkIsFavorite();
  }

  Future<void> _refresh() async {
    await _cubit.getRandomCoffeeImage();
    await _checkIsFavorite();
  }

  @override
  void initState() {
    super.initState();
    _subscription = Connectivity().onConnectivityChanged.listen(
          (List<ConnectivityResult> result) => setState(
            () => _isConnected = result.any(
              (res) =>
                  res == ConnectivityResult.mobile ||
                  res == ConnectivityResult.wifi ||
                  res == ConnectivityResult.ethernet,
            ),
          ),
        );
    _refresh();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
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
                child: Visibility(
                  visible: _isConnected,
                  replacement: const NoConnectionPlaceholder(),
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) => switch (state) {
                      HomeSuccess(:final fileUrl) => ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            fileUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      HomeError(:final errorMessage) => Center(
                          child: Text(errorMessage),
                        ),
                      _ => const Center(
                          child: SizedBox.square(
                            dimension: 48,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isConnected ? _refresh : null,
                child: const Text('Refresh'),
              ),
              FilledButton(
                onPressed: _isConnected ? _toggleFavorite : null,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_isFavorite ? 'Remove Favorite' : 'Add Favorite'),
                    const SizedBox(width: 16),
                    Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () => Navigator.of(context)
                    .pushNamed(AppRoutes.favorite)
                    .then((_) {
                  if (_isConnected) _checkIsFavorite();
                }),
                child: const Text('Go to Favorites'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
