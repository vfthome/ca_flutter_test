import 'package:flutter/material.dart';

import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/modules/responsive_layout/constants/k_figma_auto_scale.dart';
import '../../../../shared/widgets/display_media/display_image/display_image.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10 * figmaHeight,
      ),
      child: DisplayImage(
        resolution: 3,
        height: 37.98 * figmaHeight,
        width: 358.68 * figmaWidth,
        imagePath: ds.assets.image.filterBar.path,
      ),
    );
  }
}
