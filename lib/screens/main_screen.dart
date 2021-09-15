import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future _qrScanner() async {
    var cameraStatus = await Permission.camera.status;
    if (cameraStatus.isGranted) {
      String? qrdata = await scanner.scan();
      String newString = qrdata.toString();
      print(qrdata);
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("QR Scan Successful", style: GoogleFonts.nunito()),
                Icon(Icons.check_circle_outline, color: Color(0xff141C98))
              ],
            ),
            content: Text("QR Data: " + newString, style: GoogleFonts.nunito()),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Color(0xff141C98)),
                ),
                height: 50,
                child: Text(
                  "Scan Again",
                  style: GoogleFonts.nunito(
                    color: Color(0xff141C98),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          );
        },
      );
    } else {
      var isGrant = await Permission.camera.request();
      if (isGrant.isGranted) {
        String? qrdata = await scanner.scan();
        String newString = qrdata.toString();
        print(qrdata);
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("QR Scan Successful", style: GoogleFonts.nunito()),
                  Icon(Icons.check_circle_outline, color: Color(0xff141C98))
                ],
              ),
              content: Text("QR Data: " + newString, style: GoogleFonts.nunito()),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Color(0xff141C98)),
                  ),
                  height: 50,
                  child: Text(
                    "Scan Again",
                    style: GoogleFonts.nunito(
                      color: Color(0xff141C98),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141C98),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("QR Code Scanner",
            style:
                GoogleFonts.nunito(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageIcon(
              AssetImage("assets/smallqr.png"),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(),
                  ),
                  Image.asset("assets/bigqr.png", width: 200),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: MaterialButton(
                      onPressed: () {
                        _qrScanner();
                      },
                      elevation: 0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Color(0xff141C98)),
                      ),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/camera_icon.png", width: 30),
                          SizedBox(width: 5),
                          Text(
                            "Scan QR Code",
                            style: GoogleFonts.nunito(
                              color: Color(0xff141C98),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
