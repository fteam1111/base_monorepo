part of 'loading_shimmer.dart';

class _CircularLoader extends StatelessWidget {
  const _CircularLoader();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
