import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;
  final String description;
  final double price;
  final Function() onItemClick;

  const ProductListItem(
      {super.key,
      required this.id,
      required this.imageUrl,
      required this.name,
      required this.description,
      required this.price,
      required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onItemClick,
      child: Padding(
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
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 3.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    height: 100,
                    width: 70,
                    child: const Center(child: Text('Oops!')),
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
                      width: 270,
                      child: Text(
                        description,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
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
      ),
    );
  }
}
