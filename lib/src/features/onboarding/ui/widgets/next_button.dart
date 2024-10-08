import 'package:asp/asp.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/modules/responsive_layout/constants/k_device_size.dart';
import '../../../../shared/modules/responsive_layout/constants/k_figma_auto_scale.dart';
import '../../../../shared/widgets/buttons/transparent_button.dart';
import '../../../../shared/widgets/display_media/display_svg/display_svg.dart';
import '../../../../shared/widgets/transform/mirror_horizontal.dart';
import '../../interactor/services/i_onboarding_controller_service.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AtomBuilder(builder: (context, get) {
      // Fetch onboarding state from D.I.
      final onboardingController = Modular.get<IOnboardingControllerService>();

      // Subscribe to onboarding page events
      final enterButtonVisible =
          get(onboardingController.state.displayEnterButtonAtom);
      // Subscribe to onboarding page events
      get(onboardingController.state.scrollEndedAtom);

      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30 * figmaDiagonal),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          color: !onboardingController.state.scrollEndedAtom.state
              ? ds.colors.lightContainer.withOpacity(0.3)
              : ds.colors.lightContainer,
          width: enterButtonVisible ? deviceWidth : 134 * figmaWidth,
          height: 69 * figmaHeight,
          child: Stack(
            children: [
              //* Button Content
              AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                alignment: enterButtonVisible
                    ? Alignment.centerRight
                    : Alignment.center,
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  firstChild: MirrorHorizontal(
                    child: DisplaySvg(
                      width: 36 * figmaWidth,
                      height: 36 * figmaHeight,
                      svgPath: ds.assets.svg.arrowLeft.path,
                    ),
                  ),
                  secondChild: SizedBox(
                    width: 256 * figmaWidth,
                    child: Center(
                      child: AutoSizeText(
                        'Entrar',
                        style: ds.typography.onboardingBody,
                      ),
                    ),
                  ),
                  crossFadeState: enterButtonVisible
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                ),
              ),

              //* Button gesture detector
              !onboardingController.state.scrollEndedAtom.state
                  ? const SizedBox()
                  : TransparentButton(
                      onTap: () {
                        onboardingController.state.scrollEndedAtom.state
                            ? enterButtonVisible
                                ? onboardingController.clickEnterButton()
                                : onboardingController.clickNextButton()
                            : null;
                      },
                    ),
            ],
          ),
        ),
      );
    });
  }
}
