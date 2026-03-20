import 'package:core/factory/data/models/factory_model_dto.dart';
import 'package:core/factory/domain/entities/factory_entity.dart';

extension FactoryMapper on FactoryModelDto {
  FactoryEntity toEntity() {
    return FactoryEntity(
      id: id,
      name: name,
      address: address,
    );
  }
}

