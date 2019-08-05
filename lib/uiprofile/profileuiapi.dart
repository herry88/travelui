import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Order{
  final int id;
  final String name;
  final String email;

  Order({this.id, this.name, this.email});

  factory Order.fromJson(Map<String, dynamic> json){
    return Order(
        id: json['id'],
        name: json['name'],
        email: json['email']
    );
  }
}
Future<List<Order>> fetchOrder(http.Client client) async{
  final response = await client.get('http://hijrah.asia/api/api/user/12');

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
                "name : ${orders[index].name}\n" +
                "Email : ${orders[index].email}\n")
        );
      },
    );
  }
}

class ProfileListUi extends StatefulWidget {
  @override
  _ProfileListUiState createState() => _ProfileListUiState();
}

class _ProfileListUiState extends State<ProfileListUi> {
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

