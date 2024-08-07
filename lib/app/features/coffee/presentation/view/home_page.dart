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

  @override
  void initState() {
    super.initState();
    _cubit.getRandomCoffeeImage();
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
                onPressed: () {},
                child: const Text('Add to Favorites'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Go to Favorites'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
