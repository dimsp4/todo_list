import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String hasil = "";
  String listHasil = "This is List!";
  List<ListTodo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(39, 0, 130, 100),
            Color.fromRGBO(250, 88, 182, 100),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello Dims,",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Nice to meet you!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.checklist,
                        size: 30,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(39, 0, 130, 100),
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(39, 0, 130, 100),
                                    width: 2),
                              ),
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Type here..",
                              hintStyle: TextStyle(fontSize: 15)),
                          cursorColor: Color.fromRGBO(39, 0, 130, 100),
                          onChanged: (value) {
                            hasil = value;
                          },
                          onSubmitted: (value) {
                            hasil = value;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(39, 0, 130, 100),
                              Color.fromRGBO(122, 11, 192, 100),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 15,
                              ),
                            ),
                            shadowColor: MaterialStateProperty.all(
                              Colors.transparent,
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Colors.transparent,
                            ),
                          ),
                          onPressed: () {
                            todoList.add(ListTodo(hasil: hasil));
                            setState(() {});
                          },
                          child: Text("Add To Do"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "List Of TodoList",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTodo(hasil: "This is List!"),
                  Column(
                    children: todoList,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            todoList.clear();
                            setState(() {});
                          },
                          child: Text(
                            "Remove All",
                            style: TextStyle(
                                color: Color.fromRGBO(122, 11, 192, 100)),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListTodo extends StatelessWidget {
  const ListTodo({
    Key? key,
    required this.hasil,
  }) : super(key: key);

  final String hasil;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  hasil.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Color.fromRGBO(39, 0, 130, 100),
          ),
        ],
      ),
    );
  }
}
