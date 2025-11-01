// import 'package:flutter/material.dart';
// import '../services/in_memory_store.dart';

// class ChangeNotifierProvider extends InheritedWidget {
//   final InMemoryStore store;

//   const ChangeNotifierProvider({
//     super.key,
//     required super.child,
//     required this.store,
//   });

//   static InMemoryStore of(BuildContext context) {
//     final provider =
//         context.dependOnInheritedWidgetOfExactType<ChangeNotifierProvider>();
//     assert(provider != null, 'No provider found in context');
//     return provider!.store;
//   }

//   @override
//   bool updateShouldNotify(ChangeNotifierProvider oldWidget) =>
//       oldWidget.store != store;
// }

// class Consumer extends StatefulWidget {
//   final Widget Function(BuildContext, InMemoryStore, Widget?) builder;
//   const Consumer({super.key, required this.builder});

//   @override
//   State<Consumer> createState() => _ConsumerState();
// }

// class _ConsumerState extends State<Consumer> {
//   late InMemoryStore store;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     store = ChangeNotifierProvider.of(context);
//     store.addListener(_onStoreChanged);
//   }

//   void _onStoreChanged() => setState(() {});
//   @override
//   void dispose() {
//     store.removeListener(_onStoreChanged);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.builder(context, store, null);
//   }
// }
export 'package:provider/provider.dart';
