import 'package:flutter/material.dart';
import 'package:myshop/canteen/domain/model/canteen.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.size,
    required this.Product,
  }) : super(key: key);
  final ProductElement Product;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              top: 20,
              left: 25,
              right: 25,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.03),
                    spreadRadius: 10,
                    blurRadius: 3,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 20, left: 20),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: (size.width - 90) * 0.7,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Product.locationName,
                              style: const TextStyle(
                                  fontSize: 15,
                                  // color: black,
                                  fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              // Product.catName,
                              "Products",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w400),
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () async {
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child:
                          const Center(child: Icon(Icons.location_on_outlined)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
