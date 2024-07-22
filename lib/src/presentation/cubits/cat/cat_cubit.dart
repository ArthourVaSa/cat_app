import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cat_app/src/domain/use_case/use_cases.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:cat_app/src/domain/models/models.dart';
import 'package:cat_app/src/presentation/cubits/base/base_cubit.dart';

part 'cat_state.dart';

class CatCubit extends BaseCubit<CatState, String> {
  final GetCatBreedsUseCase _getCatBreedsUseCase;

  CatCubit({
    required GetCatBreedsUseCase getCatBreedsUseCase,
  })  : _getCatBreedsUseCase = getCatBreedsUseCase,
        super(
          CatState.initial(),
          "Cat Cubit",
        );

  Future<void> getBreeds() async {
    if (isBusy) return;

    await run(() async {
      emit(
        state.copyWith(
          status: CatStatus.loading,
        ),
      );

      final response = await _getCatBreedsUseCase.call();

      response.fold(
        (l) {
          emit(state.copyWith(
            status: CatStatus.error,
          ));
        },
        (r) {
          emit(state.copyWith(
            catBreeds: r,
            searchCatBreeds: r,
            status: CatStatus.loaded,
          ));
        },
      );
    });
  }

  void selectCat(CatEntity cat) {
    emit(state.copyWith(
      catSelected: cat,
    ));
  }

  void search(String query) {

    if (query.isEmpty) {
      emit(state.copyWith(
        searchCatBreeds: state.catBreeds,
      ));
      return;
    }
    
    List<CatEntity> searchResults = state.catBreeds.where((element) {
      return element.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(state.copyWith(
      searchCatBreeds: searchResults,
    ));

  }



}
