import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Order{
  final int id;
  final int sell_price;
  final String testimonials;

  Order({this.id, this.sell_price, this.testimonials});

  factory Order.fromJson(Map<String, dynamic> json){
    return Order(
      id: json['id'],
      sell_price: json['sell_price'],
      testimonials: json['testimonials']
    );
  }
}
Future<List<Order>> fetchOrder(http.Client client) async{
  final response = await client.get('http://hijrah.asia/api/api/user/12/orders');

  return compute(parseOrders, response.body);
}

List<Order> parseOrders(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Order>((json) => Order.fromJson(json)).toList();
}


class OrderListBuilder extends StatelessWidget {
  final List<Order> orders;

  OrderListBuilder({this.orders});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {

        return new Card(

            child: new Text("Id : ${orders[index].id}\n" +
                "Sell Price : ${orders[index].sell_price}\n" +
                "Testimonial : ${orders[index].testimonials}\n")
        );
      },
    );
  }
}

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Order List"),
      ),
      body: FutureBuilder<List<Order>>(
        future: fetchOrder(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? OrderListBuilder(orders : snapshot.data)
              : Center(
            child: CircularProgressIndicator(),
          );
        },

      ),

    );
  }
}

