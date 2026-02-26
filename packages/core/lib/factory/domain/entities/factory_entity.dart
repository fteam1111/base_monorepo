import 'package:equatable/equatable.dart';

class FactoryEntity extends Equatable {
  final int id;
  final String name;
  final String address;

  const FactoryEntity({
    required this.id,
    required this.name,
    required this.address,
  });

  @override
  List<Object?> get props => [id, name, address];

  @override
  String toString() => 'FactoryEntity(id: $id, name: $name, address: $address)';
}

