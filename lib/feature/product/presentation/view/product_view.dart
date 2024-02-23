import 'package:flutter/material.dart';
import 'package:myshop/canteen/bloc/canteen_bloc.dart';
/*
 * Shows the Product details with their co-ordinates
 */
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CanteenBloc>(context).add(GetProducts());
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 25, left: 25, right: 25, bottom: 10),
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
                    top: 20, bottom: 25, right: 20, left: 20),
                child: Column(
                  children: [
                    const PopBack(),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                              color: primary,
                              width: 70,
                              height: 70,
                              child: const Icon(
                                Icons.food_bank,
                                size: 32,
                                color: kBluePrimaryColor,
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: (size.width - 40) * 0.6,
                          child: Column(
                            children: const [
                              Text(
                                kFoodCourt,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: kBluePrimaryColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: const [
                          Text("Product Details",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: kBluePrimaryColor,
                              )),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            BlocBuilder<CanteenBloc, CanteenState>(
              builder: (context, state) {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.Products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductWidget(
                        size: size,
                        Product: state.Products[index],
                      );
                    });
              },
            ),
          ],
        ),
      )),
    );
  }
}
