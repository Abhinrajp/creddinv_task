import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/primary_button.dart';
import '../cubit/auth_cubit.dart';
import '../../products/presentation/product_list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _obscure = true;
  bool _attempted = false;

  bool get _valid => _email.text.trim().contains('@') &&
      _email.text.trim().contains('.') && _password.text.length >= 6;

  @override
  void dispose() { _email.dispose(); _password.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) => BlocListener<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state.status == AuthStatus.success) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const ProductListScreen()));
      } else if (state.status == AuthStatus.failure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message ?? 'Login failed')));
      }
    },
    child: Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 28),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Form(
                key: _formKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(width: 54, height: 54, decoration: BoxDecoration(color: AppColors.forest, borderRadius: BorderRadius.circular(17)),
                    child: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 27)),
                  const SizedBox(height: 30),
                  const Text('A more considered\nway to shop.', style: TextStyle(fontSize: 34, height: 1.15, fontWeight: FontWeight.w800, letterSpacing: -1.2)),
                  const SizedBox(height: 12),
                  const Text('Discover timeless pieces, chosen for everyday living.', style: TextStyle(color: AppColors.muted, height: 1.5)),
                  const SizedBox(height: 34),
                  const Text('WELCOME BACK', style: TextStyle(fontSize: 11, letterSpacing: 1.8, fontWeight: FontWeight.w800, color: AppColors.gold)),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _email, keyboardType: TextInputType.emailAddress,
                    onChanged: (_) => setState(() {}),
                    decoration: const InputDecoration(labelText: 'Email address', prefixIcon: Icon(Icons.mail_outline_rounded)),
                    validator: (v) => v == null || !RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(v.trim()) ? 'Enter a valid email address' : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _password, obscureText: _obscure, onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(labelText: 'Password', prefixIcon: const Icon(Icons.lock_outline_rounded),
                      suffixIcon: IconButton(onPressed: () => setState(() => _obscure = !_obscure), icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined))),
                    validator: (v) => v == null || v.length < 6 ? 'Password must be at least 6 characters' : null,
                  ),
                  const SizedBox(height: 22),
                  PrimaryButton(label: 'Sign in', icon: Icons.arrow_forward_rounded,
                    onPressed: _valid ? () {
                      setState(() => _attempted = true);
                      if (_formKey.currentState!.validate()) context.read<AuthCubit>().login(_email.text, _password.text);
                    } : null),
                  if (_attempted && !_valid) const Padding(padding: EdgeInsets.only(top: 8), child: Text('Please complete both fields with valid details.', style: TextStyle(color: Colors.red))),
                  const SizedBox(height: 18),
                  Center(child: Text('DEMO  ·  demo@luxecart.com / password123', style: TextStyle(fontSize: 11, color: AppColors.muted))),
                ]),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
