import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:features_parking_history/domain/entities/vehicle_history_entity.dart';
import 'package:features_parking_history/presentation/bloc/vehicle_history_bloc.dart';
import 'package:features_parking_history/presentation/bloc/vehicle_history_event.dart';
import 'package:features_parking_history/presentation/bloc/vehicle_history_state.dart';
import 'package:features_parking_history/presentation/widgets/parking_history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';

class ParkingHistoryPage extends StatefulWidget {
  const ParkingHistoryPage({super.key});

  @override
  State<ParkingHistoryPage> createState() => _ParkingHistoryPageState();
}

class _ParkingHistoryPageState extends State<ParkingHistoryPage> {
  final _searchController = TextEditingController();
  final _debounce = Debounce(delay: const Duration(milliseconds: 500));
  final _scrollController = ScrollController();
  final double _spacingBottomList = 100;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    _debounce.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    // Currently no search endpoint available
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.background,
      appBar: CustomAppBar(
        title: context.l10n.parkingHistoryTitle,
        leadingType: CustomAppBarLeadingType.none,
      ),
      body: BlocConsumer<VehicleHistoryBloc, VehicleHistoryState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(context.appSpacing.pageHorizontal),
                child: AppTextField.search(
                  controller: _searchController,
                  hintText: context.l10n.parkingHistoryTitle,
                  suffix: Padding(
                    padding: const EdgeInsets.only(
                      right: AppSpacing.paddingXXXS,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: InkResponse(
                        onTap: () {
                          AppRoutes.navigateToQrScanner(
                            context,
                            onVehicleFound: (vehicle) {
                              AppRoutes.navigateBack(context);
                              _searchController.text = vehicle.serialNumber;
                              if (mounted) {
                                context.read<VehicleHistoryBloc>().add(
                                  VehicleHistoryStarted(vehicle.id),
                                );
                              }
                            },
                          );
                        },
                        containedInkWell: true,
                        highlightShape: BoxShape.circle,
                        child: Container(
                          width: AppSpacing.huge,
                          height: AppSpacing.huge,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            AppIcons.icScanQr,
                            package: AppAssets.package,
                            height: AppSpacing.mediumLarge,
                            width: AppSpacing.mediumLarge,
                            color: AppColors.secondaryLight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(child: _buildBody(context, state)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, VehicleHistoryState state) {
    if (state.isInitial) {
      return Center(
        child: Text(
          context.l10n.parkingHistoryScanPrompt,
          style: context.appTypography.bodyMedium.copyWith(
            color: context.appColors.neutralVariant,
          ),
        ),
      );
    }

    if (state.isLoading && state.allHistories.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.isFailure && state.allHistories.isEmpty) {
      return Center(
        child: Text(
          state.errorMessage ?? context.l10n.parkingHistoryErrorLoading,
          style: context.appTypography.bodyMedium.copyWith(
            color: context.colorScheme.error,
          ),
        ),
      );
    }

    if (state.allHistories.isEmpty && state.isSuccess) {
      return Center(child: Text(context.l10n.parkingHistoryEmpty));
    }

    return ScrollList<VehicleHistoryEntity>(
      controller: _scrollController,
      isLoading: state.isLoading,
      items: state.allHistories,
      onRefresh: () async => context.read<VehicleHistoryBloc>().add(
        const VehicleHistoryRefreshed(),
      ),
      onLoadingMore: () => context.read<VehicleHistoryBloc>().add(
        const VehicleHistoryLoadMoreRequested(),
      ),
      noRecordFoundWidget: const SizedBox.shrink(),
      header: const Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.medium),
        child: SizedBox.shrink(),
      ),
      separatorBuilder: (context, index) {
        return const SizedBox(height: AppSpacing.sectionPadding);
      },
      itemBuilder: (context, index, item) {
        return Padding(
          padding: EdgeInsets.only(
            left: context.appSpacing.pageHorizontal,
            right: context.appSpacing.pageHorizontal,
            bottom: index == state.allHistories.length - 1
                ? _spacingBottomList
                : 0,
          ),
          child: ParkingHistoryItem(item: item),
        );
      },
    );
  }
}
