import 'package:stacked/stacked.dart';
import 'package:test_stacked_mvvm/main.dart';
import 'package:test_stacked_mvvm/models/Recipes.dart';
import 'package:test_stacked_mvvm/services/api_services.dart';

class RecipesViewModel extends BaseViewModel {
  List<Recipes>? recipesList = [];
  Future<void> fetchRecipes() async {
    recipesList = (await getIt<ApiService>().fetchRecipes());
    notifyListeners();
  }
}
