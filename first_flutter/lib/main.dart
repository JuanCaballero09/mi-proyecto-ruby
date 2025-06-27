import 'package:first_flutter/pages/login_page.dart';
import 'package:first_flutter/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/product_bloc.dart';
import 'repository/product_repository.dart';
import 'repository/http_product_repository.dart';
import 'repository/local_product_repository.dart';
import 'pages/splash_page.dart';
import 'package:first_flutter/pages/register_page.dart';
  



void main() {
  // Para usar datos locales, descomenta la siguiente línea y comenta la de HttpProductRepository:
  final ProductRepository repository = LocalProductRepository();
  const String apiUrl = 'https://64e8e7e299cf45b15fdffb7e.mockapi.io/api/v1/products';
  //final ProductRepository repository = HttpProductRepository(apiUrl: apiUrl);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final ProductRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(repository),
      child: MaterialApp(
        title: 'Restaurante',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.amber[800],
          scaffoldBackgroundColor: Colors.amber[50],
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.amber[800],
            foregroundColor: Colors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber[700],
              foregroundColor: Colors.white,
            ),
          ),
        ),
        initialRoute: '/',
       routes: {
         '/': (context) => SplashPage(),
         '/welcome': (context) => const WelcomePage(),
         '/login': (context) => const LoginPage(),
         '/register': (context) => const RegisterPage(),
         '/home': (context) => BlocProvider.value(
        value: BlocProvider.of<ProductBloc>(context),
         child: WelcomePage(), // o HomePage()
      ),
    }
   ),
   );
    }
  }



