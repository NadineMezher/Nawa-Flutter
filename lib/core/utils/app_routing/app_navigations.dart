// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:mawsim_clone/core/utils/app_routing/app_routes_name.dart';
//
// abstract class _BasicAppRoute {
//   static removeScreen(BuildContext context) {
//     context.pop();
//   }
//
//   static navigateToNewScreen<T>(
//       {required BuildContext context,
//         required String path,
//         // T? args,
//         Map<String, dynamic>? queryParameters,
//         Map<String, String>? pathParameters}) {
//     context.pushNamed(
//       path,
//       extra: args,
//       queryParameters: queryParameters ?? {},
//       pathParameters: pathParameters ?? {},
//     );
//   }
//
//   static replaceToNewScreen<T>(
//       {required BuildContext context,
//         required String path,
//         T? args,
//         Map<String, dynamic>? queryParameters,
//         Map<String, String>? pathParameters}) {
//     context.pushReplacementNamed(
//       path,
//       extra: args,
//       queryParameters: queryParameters ?? {},
//       pathParameters: pathParameters ?? {},
//     );
//   }
// }
//
// class AppNavigations {
//   static void navigateToSplash(BuildContext context) {
//     _BasicAppRoute.replaceToNewScreen(
//         context: context, path: AppRoutesName.splash);
//   }
//
//   static void navigateToHomeScreen(BuildContext context) {
//     _BasicAppRoute.navigateToNewScreen(
//         context: context, path: AppRoutesName.home);
//   }
//
//   static void navigateToCartScreen(BuildContext context) {
//     _BasicAppRoute.navigateToNewScreen(
//         context: context, path: AppRoutesName.cart);
//   }
//
//   static void navigateToProductDetailScreen(BuildContext context) {
//     _BasicAppRoute.navigateToNewScreen(
//         context: context, path: AppRoutesName.productDetail);
//   }
//
//   static void navigateToCollectionProductListingScreen(BuildContext context) {
//     _BasicAppRoute.navigateToNewScreen(
//       context: context,
//       path: AppRoutesName.collectionProductListing,
//     );
//   }
//
//   static void popBackToHome(BuildContext context) {
//     _BasicAppRoute.removeScreen(context);
//   }
//
//   static void navigateToSinglePageVideoView(
//       BuildContext context,
//       ) {
//     _BasicAppRoute.navigateToNewScreen(
//       context: context,
//       path: AppRoutesName.reels,
//     );
//   }
//
//   static void navigateToEditProfileView(
//       BuildContext context,
//       ) {
//     _BasicAppRoute.navigateToNewScreen(
//       context: context,
//       path: AppRoutesName.profile,
//     );
//   }
//
//   static void navigateToFavoritesScreen(BuildContext context) {
//     _BasicAppRoute.navigateToNewScreen(
//         context: context, path: AppRoutesName.favorites);
//   }
//
//   static void popBackToProfile(BuildContext context) {
//     _BasicAppRoute.removeScreen(context);
//   }
//
//   static void popUntilPath(String routePath, BuildContext context) {
//     final router = GoRouter.of(context);
//     while (router.routerDelegate.currentConfiguration.fullPath != routePath) {
//       if (!router.canPop()) {
//         return;
//       }
//       router.pop();
//     }
//   }
//
//   static void popBack(BuildContext context) {
//     final router = GoRouter.of(context);
//     if (!router.canPop()) {
//       return;
//     }
//     router.pop();
//   }
// }
