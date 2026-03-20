import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/deeplink/domain/repositories/deep_link_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'deep_link_event.dart';
part 'deep_link_state.dart';

class DeepLinkBloc extends Bloc<DeepLinkEvent, DeepLinkState> {
  DeepLinkBloc({required this.repository}) : super(const DeepLinkInitial()) {
    on<InitializeEvent>(_onInitialize);
    on<AddPendingLinkEvent>(_onAddPendingLink);
    on<ConsumePendingLinkEvent>(_onConsumePendingLink);
  }

  final DeepLinkingRepository repository;
  StreamSubscription<AppLink>? _deepLinkStreamSubscription;

  Future<void> _onInitialize(
    InitializeEvent event,
    Emitter<DeepLinkState> emit,
  ) async {
    await _deepLinkStreamSubscription?.cancel();

    _deepLinkStreamSubscription = repository.watchDeepLinkValue().listen((
      event,
    ) {
      if (isClosed) return;
      add(AddPendingLinkEvent(event));
    });

    final failureOrSuccess = await repository.initializeDeepLink();
    if (isClosed) return;
    failureOrSuccess.fold(
      (failure) => emit(DeepLinkingError(failure)),
      (success) {},
    );
  }

  FutureOr<void> _onAddPendingLink(
    AddPendingLinkEvent event,
    Emitter<DeepLinkState> emit,
  ) {
    emit(LinkPending(event.link));
  }

  FutureOr<void> _onConsumePendingLink(
    ConsumePendingLinkEvent event,
    Emitter<DeepLinkState> emit,
  ) {
    if (state case LinkPending(:final link) when link.isValid()) {
      if (link.isExampleLink) {
        emit(const RedirectExampleDeeplink());
      }
    }
  }
}
