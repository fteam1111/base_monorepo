// Error handling
export 'package:core/error/api_failures.dart';
export 'package:core/error/errors.dart';
export 'package:core/error/error_mapper.dart';
export 'package:core/error/exception.dart';
export 'package:core/error/failure_handler.dart';
export 'package:core/error/failures.dart';
export 'package:core/error/tr_object.dart';

// Utils
export 'package:core/utils/debounce.dart';
export 'package:core/utils/logger.dart';
export 'package:core/utils/measure_widget.dart';
export 'package:core/utils/throttle.dart';

// Value objects & validators
export 'package:core/value/constants.dart';
export 'package:core/value/value_objects.dart';
export 'package:core/value/value_transformers.dart';
export 'package:core/value/value_validators.dart';

// Factory (global)
export 'package:core/factory/domain/entities/factory_entity.dart';
export 'package:core/factory/domain/repositories/factory_repository.dart';
export 'package:core/factory/domain/usecases/get_client_factories_usecase.dart';
export 'package:core/factory/data/datasources/remote/factory_remote_datasource.dart';
export 'package:core/factory/data/mappers/factory_mapper.dart';
export 'package:core/factory/data/models/factory_model_dto.dart';
export 'package:core/factory/data/repositories/factory_repository_impl.dart';
export 'package:core/factory/bloc/factory_cubit.dart';
export 'package:core/factory/bloc/factory_state.dart';

// Role (global)
export 'package:core/role/domain/entities/user_role_entity.dart';
export 'package:core/role/domain/repositories/user_role_repository.dart';
export 'package:core/role/domain/usecases/get_client_roles_usecase.dart';
export 'package:core/role/data/datasources/remote/role_remote_datasource.dart';
export 'package:core/role/data/mappers/user_role_mapper.dart';
export 'package:core/role/data/models/user_role_model_dto.dart';
export 'package:core/role/data/repositories/user_role_repository_impl.dart';
export 'package:core/role/bloc/user_role_cubit.dart';
export 'package:core/role/bloc/user_role_state.dart';

// config
export 'package:core/config/base_config.dart';
