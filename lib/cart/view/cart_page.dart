import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/cart/bloc/cart_event.dart';
import 'package:stylish/cart/bloc/cart_info_input.dart';

import '../../util/app_bar.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_state.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: createStylishAppBar(context),
        body: LayoutBuilder(builder: (context, constraints) {
          return BlocProvider(
            create: (context) {
              return CartBloc();
            },
            child: const Center(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: MobileCartPage(),
            )),
          );
        }));
  }
}

class MobileCartPage extends StatelessWidget {
  const MobileCartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    constraints: const BoxConstraints(minWidth: 100),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text('信用卡號碼'),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '輸入信用卡號碼',
                      ),
                      onChanged: (value) {
                        context.read<CartBloc>().add(
                            TextInputUpdated(CartInfoInput.cardNumber, value));
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    constraints: const BoxConstraints(minWidth: 100),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text('有效期限'),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '輸入有效期限',
                      ),
                      onChanged: (value) {
                        context.read<CartBloc>().add(TextInputUpdated(
                            CartInfoInput.dueMonthAndYear, value));
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    constraints: const BoxConstraints(minWidth: 100),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text('安全碼'),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '輸入安全碼',
                      ),
                      onChanged: (value) {
                        context
                            .read<CartBloc>()
                            .add(TextInputUpdated(CartInfoInput.ccv, value));
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                ),
                onPressed: () {
                  if (state.isLoading) return;
                  context.read<CartBloc>().add(const StartCheckoutEvent());
                },
                child: state.isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text('確認付款')),
            if (state.prime?.isNotEmpty == true)
              Text('Prime: ${state.prime}'),
            const SizedBox(height: 10),
            if (state.isLoading != true && state.errorMessage != null)
              Text(state.errorMessage ?? '',
                  style: const TextStyle(
                    color: Colors.red,
                  ))
          ],
        ),
      );
    });
  }
}
