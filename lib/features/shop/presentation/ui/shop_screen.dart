import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_go_router/features/app/logic/util/injection/injection.dart';
import 'package:flutter_go_router/features/app/presentation/ui/cubit/session_cubit.dart';
import 'package:flutter_go_router/features/app/presentation/ui/widget/session_widget.dart';
import 'package:flutter_go_router/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:flutter_go_router/features/shop/presentation/ui/widget/shop_page.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SessionWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Shop Screen'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                BlocProvider.of<SessionCubit>(context).loggedOut();
              },
            ),
          ],
        ),
        body: BlocProvider(
          create: (context) => getIt<ShopCubit>()..getArticle(),
          child: const ShopPage(),
        ),
      ),
    );
  }
}
