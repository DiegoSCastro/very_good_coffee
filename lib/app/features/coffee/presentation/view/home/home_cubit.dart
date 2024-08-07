import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_coffee/app/app.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required GetRandomImageUsecase getRandomImageUsecase})
      : _getRandomImageUsecase = getRandomImageUsecase,
        super(HomeInitial());

  final GetRandomImageUsecase _getRandomImageUsecase;

  Future<void> getRandomCoffeeImage() async {
    emit(HomeState.loading());
    final result = await _getRandomImageUsecase();
    result.fold(
      (_) => emit(HomeState.error(errorMessage: 'Error loading image')),
      (fileUrl) => emit(HomeState.success(fileUrl: fileUrl)),
    );
  }
}
