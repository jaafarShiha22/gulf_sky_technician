import 'package:go_router/go_router.dart';
import 'package:gulf_sky_technician/features/domain/entities/order/order_item_entity.dart';
import '../../features/presentation/views/login/login_view.dart';
import '../../features/presentation/views/main/main_view.dart';
import '../../features/presentation/views/maintenance_request/maintenance_request_view.dart';
import '../../features/presentation/views/splash/splash_view.dart';
import 'app_routes.dart';

class AppRouter {
  static final List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.splashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRoutes.loginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: AppRoutes.mainView,
      builder: (context, state) => const MainView(),
    ),
    GoRoute(
      path: AppRoutes.maintenanceRequestView,
      builder: (context, state) =>  MaintenanceRequestView(
        orderItemEntity: state.extra as OrderItemEntity,
      ),
    ),
  ];
  static final router = GoRouter(
    routes: routes,
  );
}
