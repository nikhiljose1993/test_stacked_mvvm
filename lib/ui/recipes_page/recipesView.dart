import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test_stacked_mvvm/ui/recipes_page/recipesViewModel.dart';

class RecipesView extends StatelessWidget {
  const RecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipesViewModel>.reactive(
      onViewModelReady: (viewModel) {
        viewModel.fetchRecipes();
      },
      viewModelBuilder: () {
        return RecipesViewModel();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(),
          body: viewModel.isBusy
              ? const CircularProgressIndicator()
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 9 / 14,
                  ),
                  padding: const EdgeInsets.all(8),
                  itemCount: viewModel.recipesList!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: const Color.fromARGB(255, 243, 177, 255),
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {},
                      child: Ink(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color.fromRGBO(248, 209, 255, 1),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.network(
                                    '${viewModel.recipesList![index].image}',
                                    loadingBuilder: (
                                      context,
                                      child,
                                      loadingProgress,
                                    ) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    '${viewModel.recipesList![index].name}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${viewModel.recipesList![index].cuisine}',
                                ),
                                Text(
                                  '${viewModel.recipesList![index].difficulty}',
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
