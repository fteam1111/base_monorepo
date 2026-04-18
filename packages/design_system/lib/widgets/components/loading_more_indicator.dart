import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class LoadingMoreIndicator extends StatefulWidget {
  const LoadingMoreIndicator({super.key, required this.controller});

  final ScrollController controller;

  @override
  State<LoadingMoreIndicator> createState() => _LoadingMoreIndicatorState();
}

class _LoadingMoreIndicatorState extends State<LoadingMoreIndicator> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = widget.controller;
      if (!controller.hasClients) return;

      final position = controller.position;
      controller.jumpTo(position.maxScrollExtent);
    });
  }

  @override
  void didUpdateWidget(covariant LoadingMoreIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller == widget.controller) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = widget.controller;
      if (!controller.hasClients) return;

      final position = controller.position;
      controller.jumpTo(position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sectionPadding),
      child: LoadingShimmer.circular(),
    );
  }
}
