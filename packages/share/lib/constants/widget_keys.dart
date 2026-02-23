import 'package:flutter/foundation.dart';

class WidgetKeys {
  static const ValueKey<String> scrollList = ValueKey<String>('scroll_list');
  static const ValueKey<String> loadMoreLoader = ValueKey<String>(
    'scroll_list_load_more_loader',
  );

  static const ValueKey<String> scrollGrid = ValueKey<String>('scroll_grid');
  static const ValueKey<String> loadMoreGridLoader = ValueKey<String>(
    'scroll_grid_load_more_loader',
  );

  static const ValueKey<String> loaderImage = ValueKey<String>(
    'loading_shimmer_logo',
  );
  static const ValueKey<String> circularLoader = ValueKey<String>(
    'loading_shimmer_circular',
  );
}
