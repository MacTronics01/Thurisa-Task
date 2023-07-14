import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thurisa_labs_task/utils/widget_extensions.dart';
import '../../locator.dart';
import '../../utils/pallet.dart';
import '../../utils/shimmer_loader.ui.dart';
import 'base.vm.dart';


// the base view controls all the states of all the UIs
class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child)? builder;
  final Function(T)? onModelReady;
  final Function(T)? onModelDispose;
  final Color color;
  const BaseView({Key? key, this.builder, this.onModelReady, this.color = Pallet.white, this.onModelDispose}) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = getIt<T>();

  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onModelDispose != null) {
      widget.onModelDispose!(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (_) => model,
        child: Consumer<T>(
          builder: (_,model, __) => Stack(
            children: [
              widget.builder!.call(_, model, __),
              if (model.isLoading)
                 Container(
                   color: Pallet.white,
                   width: width(context),height: height(context),
                   child: Center(
                     child: CircularProgressIndicator(color: Pallet.primary,),
                   ),
                )
                // ShimmerUser()
            ],
          ),
        ));
  }
}
