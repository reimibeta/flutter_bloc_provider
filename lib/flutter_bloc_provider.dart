library flutter_bloc_provider;

// Generic Interface for all BLoCs
import 'package:flutter/material.dart';

abstract class BlocBase {
  void dispose();
}

// Generic BLoC provider
class FlutterBlocProvider<T extends BlocBase> extends StatefulWidget {
  FlutterBlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }): super(key: key);

  final T bloc;
  final Widget child;

  @override
  _FlutterBlocProviderState<T> createState() => _FlutterBlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context){
    final type = _typeOf<FlutterBlocProvider<T>>();
    // ignore: deprecated_member_use
    FlutterBlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    // FlutterBlocProvider<T> provider = context.getElementForInheritedWidgetOfExactType<FlutterBlocProvider<T>>().widget;
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _FlutterBlocProviderState<T> extends State<FlutterBlocProvider<BlocBase>>{
  @override
  void dispose(){
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return widget.child;
  }
}