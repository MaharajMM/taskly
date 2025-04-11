import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskly/const/colors/app_colors.dart';
import 'package:taskly/const/resource.dart';
import 'package:taskly/features/splash/controller/future_initializer.dart';
import 'package:taskly/shared/riverpod_ext/asynvalue_easy_when.dart';

///This view displayed for initializing all the required things on initialization.
/// This will help for initial loading screen for apps with heavy things initialization;
class SplashView extends ConsumerStatefulWidget {
  /// If true ,this will defer the first frame upto all async initialization done.
  /// On deferring the screen will be blasnk upto the completion of initialization.
  ///
  /// If false, it will show splash loader from the start of the app upto intialization
  ///  without deferring the first frame.
  ///
  final bool removeSpalshLoader;
  final void Function(ProviderContainer container) onInitialized;
  const SplashView({
    super.key,
    required this.onInitialized,
    required this.removeSpalshLoader,
  });

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  late Stopwatch stopwatch;
  bool _navigationTriggered = false;

  @override
  void initState() {
    stopwatch = Stopwatch()..start();
    super.initState();
    if (widget.removeSpalshLoader) {
      RendererBinding.instance.deferFirstFrame();
    }

    // Start a 3-second timer regardless of other operations
    Future.delayed(const Duration(seconds: 3), () {
      _checkAndNavigate();
    });
  }

  @override
  void didChangeDependencies() {
    if (widget.removeSpalshLoader) {
      ref.read(futureInitializerPod.future).whenComplete(
        () {
          RendererBinding.instance.allowFirstFrame();
          _checkAndNavigate();
        },
      );
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    stopwatch.stop();
    super.dispose();
  }

  void _checkAndNavigate() {
    if (!mounted || _navigationTriggered) return;

    final futureAsync = ref.read(futureInitializerPod);
    if (futureAsync is AsyncData &&
        futureAsync.valueOrNull != null &&
        stopwatch.elapsedMilliseconds >= 3000) {
      _navigationTriggered = true;
      widget.onInitialized(futureAsync.requireValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final futureAsync = ref.watch(futureInitializerPod);
        ref.listen(
          futureInitializerPod,
          (previous, next) {
            if (next is AsyncData && next.valueOrNull != null) {
              _checkAndNavigate();
            }
          },
        );
        return futureAsync.easyWhen(
          data: (data) => LoaderChild(),
          loadingWidget: () => child!,
          errorWidget: (error, stackTrace) => child!,
        );
      },
      child: const LoaderChild(),
    );
  }
}

class LoaderChild extends StatefulWidget {
  const LoaderChild({
    super.key,
  });

  @override
  State<LoaderChild> createState() => _LoaderChildState();
}

class _LoaderChildState extends State<LoaderChild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Stack(
        fit: StackFit.loose,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(R.ASSETS_IMAGES_TOP_RIGHT_WHITE_BLURRED_PNG),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(R.ASSETS_IMAGES_BOTTOM_LEFT_WHITE_BLURRED_PNG),
          ),
          SafeArea(
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: AppColors.kwhite,
                    child: SvgPicture.asset(R.ASSETS_IMAGES_LOGO_ICON_SVG),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'TO-DO',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: AppColors.grey200,
                        ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
