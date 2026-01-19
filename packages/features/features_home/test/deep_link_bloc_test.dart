// import 'dart:async';
//
// import 'package:core/core.dart';
// import 'package:dartz/dartz.dart';
// import 'package:design_system/deeplink/bloc/deep_link_bloc.dart';
// import 'package:design_system/deeplink/domain/repositories/deep_link_repository.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
//
// class _MockDeepLinkingRepository extends Mock implements DeepLinkingRepository {}
//
// void main() {
//   late DeepLinkingRepository repository;
//
//   setUp(() {
//     repository = _MockDeepLinkingRepository();
//   });
//
//   blocTest<DeepLinkBloc, DeepLinkState>(
//     'Add pending link',
//     build: () => DeepLinkBloc(repository: repository),
//     act: (bloc) => bloc.add(
//       AddPendingLinkEvent(
//         AppLink(Uri(scheme: 'fakeScheme', host: 'fakeHost').toString()),
//       ),
//     ),
//     expect: () => [
//       LinkPending(
//         AppLink(Uri(scheme: 'fakeScheme', host: 'fakeHost').toString()),
//       ),
//     ],
//   );
//
//   blocTest<DeepLinkBloc, DeepLinkState>(
//     'Consume pending link when state is not LinkPending',
//     build: () => DeepLinkBloc(repository: repository),
//     seed: () => const DeepLinkingError(ApiFailure.unknown()),
//     act: (bloc) => bloc.add(const ConsumePendingLinkEvent('app://example')),
//     expect: () => [],
//   );
//
//   blocTest<DeepLinkBloc, DeepLinkState>(
//     'Consume pending link with example link emits RedirectExampleDeeplink',
//     build: () => DeepLinkBloc(repository: repository),
//     seed: () => LinkPending(AppLink('app://example')),
//     act: (bloc) => bloc.add(const ConsumePendingLinkEvent('app://example')),
//     expect: () => [const RedirectExampleDeeplink()],
//   );
//
//   blocTest<DeepLinkBloc, DeepLinkState>(
//     'Initialize listens to deep link stream and emits LinkPending when stream emits',
//     build: () => DeepLinkBloc(repository: repository),
//     setUp: () {
//       when(() => repository.initializeDeepLink()).thenAnswer((_) async => right(unit));
//
//       final controller = StreamController<AppLink>();
//       addTearDown(controller.close);
//
//       when(() => repository.watchDeepLinkValue()).thenAnswer((_) => controller.stream);
//
//       // Emit after init is processed and listener is attached.
//       Future<void>.delayed(Duration.zero).then((_) {
//         controller.add(AppLink('app://example'));
//       });
//     },
//     act: (bloc) => bloc.add(const InitializeEvent()),
//     expect: () => [LinkPending(AppLink('app://example'))],
//   );
// }
