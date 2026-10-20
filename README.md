# Luxe Cart — Flutter Practical Assessment

A polished clothing-store demo implementing **Login → Product Listing → Cart** with Flutter, Dart and `flutter_bloc` (Cubit).

## UI direction
Premium editorial storefront: warm ivory surfaces, deep forest green, muted gold accents, generous spacing, rounded cards and refined typography. Colors and component styles are centralized in `lib/core/theme/app_theme.dart`.

## Run
1. Install Flutter (stable) and verify with `flutter doctor`.
2. From this folder run:
   ```bash
   flutter pub get
   flutter run
   ```
3. Demo login credentials:
   - Email: `demo@luxecart.com`
   - Password: `password123`

Authentication is local/dummy by design; no backend, Firebase or database is used. Product data is static in `lib/features/products/data/product_catalog.dart`. Product photos are remote Unsplash images and have a local visual fallback if unavailable.

## Structure
```
lib/
  core/theme/             App palette, theme and typography
  core/widgets/           Reusable buttons, product image, price label
  features/auth/          Login UI + AuthCubit
  features/products/      Static catalog + listing UI
  features/cart/          CartCubit, cart screen and item widgets
  app.dart
  main.dart
```

## Features
- Email/password validation; login enabled only when both fields are valid.
- Password visibility toggle and friendly login errors.
- Cubit/BLoC state management for authentication and cart.
- Product cards with image, name, short description, price and Add to Cart.
- Cart persists in memory while navigating; quantity +/- controls, remove action and computed total.
- Empty-cart state and navigation between screens.

## Demo video checklist
Record a screen capture showing: invalid/valid login, successful login, product listing, add two products, open cart, increase/decrease quantity, remove an item, empty-cart state, and return to catalog.