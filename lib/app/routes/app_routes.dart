part of 'app_pages.dart';


abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const homepage = _Paths.homepage;
}

abstract class _Paths {
  _Paths._();
  static const splash = '/splash';
  static const homepage = '/homepage';
}
