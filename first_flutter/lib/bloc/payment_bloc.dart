import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class PaymentEvent {}

class ProcessPayment extends PaymentEvent {
  final String method;
  final double amount;

  ProcessPayment({required this.method, required this.amount});
}

// States
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {}

class PaymentFailure extends PaymentState {
  final String error;

  PaymentFailure(this.error);
}

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<ProcessPayment>((event, emit) async {
      emit(PaymentLoading());
      
      try {
        // Aquí se implementará la integración real con la pasarela de pago
        await Future.delayed(const Duration(seconds: 2)); // Simulación
        emit(PaymentSuccess());
      } catch (e) {
        emit(PaymentFailure(e.toString()));
      }
    });
  }
}
