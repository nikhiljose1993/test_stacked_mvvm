import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_stacked_mvvm/services/api_services.dart';
import 'package:test_stacked_mvvm/ui/recipes_page/recipesView.dart';

final getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerLazySingleton(() => ApiService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RecipesView(),
    );
  }
}
