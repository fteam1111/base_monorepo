import 'package:features_auth/features_auth.dart';
import 'package:features_auth/presentation/widgets/login_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

/// Login form widget
class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.baseUrl, required this.loginUrl});

  final String baseUrl;
  final String loginUrl;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final WebViewController _controller;
  final String queryGetTokenFromHTML = 'window.document.body.innerText';
  bool _isWebViewLoading = true;
  bool uiForTest = true;

  @override
  void initState() {
    super.initState();
    _createWebController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: uiForTest
              ? Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        const AuthLoginRequested(email: '', password: ''),
                      );
                    },
                    child: const Text('Login For test'),
                  ),
                )
              : LayoutBuilder(
                  builder: (context, constraint) {
                    return RefreshIndicator(
                      onRefresh: _onRefresh,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraint.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                Container(
                                  height: context.statusBarHeight,
                                  color: Colors.white,
                                ),
                                LoginAppBar(
                                  onBack: () async {
                                    final goBack = await _controller
                                        .canGoBack();
                                    if (goBack == true) {
                                      await _controller.goBack();
                                    }
                                  },
                                  canBack: context.select(
                                    (AuthBloc bloc) =>
                                        bloc.state is AuthWebViewState
                                        ? (bloc.state as AuthWebViewState)
                                              .canGoBack
                                        : false,
                                  ),
                                ),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      WebViewWidget(controller: _controller),
                                      if (_isWebViewLoading)
                                        const ColoredBox(
                                          color: Colors.white,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Future<void> _onCheckCanBack(String url) async {
    final canBack = await _controller.canGoBack();
    if (!mounted) return;
    context.read<AuthBloc>().add(
      AuthWebViewBackAvailabilityChanged(canGoBack: canBack),
    );
  }

  void _createWebController() {
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams();
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final controller = WebViewController.fromPlatformCreationParams(params)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onUrlChange: (UrlChange urlChange) async {
            final url = urlChange.url ?? '';

            final isOnLogin = url == widget.loginUrl;
            final canGoBack = !isOnLogin;

            if (!mounted) return;
            context.read<AuthBloc>().add(
              AuthWebViewBackAvailabilityChanged(canGoBack: canGoBack),
            );
          },
          onPageStarted: (_) {
            if (!mounted) return;
            setState(() {
              _isWebViewLoading = true;
            });
          },
          onPageFinished: (String url) async {
            debugPrint('Page finished loading: $url');

            if (mounted) {
              setState(() {
                _isWebViewLoading = false;
              });
            }

            if (url.startsWith(widget.baseUrl)) {
              debugPrint('blocking navigation to $url');
              final token =
                  await _controller.runJavaScriptReturningResult(
                        queryGetTokenFromHTML,
                      )
                      as String?;

              if (!mounted) return;
              context.read<AuthBloc>().add(
                AuthWebViewTokenExtracted(rawToken: token ?? ''),
              );
            }

            await _onCheckCanBack(url);
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.loginUrl));

    _controller = controller;
  }

  Future<void> _onRefresh() async {
    await _controller.reload();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
