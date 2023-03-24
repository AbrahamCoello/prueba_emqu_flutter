import 'package:flutter/material.dart';

class ModalBottomSheetCustom extends StatelessWidget {
  final List<Widget> children;
  final Function? onClose;
  const ModalBottomSheetCustom(
      {super.key, required this.children, this.onClose});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (onClose != null) {
          onClose!();
        }
      },
      child: Container(
        color: const Color.fromRGBO(0, 0, 0, 0.001),
        child: GestureDetector(
          onTap: () {},
          child: DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.75,
            builder: (_, controller) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: SafeArea(
                  child: ListView.builder(
                    controller: controller,
                    itemCount: children.length,
                    itemBuilder: (BuildContext context, int index) {
                      return children[index];
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
