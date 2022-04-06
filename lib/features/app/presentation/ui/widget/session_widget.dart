// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_go_router/features/app/logic/util/router/page_name.dart';
// import 'package:flutter_go_router/features/app/presentation/ui/cubit/session_cubit.dart';
// import 'package:go_router/go_router.dart';

// class SessionWidget extends StatelessWidget {
//   final Widget child;
//   const SessionWidget({
//     Key? key,
//     required this.child,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<SessionCubit, SessionState>(
//       listener: (context, state) {
//         debugPrint('session state is ' + state.toString());
//         if (state is IsSignedIn) {
//           context.goNamed(PageName.pageHome);
//         } else if (state is IsSignedOut) {
//           context.goNamed(PageName.pageSignIn);
//         } else if (state is ShowDetail) {
//           context.goNamed(
//             PageName.pageDetail,
//             params: {'code': state.article.code},
//           );
//         }
//       },
//       child: child,
//     );
//   }
// }
