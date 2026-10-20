import 'package:flutter_bloc/flutter_bloc.dart';
import '../../products/data/product_catalog.dart';

class CartLine {
  const CartLine({required this.product, required this.quantity});
  final Product product;
  final int quantity;
  double get lineTotal => product.price * quantity;
}

class CartState {
  const CartState(this.lines);
  final List<CartLine> lines;
  int get itemCount => lines.fold(0, (sum, line) => sum + line.quantity);
  double get total => lines.fold(0, (sum, line) => sum + line.lineTotal);
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState([]));

  void add(Product product) {
    final lines = [...state.lines];
    final index = lines.indexWhere((line) => line.product.id == product.id);
    if (index == -1) {
      lines.add(CartLine(product: product, quantity: 1));
    } else {
      final old = lines[index];
      lines[index] = CartLine(product: old.product, quantity: old.quantity + 1);
    }
    emit(CartState(List.unmodifiable(lines)));
  }

  void increment(String id) => _change(id, 1);
  void decrement(String id) => _change(id, -1);

  void _change(String id, int delta) {
    final lines = [...state.lines];
    final index = lines.indexWhere((line) => line.product.id == id);
    if (index < 0) return;
    final next = lines[index].quantity + delta;
    if (next <= 0) {
      lines.removeAt(index);
    } else {
      lines[index] = CartLine(product: lines[index].product, quantity: next);
    }
    emit(CartState(List.unmodifiable(lines)));
  }

  void remove(String id) {
    emit(CartState(List.unmodifiable(state.lines.where((line) => line.product.id != id))));
  }
}
