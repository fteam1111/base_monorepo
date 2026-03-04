import 'package:design_system/design_system.dart';
import 'package:features_vehicle_charging/domain/entities/vehicle_charging_entity.dart';
import 'package:features_vehicle_charging/presentation/bloc/vehicle_charging_bloc.dart';
import 'package:features_vehicle_charging/presentation/bloc/vehicle_charging_event.dart';
import 'package:features_vehicle_charging/presentation/bloc/vehicle_charging_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:share/extensions/context_ext.dart';

/// Result page shown after successfully sending a vehicle
/// for discharging. Displays updated status, vehicle info,
/// and a completion button.
class DischargingResultPage extends StatefulWidget {
  const DischargingResultPage({super.key, required this.item});

  final VehicleChargingEntity item;

  @override
  State<DischargingResultPage> createState() => _DischargingResultPageState();
}

class _DischargingResultPageState extends State<DischargingResultPage> {
  @override
  void initState() {
    super.initState();
    context.read<VehicleChargingBloc>().add(
      VehicleChargingDischargeRequested(widget.item.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final typography = context.textTheme;
    final spacing = context.appSpacing;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: CustomAppBar(
        backgroundColor: colorScheme.surface,
        leadingType: CustomAppBarLeadingType.back,
        onBack: () => Navigator.pop(context),
      ),
      body: BlocBuilder<VehicleChargingBloc, VehicleChargingState>(
        builder: (context, state) {
          if (state.dischargeStatus == DischargeStatus.loading) {
            return Center(child: LoadingShimmer.circular());
          }

          if (state.dischargeStatus == DischargeStatus.failure) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(spacing.pageHorizontal),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: colorScheme.error,
                    ),
                    const Gap(AppSpacing.medium),
                    Text(
                      context.l10n.vehicleChargingFetchError,
                      style: typography.bodyMedium?.copyWith(
                        color: colorScheme.error,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(AppSpacing.medium),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(context.l10n.back),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state.dischargeStatus == DischargeStatus.success &&
              state.lastDischargedVehicle != null) {
            final vehicle = state.lastDischargedVehicle!;
            final now = DateFormat(
              'HH:mm:ss - d/M/yyyy',
            ).format(DateTime.now());

            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: spacing.pageHorizontal,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Gap(AppSpacing.extraLarge),
                            _buildIcon(colorScheme),
                            const Gap(AppSpacing.sectionSpacing),
                            Text(
                              context.l10n.dischargingStatusUpdated,
                              style: typography.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                                color: colorScheme.primary,
                                letterSpacing: 1.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Gap(AppSpacing.small),
                            RichText(
                              text: TextSpan(
                                style: typography.bodyMedium,
                                children: [
                                  TextSpan(
                                    text:
                                        '${context.l10n.dischargingVehicleStatus} ',
                                    style: typography.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: vehicle.statusLabel.toUpperCase(),
                                    style: typography.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Gap(AppSpacing.sectionSpacing),
                            _buildInstructionBanner(
                              context,
                              colorScheme,
                              typography,
                            ),
                            const Gap(AppSpacing.sectionSpacing),
                            _buildInfoCard(
                              context,
                              colorScheme,
                              typography,
                              vehicle,
                              now,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(AppSpacing.medium),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSpacing.medium,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppRadius.xxl),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          context.l10n.dischargingCompleteAction,
                          style: typography.titleSmall?.copyWith(
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                    const Gap(AppSpacing.medium),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildIcon(ColorScheme colorScheme) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.bolt, size: 40, color: colorScheme.primary),
    );
  }

  Widget _buildInstructionBanner(
    BuildContext context,
    ColorScheme colorScheme,
    TextTheme typography,
  ) {
    return CustomCard(
      backgroundColor: colorScheme.primary.withValues(alpha: 0.05),
      elevation: 0,
      shadowColor: Colors.transparent,
      child: Row(
        children: [
          Icon(Icons.check_circle_outline, color: colorScheme.primary),
          const Gap(AppSpacing.small),
          Expanded(
            child: Text(
              context.l10n.dischargingInstruction,
              style: typography.bodySmall?.copyWith(
                fontStyle: FontStyle.italic,
                color: colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context,
    ColorScheme colorScheme,
    TextTheme typography,
    VehicleChargingEntity vehicle,
    String time,
  ) {
    return CustomCard(
      elevation: 0,
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      child: Column(
        children: [
          _InfoRow(
            label: '${context.l10n.dischargingVinLabel}:',
            value: vehicle.vin,
            valueColor: colorScheme.primary,
          ),
          const Gap(AppSpacing.small),
          _InfoRow(
            label: '${context.l10n.dischargingLocationLabel}:',
            value: vehicle.factoryName,
          ),
          const Gap(AppSpacing.small),
          _InfoRow(label: '${context.l10n.dischargingTimeLabel}:', value: time),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value, this.valueColor});

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final typography = context.textTheme;
    final colorScheme = context.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: typography.bodySmall?.copyWith(
              color: colorScheme.tertiary,
            ),
          ),
        ),
        const Gap(AppSpacing.small),
        Flexible(
          child: Text(
            value,
            style: typography.bodySmall?.copyWith(
              color: valueColor ?? colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
