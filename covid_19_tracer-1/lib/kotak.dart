import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Kotak extends StatefulWidget {
  final String title, subtitle;
  final String? phonenum;
  final IconData? icon;
  const Kotak(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.icon,
      this.phonenum})
      : super(key: key);

  @override
  _KotakState createState() => _KotakState();
}

class _KotakState extends State<Kotak> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widget.icon != null
                ? Icon(
                    widget.icon,
                    color: const Color.fromARGB(255, 90, 90, 90),
                  )
                : Container(),
            const SizedBox(
              width: 10,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 90, 90, 90),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 90, 90, 90),
                ),
              ),
              widget.phonenum != null
                  ? Text('${widget.phonenum}',
                      style: const TextStyle(
                          fontSize: 14, color: Color.fromARGB(255, 90, 90, 90)))
                  : Container(),
            ]),
          ],
        ),
      ),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 199, 213, 247),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(30, 0, 0, 0),
                blurRadius: 12.0,
                spreadRadius: 0,
                offset: Offset(0, 6))
          ]),
    );
  }
}

class KotakHati extends StatefulWidget {
  final String title, subtitle, qrcode;
  final String? phonenum;
  final IconData? icon;
  const KotakHati(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.icon,
      this.phonenum,
      required this.qrcode})
      : super(key: key);

  @override
  _KotakHatiState createState() => _KotakHatiState();
}

class _KotakHatiState extends State<KotakHati> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 90, 90, 90),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 200,
                child: Text(
                  widget.subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 90, 90, 90),
                  ),
                ),
              ),
              widget.phonenum != null
                  ? Text('${widget.phonenum}',
                      style: const TextStyle(
                          fontSize: 14, color: Color.fromARGB(255, 90, 90, 90)))
                  : Container()
            ],
          ),
          // const SizedBox(
          //   width: 10,
          // ),
          SvgPicture.network(
            widget.qrcode,
            width: 60,
            height: 90,
          )
        ]),
      ),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 251, 217, 229),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(30, 0, 0, 0),
                blurRadius: 12.0,
                spreadRadius: 0,
                offset: Offset(0, 6))
          ]),
    );
  }
}

class KotakHati1 extends StatefulWidget {
  final String name, ic, batch, location, manufacterer;
  final String qrcode;

  const KotakHati1(
      {Key? key,
      required this.name,
      required this.ic,
      required this.location,
      required this.batch,
      required this.manufacterer,
      required this.qrcode})
      : super(key: key);

  @override
  _KotakHati1State createState() => _KotakHati1State();
}

class _KotakHati1State extends State<KotakHati1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 90, 90, 90),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.ic,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 90, 90, 90),
                  ),
                ),
                Text(widget.manufacterer,
                    style: const TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 90, 90, 90))),
                Text(widget.batch,
                    style: const TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 90, 90, 90))),
                Text(widget.location,
                    style: const TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 90, 90, 90))),
              ],
            ),
            SvgPicture.network(
              widget.qrcode,
              width: 60,
              height: 90,
            ),
          ]),
        ),
      ),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 251, 217, 229),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(30, 0, 0, 0),
                blurRadius: 12.0,
                spreadRadius: 0,
                offset: Offset(0, 6))
          ]),
    );
  }
}
