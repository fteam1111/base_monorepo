# features_parking_history

## Overview
Gói tính năng quản lý, tra cứu lịch sử thao tác của phương tiện hoặc DO đỗ xe trong nhà máy.

## User Flow
1. Người dùng quét mã QR bằng icon chức năng trên Header của AppBar. (Hiện tại đang sử dụng mockup với vehicleId mặc định).
2. Hệ thống gọi UseCase `GetVehicleHistoriesUseCase` để tải dữ liệu lịch sử thao tác.
3. Nếu quét thành công / tải dữ liệu thành công -> trả về màn hình hiển thị danh sách thao tác thông qua thành phần BLoC (`VehicleHistoryStatus.success`).
4. Nếu thất bại -> hiển thị thông báo lỗi trên giữa màn hình (`VehicleHistoryStatus.failure`).

## Architecture
```
packages/features/features_parking_history
├── lib/
│   ├── data/
│   │   ├── datasources/
│   │   │   └── remote/parking_history_remote_datasource.dart
│   │   ├── mappers/
│   │   │   └── vehicle_history_mapper.dart
│   │   ├── models/
│   │   │   └── vehicle_history_dto.dart
│   │   └── repositories/
│   │       └── parking_history_repository_impl.dart
│   ├── domain/
│   │   ├── entities/
│   │   │   └── vehicle_history_entity.dart
│   │   ├── repositories/
│   │   │   └── parking_history_repository.dart
│   │   └── usecases/
│   │       └── get_vehicle_histories_usecase.dart
│   ├── presentation/
│   │   ├── bloc/
│   │   │   ├── vehicle_history_bloc.dart
│   │   │   ├── vehicle_history_event.dart
│   │   │   └── vehicle_history_state.dart
│   │   ├── pages/
│   │   │   └── parking_history_page.dart
│   │   └── widgets/
│   │       └── parking_history_item.dart
│   └── features_parking_history.dart
```

## API
- Endpoint: `GET /api/v1/client/vehicles/{id}/history`
- Route Constant: `ApiRoutes.vehicleHistory` 
- Response Model: `BasePaginationResponse<List<VehicleHistoryDto>>`

## States
| Trạng thái cơ sở | Giải thích | Ảnh hưởng UI |
| --- | --- | --- |
| Initial | Khi chưa quét QR ID nào cả. | Màn hình prompt gợi ý quét QR. |
| Loading | Khi thao tác load bắt đầu hoặc có thao tác làm mới dữ liệu. | Hiển thị vòng xoay. |
| Success | Kết quả tải về thành công (Dù danh sách rỗng hay không). | Grid view / List items hiển thị. |
| Failure | Kết nối mạng lỗi hoặc back-end throw exception. | Báo lỗi qua text thay thế danh sách. |

## Validation
- `AppConstants.defaultPageSize` mặc định được sử dụng cho truy xuất lịch sử.
- Thông qua UseCase parameters model `GetVehicleHistoriesParams`.

## DI & Routing
- Registration in `dependency_manager.dart`: 
  - Đăng ký interface DI: `IParkingHistoryRepository` ánh xạ tới `ParkingHistoryRepositoryImpl`.
  - Đăng ký `GetVehicleHistoriesUseCase` vào container (Lazy Singleton).
  - Đăng ký `VehicleHistoryBloc` vào factory với requirement Usecase.
- Routing trong `app_router.dart` tương ứng với route: `AppRoutes.parkingHistory`.

## Tests
| Filename | Scope |
| --- | --- |
| `get_vehicle_histories_usecase_test.dart` | Fake Repo pattern đảm bảo UseCase lấy được right / left fail path hợp lý. |
| `parking_history_page_test.dart` | Khởi tạo trang với WidgetTest, nạp fake bloc stream để test các components load/success/error. |

## Dependencies
- `core`: Xử lý ngoại lệ, phân trang (Pagination).
- `design_system`: Theme, Typography, Layout spacing.
- `share`: Router constants.
- `localization`: Hỗ trợ String đa ngôn ngữ cho Error và Prompt.
