import 'package:flutter/material.dart';

import '../constants/k_figma_auto_scale.dart';
import '../constants/k_platform_info.dart';
import '../data/services/platform_info_service.dart';
import '../interactor/enums/platform_types_enum.dart';

/// This is the [ResponsiveLayout] widget.
/// Our root widget for all pages.
///
/// This widget is responsible for rendering the page layout,
/// if the viewport changes, it will adjust the layout accordingly,
/// taking into consideration, platform type and size.
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    this.mobileLayout,
    this.tabletLayout,
    this.desktopLayout,
    this.backgroundColor,
  });

  final Widget? mobileLayout;
  final Widget? tabletLayout;
  final Widget? desktopLayout;
  final Color? backgroundColor;

  void updateViewportScaling(BoxConstraints constraints) {
    // Update current global viewport dimensions constant
    platformInfo = PlatformInfoService().updatePlatformInfo(
      availableViewportWidth: constraints.maxWidth,
      availableViewportHeight: constraints.maxHeight,
    );

    // Update current global figma scaling constant
    figmaWidth = platformInfo.figmaWidth;
    figmaHeight = platformInfo.figmaHeight;
  }

  Widget chooseLayout() {
    // Chooses the layout type according to the current platform
    final layoutType = platformInfo.platformType;
    late final Widget currentLayout;
    switch (layoutType) {
      case PlatformTypesEnum.mobile:
        currentLayout = mobileLayout ?? const SizedBox();
        break;
      case PlatformTypesEnum.tablet:
        currentLayout = tabletLayout ?? (mobileLayout ?? const SizedBox());
        break;
      case PlatformTypesEnum.desktop:
        currentLayout = desktopLayout ?? (mobileLayout ?? const SizedBox());
        break;
      default:
        currentLayout = mobileLayout ?? const SizedBox();
        break;
    }

    return currentLayout;
  }

  // --- BUILD METHOD ---
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        updateViewportScaling(constraints);
        final layout = chooseLayout();

        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundColor ?? Colors.transparent,
          body: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
              ),
              layout,
            ],
          ),
        );
      },
    );
  }
}
