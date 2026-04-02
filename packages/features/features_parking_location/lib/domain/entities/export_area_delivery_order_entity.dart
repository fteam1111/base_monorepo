import 'package:equatable/equatable.dart';

class ExportAreaDeliveryOrderEntity extends Equatable {
  final int id;
  final String doCode;
  final String storeName;
  final String storeBranch;
  final String status;
  final int totalQuantity;
  final int fulfilledQuantity;
  final String createdAt;
  final String updatedAt;

  const ExportAreaDeliveryOrderEntity({
    required this.id,
    required this.doCode,
    required this.storeName,
    required this.storeBranch,
    required this.status,
    required this.totalQuantity,
    required this.fulfilledQuantity,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    doCode,
    storeName,
    storeBranch,
    status,
    totalQuantity,
    fulfilledQuantity,
    createdAt,
    updatedAt,
  ];
}
