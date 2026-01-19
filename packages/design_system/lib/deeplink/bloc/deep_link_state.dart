part of 'deep_link_bloc.dart';

@immutable
sealed class DeepLinkState extends Equatable {
  const DeepLinkState();

  @override
  List<Object?> get props => [];
}

final class DeepLinkInitial extends DeepLinkState {
  const DeepLinkInitial();
}

final class LinkPending extends DeepLinkState {
  final AppLink link;

  const LinkPending(this.link);

  @override
  List<Object?> get props => [link];
}

final class DeepLinkingError extends DeepLinkState {
  final ApiFailure failure;

  const DeepLinkingError(this.failure);

  @override
  List<Object?> get props => [failure];
}

final class RedirectExampleDeeplink extends DeepLinkState {
  const RedirectExampleDeeplink();
}
