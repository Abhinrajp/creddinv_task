import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/product_photo.dart';
import '../../../core/widgets/price_text.dart';
import '../../products/presentation/product_list_screen.dart';
import '../cubit/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Your bag', style: TextStyle(fontWeight: FontWeight.w800)), leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context))),
    body: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      if (state.lines.isEmpty) {
        return Center(child: Padding(padding: const EdgeInsets.all(28), child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(width: 84, height: 84, decoration: const BoxDecoration(color: AppColors.blush, shape: BoxShape.circle), child: const Icon(Icons.shopping_bag_outlined, size: 38, color: AppColors.forest)),
          const SizedBox(height: 20), const Text('Your bag is taking a break', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8), const Text('Add a few considered essentials and they’ll appear here.', textAlign: TextAlign.center, style: TextStyle(color: AppColors.muted)),
          const SizedBox(height: 22), OutlinedButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProductListScreen())), child: const Text('Explore collection')),
        ])));
      }
      return Column(children: [
        Expanded(child: ListView.separated(padding: const EdgeInsets.all(16), itemCount: state.lines.length, separatorBuilder: (_, __) => const SizedBox(height: 12), itemBuilder: (context, index) {
          final line = state.lines[index];
          return Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: AppColors.line)),
            child: Row(children: [
              ClipRRect(borderRadius: BorderRadius.circular(12), child: SizedBox(width: 88, height: 100, child: ProductPhoto(url: line.product.imageUrl))),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(line.product.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
                const SizedBox(height: 6), PriceText(line.product.price),
                const SizedBox(height: 9),
                Row(children: [
                  _QtyButton(icon: Icons.remove, onTap: () => context.read<CartCubit>().decrement(line.product.id)),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: Text('${line.quantity}', style: const TextStyle(fontWeight: FontWeight.w800))),
                  _QtyButton(icon: Icons.add, onTap: () => context.read<CartCubit>().increment(line.product.id)),
                  const Spacer(),
                  IconButton(tooltip: 'Remove item', visualDensity: VisualDensity.compact, onPressed: () => context.read<CartCubit>().remove(line.product.id), icon: const Icon(Icons.delete_outline, color: Colors.redAccent)),
                ]),
              ])),
            ]),
          );
        })),
        Container(padding: const EdgeInsets.fromLTRB(20, 18, 20, 22), decoration: const BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: AppColors.line))),
          child: SafeArea(top: false, child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Subtotal', style: TextStyle(color: AppColors.muted)), PriceText(state.total, large: true)]),
            const SizedBox(height: 6), const Align(alignment: Alignment.centerLeft, child: Text('Shipping and taxes calculated at checkout.', style: TextStyle(fontSize: 11, color: AppColors.muted))),
            const SizedBox(height: 14), SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Demo checkout — no payment is processed.'))), child: const Text('Continue to checkout'))),
          ])),
        ),
      ]);
    }),
  );
}

class _QtyButton extends StatelessWidget {
  const _QtyButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => InkWell(onTap: onTap, borderRadius: BorderRadius.circular(8), child: Container(width: 27, height: 27, decoration: BoxDecoration(border: Border.all(color: AppColors.line), borderRadius: BorderRadius.circular(8)), child: Icon(icon, size: 15)));
}
