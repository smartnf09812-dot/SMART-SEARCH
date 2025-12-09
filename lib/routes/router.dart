import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/presentation/login_page.dart';
import '../features/auth/presentation/signup_page.dart';
import '../features/home/presentation/home_page.dart';
import '../features/cart/presentation/cart_page.dart';
import '../features/profile/presentation/profile_page.dart';
import '../features/dashboard/presentation/dashboard_page.dart';
import '../features/restaurant/presentation/restaurant_detail_page.dart';

// Placeholder for missing pages
class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage(this.title, {super.key});
  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: Text(title)));
}

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PlaceholderPage('Splash'),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const PlaceholderPage('Onboarding'),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const PlaceholderPage('ForgotPassword'),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return DashboardPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home', // In router.json it says /dashboard/home, but keeping flat /home inside shell is cleaner for deep linking often, but I will map logic. 
              // Actually router.json says /dashboard/home. I should probably use /dashboard/home if I want to match exactly, but GoRouter paths in sub-routes are relative or absolute.
              // Let's use /dashboard/home to match router.json
              name: 'Home',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/orders',
              name: 'Orders',
              builder: (context, state) => const PlaceholderPage('Orders'),
              routes: [
                GoRoute(
                  path: ':id',
                   builder: (context, state) => const PlaceholderPage('OrderDetail'),
                )
              ]
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/cart',
              name: 'Cart',
              builder: (context, state) => const CartPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              name: 'Profile',
              builder: (context, state) => const ProfilePage(),
              routes: [
                GoRoute(
                  path: 'edit',
                  builder: (context, state) => const PlaceholderPage('EditProfile'),
                ),
                GoRoute(
                  path: 'addresses',
                  builder: (context, state) => const PlaceholderPage('AddressList'),
                ),
              ]
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/restaurant/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return RestaurantDetailPage(id: id);
      },
    ),
    GoRoute(
      path: '/food/:id',
      builder: (context, state) => const PlaceholderPage('FoodDetail'),
    ),
    GoRoute(
      path: '/checkout',
      builder: (context, state) => const PlaceholderPage('Checkout'),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const PlaceholderPage('Settings'),
    ),
  ],
);