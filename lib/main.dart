import 'package:advanced_ecommerce/core/Utils/Router/app_router.dart';
import 'package:advanced_ecommerce/core/Utils/hero_controller.dart';
import 'package:advanced_ecommerce/core/services/custom_bloc_observer_service.dart';
import 'package:advanced_ecommerce/core/services/easy_loading_service.dart';
import 'package:advanced_ecommerce/core/services/get_it_service.dart';
import 'package:advanced_ecommerce/core/services/shared_prefs.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsSingelton.init();
  setupDependencies();
  configLoading();
  Bloc.observer = BlocObserverService();
  Get.put(GetHeroController());
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const FruitHub(),
    ),
  );
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorObservers: [HeroController()],
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      getPages: AppRouter.getViews(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      builder: EasyLoading.init(),
    );
  }
}
