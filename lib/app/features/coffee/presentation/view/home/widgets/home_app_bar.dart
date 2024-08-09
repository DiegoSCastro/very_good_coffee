import 'package:flutter/material.dart';
import 'package:very_good_coffee/app/app.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _HomeAppBarState extends State<HomeAppBar> {
  final _localeCubit = injection<LocaleCubit>();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image.asset(AppAssets.logo),
      actions: [
        _BannerIconButton(
          assetPath: AppAssets.usaFlag,
          onPressed: _localeCubit.setEnglish,
        ),
        _BannerIconButton(
          assetPath: AppAssets.brazilFlag,
          onPressed: _localeCubit.setPortuguese,
        ),
        _BannerIconButton(
          assetPath: AppAssets.spanishFlag,
          onPressed: _localeCubit.setSpanish,
        ),
      ],
    );
  }
}

class _BannerIconButton extends StatelessWidget {
  const _BannerIconButton({
    required this.assetPath,
    required this.onPressed,
  });
  final String assetPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        assetPath,
        height: 32,
      ),
    );
  }
}
