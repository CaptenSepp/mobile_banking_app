import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class HomePage extends StatelessWidget {

  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) => Center(
          child: Column(
            children: [
              Text(''),
              FloatingActionButton(onPressed: () {
                VRouter.of(context).to('/transactionPage');
              })
            ],
          ),
        ),
      ),
    );
  }
}
