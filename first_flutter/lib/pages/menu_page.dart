import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';
import 'product_detail_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}  

class _MenuPageState extends State<MenuPage> {
@override
void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    final state = context.read<ProductBloc>().state;
    if (state is! ProductLoaded) {
      context.read<ProductBloc>().add(FetchProducts());
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if(state is ProductInitial || state is ProductLoading) {
          return const Center(child: CircularProgressIndicator(),);
        } else if (state is ProductLoaded) {
          final categories = [
            'perro',
            'hamburguesa',
            'salchipapa',
            'salvajada',
            'asado',
            'sandwish',
            'adicional',
            'bebida'
          ];

          return ListView(
            padding: const EdgeInsets.all(8),
            children: categories.map((category) {
              final items = state.products
                  .where((p) => p.name.toLowerCase().contains(category))
                  .toList();
              if (items.isEmpty) return const SizedBox.shrink();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: const Color(0xFFFF936B),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  ...items.map((product) => Card(
                        color: Colors.amber[100],
                        child: ListTile(
                          title: Text(product.name),
                          subtitle: Text(
                            '\$${product.price}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailPage(product: product),
                              ),
                            );
                          },
                        ),
                      )),
                  const SizedBox(height: 16),
                ],
              );
            }).toList(),
          );
        } else if (state is ProductError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message,
                    style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<ProductBloc>().add(FetchProducts());
                  },
                  child: const Text('Reintentar'),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('Estado desconocido'));
        }
      },
    );
  }

}
