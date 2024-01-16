import 'dart:math';

int calculate() {
  return 6 * 7;
}

int factorial(int n) {
  if (n < 0) {
    throw ArgumentError('El número debe ser no negativo');
  }
  return n <= 1 ? 1 : n * factorial(n - 1);
}

/*clases abstractas:
  - no se pueden instanciar
  - se usan para definir una interfaz
  - se usan para definir una clase base
  - se usan para definir una clase que no se puede instanciar

*/

abstract class Animal {
  void makeNoise();
  void eat() {
    print('El animal está comiendo');
  }
}

class Dog extends Animal {
  @override
  void makeNoise() {
    print('El perro ladra');
  }
}

class Cat extends Animal {
  @override
  void makeNoise() {
    print('El gato maulla');
  }
}

/*
En este ejemplo, Animal es una clase abstracta con un método abstracto makeNoise y un método concreto eat.
 Dog y Cat son clases que extienden Animal y proporcionan su propia implementación del método makeNoise.
  Ambas clases Dog y Cat pueden usar el método eat definido en la clase abstracta Animal. 
  No puedes crear una instancia de Animal directamente, pero puedes crear instancias de Dog y Cat.
*/

abstract class Producto {
  String nombre;
  double precio;

  Producto(this.nombre, this.precio);

  // Método abstracto
  String getDescripcion();

  // Método concreto
  double calcularPrecioConImpuesto() {
    return precio * 1.15; // Supongamos un impuesto del 15%
  }
}

class Libro extends Producto {
  String autor;

  Libro(String nombre, double precio, this.autor) : super(nombre, precio);

  @override
  String getDescripcion() {
    return 'Libro: $nombre, Autor: $autor, Precio: $precio';
  }
}

class Electronico extends Producto {
  String marca;

  Electronico(String nombre, double precio, this.marca) : super(nombre, precio);

  @override
  String getDescripcion() {
    return 'Electrónico: $nombre, Marca: $marca, Precio: $precio';
  }
}

class Ropa extends Producto {
  String talla;

  Ropa(String nombre, double precio, this.talla) : super(nombre, precio);

  @override
  String getDescripcion() {
    return 'Ropa: $nombre, Talla: $talla, Precio: $precio';
  }
}

//clase venta que recibe un solo producto
class Venta {
  final Producto producto;
  final int cantidad;
  final double total;
  //constructor de la clase, calcula el total de la venta

  Venta({required this.producto, required this.cantidad})
      : total = producto.calcularPrecioConImpuesto() * cantidad;

  @override
  String toString() {
    return 'Venta\n${producto.getDescripcion()}\nCantidad: $cantidad\nTotal: $total';
  }
}

/*
En este ejemplo, Producto es una clase abstracta con un método abstracto getDescripcion y un método concreto calcularPrecioConImpuesto.
  Libro, Electronico y Ropa son clases que extienden Producto y proporcionan su propia implementación del método getDescripcion.
    Todas las clases pueden usar el método calcularPrecioConImpuesto definido en la clase abstracta Producto. 
    No puedes crear una instancia de Producto directamente, pero puedes crear instancias de Libro, Electronico y Ropa.
 */

Future<String> cargarDatos() {
  return Future.delayed(Duration(seconds: 2), () {
    return 'Datos cargados';
  });
}

Stream<int> numerosNaturales() async* {
  int n = 0;
  while (true) {
    await Future.delayed(Duration(seconds: 1));
    yield n++;
  }
}

Stream<Venta> realtimeSales() async* {
  final random = Random();
  while (true) {
    await Future.delayed(Duration(seconds: 3));

    switch (random.nextInt(3)) {
      case 0:
        yield Venta(
            producto: Libro('El arte de la guerra', 1000, 'Sun Tzu'),
            cantidad: random.nextInt(10) + 1);
        break;
      case 1:
        yield Venta(
            producto: Electronico('iPhone 12', 1000, 'Apple'),
            cantidad: random.nextInt(10) + 1);
        break;
      case 2:
        yield Venta(
            producto: Ropa('Camisa', 50, 'M'),
            cantidad: random.nextInt(10) + 1);
        break;
    }
  }
}
