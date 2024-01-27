import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  const BaseView({
    Key? key,
    required this.viewModel,
    required this.onPageBuilder,
    this.onDispose,
  }) : super(key: key);
  final Widget Function(BuildContext context, T viewModel) onPageBuilder;
  final T viewModel;
  final VoidCallback? onDispose;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T> extends State<BaseView<T>> {
  late T viewModel;
  @override
  void initState() {
    viewModel = widget.viewModel;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose?.call();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, viewModel);
  }
}
