import 'package:cat_app/src/config/config.dart';
import 'package:cat_app/src/presentation/cubits/cat/cat_cubit.dart';
import 'package:cat_app/src/presentation/widgets/widgets.dart';
import 'package:cat_app/src/utils/constants/gifs.dart';
import 'package:cat_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      BlocProvider.of<CatCubit>(context).getBreeds();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Cat Breeds App',
          style: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0.2,
        shadowColor: Colors.grey,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 2.0.h,
            ),
            Container(
              width: double.infinity,
              height: 7.0.h,
              padding: EdgeInsets.symmetric(
                horizontal: 2.0.w,
              ),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  context.read<CatCubit>().search(value);
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<CatCubit, CatState>(
                builder: (context, state) {
                  if (state.status == CatStatus.loading ||
                      state.status == CatStatus.initial) {
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const ListBody(
                          children: [
                            CardWidget(
                              child: LoaginWidget(),
                            ),
                          ],
                        );
                      },
                    );
                  }

                  if (state.status == CatStatus.loaded) {
                    return ListView.builder(
                      itemCount: state.searchCatBreeds.length,
                      itemBuilder: (context, index) {
                        return ListBody(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<CatCubit>().selectCat(
                                      state.searchCatBreeds[index],
                                    );
                                context.push(AppRouter.specificationsScreen);
                              },
                              child: CardWidget(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          state.searchCatBreeds[index].name!,
                                          style: TextStyle(
                                            fontSize: 14.0.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '${state.searchCatBreeds[index].weight.metric} Kg',
                                          style: TextStyle(
                                            fontSize: 14.0.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.0.h),
                                    Hero(
                                      tag: 'cat_image_${state.searchCatBreeds[index].id}',
                                      child: Image.network(
                                        "https://cdn2.thecatapi.com/images/${state.searchCatBreeds[index].referenceImageId}.jpg",
                                        width: double.infinity,
                                        height: 40.0.h,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            width: double.infinity,
                                            height: 40.0.h,
                                            color: Colors.grey,
                                            child: Center(
                                              child: Text(
                                                'Image not found',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          state.searchCatBreeds[index].origin!,
                                          style: TextStyle(
                                            fontSize: 14.0.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'Intelligence: ${state.searchCatBreeds[index].intelligence}',
                                          style: TextStyle(
                                            fontSize: 14.0.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }

                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
