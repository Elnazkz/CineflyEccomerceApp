import 'package:flutter/material.dart';

class CartListItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;
  final int quantity;
  final double price;
  final Function(bool) onQuantityChanged;


  const CartListItem(
      {super.key,
      required this.id,
      required this.imageUrl,
      required this.name,
      required this.quantity,
      required this.price,
      required this.onQuantityChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            Image.network(
              imageUrl,
              height: 100,
              width: 100,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(child: Text('Oops!')),
                );
              },
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 5.0),
                    child: Text(
                      name,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 280,
                    child: Row(
                      children: [
                        IconButton(
                            icon: const Icon(Icons.remove),
                            iconSize: 20,
                            onPressed: () { onQuantityChanged(false); }),
                        Text(quantity.toString()),
                        IconButton(
                            icon: const Icon(Icons.add),
                            iconSize: 20,
                            onPressed: () { onQuantityChanged(true); }),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                '\$${price.toString()}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

