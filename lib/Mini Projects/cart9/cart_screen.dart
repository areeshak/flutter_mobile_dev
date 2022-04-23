//user can see items in their cart and can also update them

import 'package:flutter/material.dart';
import 'details.dart';

class CartScreen extends StatefulWidget {
  final Function(String) onUpdate;
  List<Details> cartDetails = [];

  CartScreen({Key? key, required this.cartDetails, required this.onUpdate})
      : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isRemoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.separated(
        itemCount: widget.cartDetails.length,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.black12,
        ),
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            child: Text(widget.cartDetails[index].type),
            backgroundColor: (widget.cartDetails[index].type == 'D')
                ? Colors.purple
                : (widget.cartDetails[index].type == 'S')
                ? Colors.blueGrey
                : Colors.blue,
          ),
          title: Text(widget.cartDetails[index].dishName),
          trailing: GestureDetector(
            onTap: () async {
              isRemoved = await showDialog(
                //dialog
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Remove this  item?'),
                    content: const Text(
                        'This will remove this dish from your cart'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text('Yes')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('No')),
                    ],
                  ));
              if (isRemoved == true) {
                widget.onUpdate(widget.cartDetails[index].dishName);                        //callback --> deselect the removed dish on first page
              }
              setState(() {});
            },
            child:
            const Icon(Icons.remove_circle, color: Colors.indigo, size: 28),
          ),
        ),
      ),
    );
  }
}
