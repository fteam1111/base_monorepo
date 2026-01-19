part of 'deep_link_bloc.dart';

@immutable
sealed class DeepLinkEvent extends Equatable {
  const DeepLinkEvent();

  @override
  List<Object?> get props => [];
}

class InitializeEvent extends DeepLinkEvent {
  const InitializeEvent();
}

/// add link vào trong hàng đợi
class AddPendingLinkEvent extends DeepLinkEvent {
  final AppLink link;

  const AddPendingLinkEvent(this.link);

  @override
  List<Object?> get props => [link];
}

/// consume link trong hàng đợi
class ConsumePendingLinkEvent extends DeepLinkEvent {
  const ConsumePendingLinkEvent();

  @override
  List<Object?> get props => [];
}
