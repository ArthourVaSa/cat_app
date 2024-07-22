part of 'cat_cubit.dart';

enum CatStatus {
  initial,
  loading,
  loaded,
  error,
}

class CatState extends Equatable {
  final List<CatEntity> catBreeds;
  final List<CatEntity> searchCatBreeds;
  final CatEntity? catSelected;
  final CatStatus status;
  final int limit;
  final int page;

  const CatState({
    required this.catBreeds,
    required this.searchCatBreeds,
    required this.catSelected,
    required this.status,
    required this.limit,
    required this.page,
  });

  factory CatState.initial() {
    return const CatState(
      catBreeds: [],
      searchCatBreeds: [],
      catSelected: null,
      status: CatStatus.initial,
      limit: 10,
      page: 1,
    );
  }

  CatState copyWith({
    List<CatEntity>? catBreeds,
    List<CatEntity>? searchCatBreeds,
    CatEntity? catSelected,
    CatStatus? status,
    int? limit,
    int? page,
  }) {
    return CatState(
      catBreeds: catBreeds ?? this.catBreeds,
      searchCatBreeds: searchCatBreeds ?? this.searchCatBreeds,
      catSelected: catSelected ?? this.catSelected,
      status: status ?? this.status,
      limit: limit ?? this.limit,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [
        catBreeds,
        searchCatBreeds,
        catSelected ?? "NO CAT SELECTED",
        status,
        limit,
        page,
      ];
}
