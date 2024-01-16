import 'dart:io';
import 'package:clase_1/clase_1.dart' as lib;

void main(List<String> arguments) {
  print('Esto es un programa en Dart\nPorfavor, ingrese un número entero:');
  String? line = stdin.readLineSync();
  while (line == null || line.isEmpty || int.tryParse(line) == null) {
    print('El valor ingresado no es un número entero válido');
    line = stdin.readLineSync();
  }
  int n = int.parse(line);
  print('El factorial de $n es ${lib.factorial(n)}');

  ejemploFuturo();

  lib.numerosNaturales().listen((event) {
    print(event);
  });


  print('VENTAS EN TIEMPO REAL');
  lib.realtimeSales().listen((lib.Venta event) {
    print(event.toString());
  });

}

Future<void> ejemploFuturo() async {
  print('Cargando datos...');
  String datos = await lib.cargarDatos();
  print('Datos cargados: $datos');
}
