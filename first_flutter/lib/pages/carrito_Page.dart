import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';

class CarritoPage extends StatefulWidget {
  @override
  CarritoPageState createState() => CarritoPageState();
}

class CarritoPageState extends State<CarritoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(237, 88, 33, 1),
        title: Center(child: Image.asset("assets/imagen5.png", width: 150)),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final cartItems = state.cart.items;

          if (cartItems.isEmpty) {
            return const Center(child: Text('El carrito está vacío.'));
          }

          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () {
                        context.read<CartBloc>().add(
                          UpdateCartItemQuantity(item.id, item.quantity - 1),
                        );
                      },
                    ),
                    Text('Cantidad: ${item.quantity}'),
                    IconButton(
                      icon: const Icon(Icons.add_circle),
                      onPressed: () {
                        context.read<CartBloc>().add(
                          UpdateCartItemQuantity(item.id, item.quantity + 1),
                        );
                      },
                    ),
                  ],
                ),
                trailing: Text('Precio: ${item.price * item.quantity}'),
                leading: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    context.read<CartBloc>().add(RemoveFromCart(item.id));
                  },
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total: ${state.cart.totalPrice}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<CartBloc>().add(ClearCart());
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Carrito vaciado')),
                    );
                  },
                  child: const Text('Vaciar Carrito'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
