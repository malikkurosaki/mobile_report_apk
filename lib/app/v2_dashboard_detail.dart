import 'package:flutter/material.dart';

class V2DashboardDetail extends StatefulWidget {
  const V2DashboardDetail(
      {Key? key, required this.heroTag1, required this.icon1,required this.title})
      : super(key: key);
  final String heroTag1;
  final IconData icon1;
  final String title;

  @override
  _V2DashboardDetailState createState() => _V2DashboardDetailState();
}

class _V2DashboardDetailState extends State<V2DashboardDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              Card(
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                          tag: widget.heroTag1,
                          child: Row(
                            children: [
                              CircleAvatar(child: Icon(widget.icon1)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(widget.title,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 36
                                  ),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
