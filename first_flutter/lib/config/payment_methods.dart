class PaymentMethodConfig {
  static const daviplata = {
    'name': 'DaviPlata',
    'icon': 'assets/payment_methods/daviplata.png',
    'description': 'Paga con tu cuenta DaviPlata',
  };

  static const nequi = {
    'name': 'Nequi',
    'icon': 'assets/payment_methods/nequi.png',
    'description': 'Transfiere desde tu cuenta Nequi',
  };

  static const pse = {
    'name': 'PSE',
    'icon': 'assets/payment_methods/pse.png',
    'description': 'Pago seguro electrónico',
  };

  static const dale = {
    'name': 'Dale',
    'icon': 'assets/payment_methods/dale.png',
    'description': 'Paga con tu billetera Dale',
  };

  static const movii = {
    'name': 'Movii',
    'icon': 'assets/payment_methods/movii.png',
    'description': 'Paga con tu cuenta Movii',
  };

  static const transfiya = {
    'name': 'TransfiYa',
    'icon': 'assets/payment_methods/transfiya.png',
    'description': 'Transferencia inmediata entre bancos',
  };

  static const List<Map<String, String>> allMethods = [
    daviplata,
    nequi,
    pse,
    dale,
    movii,
    transfiya,
  ];
}
