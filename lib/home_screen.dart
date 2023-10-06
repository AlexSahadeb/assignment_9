import 'package:assignment_9/model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [
    Product("T-shart 1", 40, "L", 0),
    Product("T-shart 2", 60, "M", 1),
    Product("T-shart 3", 50, "XL", 2),
  ];

  double calculateTotalAmount() {
    double total = 0;
    for (var product in products) {
      total += (product.price * product.quantity);
    }
    return total;
  }

  void showCongratulatorySnackbar() {
    final totalAmount = calculateTotalAmount();

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                  "Congratulations! Total amount: \$${totalAmount.toStringAsFixed(2)}"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products List"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "My Bag",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                    height: 100,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 1),
                            blurRadius: 10,
                            spreadRadius: 1)
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 30,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              child: Image.asset(
                                "assets/shart1.jpg",
                                fit: BoxFit.cover,
                              ),
                            )),
                        Expanded(
                            flex: 55,
                            child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.name.toString()),
                                  Row(
                                    children: [
                                      const Text("Color: green"),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text("Size: ${product.size.toString()}"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (product.quantity > 0) {
                                              product.quantity--;
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    offset: Offset(0, 1),
                                                    blurRadius: 4,
                                                    spreadRadius: 1)
                                              ],
                                              shape: BoxShape.circle),
                                          child: const Icon(Icons.remove),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        product.quantity.toString(),
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            product.quantity++;
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    offset: Offset(0, 1),
                                                    blurRadius: 4,
                                                    spreadRadius: 1)
                                              ],
                                              shape: BoxShape.circle),
                                          child: const Icon(Icons.add),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 15,
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: () {},
                                      child: const Icon(Icons.more_vert)),
                                  Text(
                                    "\$${product.price.toStringAsFixed(0)}",
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ));
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Column(
          children: [
            Text(
              'Total Amount: \$${calculateTotalAmount()}',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: showCongratulatorySnackbar,
              child: const Text("CHECK OUT"),
            ),
          ],
        ),
      ),
    );
  }
}
