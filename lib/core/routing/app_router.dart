import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmed_advanced_app/core/di/dependency_injection.dart';
import 'package:omar_ahmed_advanced_app/core/routing/app_routes.dart';
import 'package:omar_ahmed_advanced_app/features/login/logic/login_cubit.dart';
import 'package:omar_ahmed_advanced_app/features/login/ui/login_view.dart';
import 'package:omar_ahmed_advanced_app/features/onboarding/ui/onboarding_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )

    switch (settings.name) {
      case AppRoutes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case AppRoutes.loginRoute:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginView(),
              ),
        );

      default:
        return null;
    }
  }
}
