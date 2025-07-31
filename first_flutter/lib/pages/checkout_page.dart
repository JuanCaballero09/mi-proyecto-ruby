import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/payment_bloc.dart';
import '../config/payment_methods.dart';

class PaymentMethod {
  final String name;
  final String icon;
  final String description;

  PaymentMethod({
    required this.name, 
    required this.icon, 
    required this.description
  });
}

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  PaymentMethod? selectedMethod;

  final List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      name: 'DaviPlata',
      icon: 'assets/payment_methods/daviplata.png',
      description: 'Paga con tu cuenta DaviPlata',
    ),
    PaymentMethod(
      name: 'Nequi',
      icon: 'assets/payment_methods/nequi.png',
      description: 'Transfiere desde tu cuenta Nequi',
    ),
    PaymentMethod(
      name: 'PSE',
      icon: 'assets/payment_methods/pse.png',
      description: 'Pago seguro electrónico',
    ),
    PaymentMethod(
      name: 'Dale',
      icon: 'assets/payment_methods/dale.png',
      description: 'Paga con tu billetera Dale',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Método de Pago'),
        backgroundColor: const Color.fromRGBO(237, 88, 33, 1),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final total = state.cart.totalPrice;
          
          return Column(
            children: [
              // Resumen del pedido
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total a pagar:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(237, 88, 33, 1),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Lista de métodos de pago
              Expanded(
                child: ListView.builder(
                  itemCount: paymentMethods.length,
                  itemBuilder: (context, index) {
                    final method = paymentMethods[index];
                    return RadioListTile<PaymentMethod>(
                      value: method,
                      groupValue: selectedMethod,
                      title: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              method.icon,
                              width: 40,
                              height: 40,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 40,
                                  height: 40,
                                  color: Colors.grey[200],
                                  child: const Icon(Icons.payment, color: Colors.grey),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(method.name),
                        ],
                      ),
                      subtitle: Text(method.description),
                      onChanged: (PaymentMethod? value) {
                        setState(() {
                          selectedMethod = value;
                        });
                      },
                    );
                  },
                ),
              ),
              
              // Botón de pago
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: selectedMethod == null
                      ? null
                      : () {
                          _processPayment(context);
                        },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromRGBO(237, 88, 33, 1),
                  ),
                  child: const Text(
                    'Confirmar Pago',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _processPayment(BuildContext context) {
    final cartState = context.read<CartBloc>().state;
    final total = cartState.cart.totalPrice.toDouble();

    if (selectedMethod == null) return;

    context.read<PaymentBloc>().add(
          ProcessPayment(
            method: selectedMethod!.name,
            amount: total,
          ),
        );

    showDialog(
      context: context,
      builder: (context) => BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state is PaymentSuccess) {
            return AlertDialog(
              title: const Text('¡Pago Exitoso!'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  const Text('Tu pedido ha sido procesado correctamente.'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.read<CartBloc>().add(ClearCart());
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/menu',
                      (route) => false,
                    );
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            );
          }

          if (state is PaymentFailure) {
            return AlertDialog(
              title: const Text('Error en el Pago'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  Text(state.error),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Intentar de nuevo'),
                ),
              ],
            );
          }

          return AlertDialog(
            title: const Text('Procesando Pago'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text('Procesando pago con ${selectedMethod!.name}...'),
              ],
            ),
          );
        },
      ),
    );
  }
}
