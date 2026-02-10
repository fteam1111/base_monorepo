import 'package:features_map/presentation/widgets/map_app_bar_title_section.dart';
import 'package:features_map/presentation/widgets/map_control_panel_section.dart';
import 'package:features_map/presentation/widgets/map_viewer_section.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class FactoryMapPage extends StatefulWidget {
  const FactoryMapPage({super.key});

  @override
  State<FactoryMapPage> createState() => _FactoryMapPageState();
}

class _FactoryMapPageState extends State<FactoryMapPage>
    with SingleTickerProviderStateMixin {
  late MapViewerController _mapViewerController;

  @override
  void initState() {
    super.initState();
    _mapViewerController = MapViewerController();
  }

  @override
  void dispose() {
    _mapViewerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => AppRoutes.navigateBack(context),
        ),
        title: const MapAppBarTitleSection(),
      ),
      body: Stack(
        children: [
          MapViewerSection(controller: _mapViewerController),

          Positioned(
            right: context.appSpacing.pageHorizontal,
            bottom: context.bottomPadding,
            child: MapControlPanelSection(
              onZoomIn: _mapViewerController.zoomIn,
              onZoomOut: _mapViewerController.zoomOut,
              onReset: _mapViewerController.reset,
            ),
          ),
        ],
      ),
    );
  }
}
