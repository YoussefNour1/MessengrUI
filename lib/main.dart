import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:trainning/screen2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Messenger UI",
      color: Colors.white,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NetworkImage _networkImage = NetworkImage("https://cdn.freebiesupply.com/logos/large/2x/real-madrid-c-f-logo-png-transparent.png");

  File _image;
  final ImagePicker picker = ImagePicker();
  // async function to get the image
  Future getImage(ImageSource source) async {
    final pickedImage = await picker.pickImage(source: source);

    setState(() {
      if(pickedImage != null){
        _image = File(pickedImage.path);
      }
    });
  }

  // function that shows an alert dialog to choose a photo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 60,
        leading: IconButton(
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage:_image==null? NetworkImage(
                "https://cdn.freebiesupply.com/logos/large/2x/real-madrid-c-f-logo-png-transparent.png"): FileImage(_image),
            radius: 25,
          ),
          onPressed: () {
            var alert = AlertDialog(
              elevation: 0,
              backgroundColor: Colors.white.withOpacity(0),
              content: Image(image: _image==null? _networkImage: FileImage(_image),
                fit: BoxFit.cover,
              ),
            );
            showDialog(context: context, builder: (_){return alert;});
          },
        ),
        titleSpacing: -3,
        title: Text(
          "Chats",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[200],
            child: IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                  size: 22,
                ),
                onPressed: () {
                  var alert = AlertDialog(
                    title: Text("Chose a method"),
                    content: Container(
                      height: 115,
                      child: Column(
                        children: [
                          ListTile(leading: Icon(Icons.camera),title: Text("Camera"),onTap: (){getImage(ImageSource.camera); Navigator.pop(context);},hoverColor: Colors.grey[200],),
                          // Divider(height: 10,color: Colors.white,),
                          ListTile(leading: Icon(Icons.photo),title: Text("Gallery"),onTap: (){getImage(ImageSource.gallery);Navigator.pop(context);},hoverColor: Colors.grey[200],)
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancel", style: TextStyle(fontSize: 18),))
                    ],
                  );
                  showDialog(context: context, builder: (_){return alert;});
                }),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[200],
              child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 22,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> Screen2()));
                  })),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                      style: TextStyle(fontSize: 18),
                      autofocus: false,
                      decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          fillColor: Colors.grey[100],
                          contentPadding: EdgeInsets.all(1),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          margin: EdgeInsets.only(top: 15, left: 15),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                child: Icon(Icons.video_call, color: Colors.black,size: 30,),
                                backgroundColor: Colors.grey[200],
                              ),
                              Text(
                                "Create a room",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                        buildContainer(
                            name: "Ashraf Abd El Meged",
                            strURL:
                                "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                        buildContainer(
                            name: "Mohamed Saaed",
                            strURL:
                                "https://images.unsplash.com/photo-1480455624313-e29b44bbfde1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bWFuJTIwdHJlZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80"),
                        buildContainer(
                            name: "Yassen Ayman Yassen",
                            strURL:
                                "https://images.unsplash.com/photo-1581803118522-7b72a50f7e9f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80"),
                        buildContainer(
                            name: "Robert Downey Jr",
                            strURL:
                                "https://media1.popsugar-assets.com/files/thumbor/HwtAUAufmAZv-FgGEIMJS2eQM-A/0x1:2771x2772/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2020/03/30/878/n/1922398/eb11f12e5e825104ca01c1.02079643_/i/Robert-Downey-Jr.jpg"),
                        buildContainer(
                            name: "Kareem Benzema",
                            strURL:
                                "https://pbs.twimg.com/profile_images/1401562839614210052/yo9BeNMD.jpg"),
                        buildContainer(
                            name: "Esraa Mostafa",
                            strURL:
                                "https://media.istockphoto.com/photos/beautiful-muslim-woman-wearing-hijab-picture-id1070928392?k=20&m=1070928392&s=612x612&w=0&h=666WFzdK6X4NGg7u905C_CTvotxcDhJ0I9J3w3e2FRI="),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildChats(
                      name: "Kareem Benzema",
                      msgText: "what's up bro",
                      msgDate: "1:37 pm",
                      profileImage:
                          "https://pbs.twimg.com/profile_images/1401562839614210052/yo9BeNMD.jpg"),
                  buildChats(
                      name: "Yasmine Fouad",
                      msgText: "https://t4.ftcdn.net/jpg/02/84/66/33/360_F_284663321_jg59T2ccVwovZsEsLeGQ5W6T7MIongqN.jpg ده لينك فيديو الشرح ",
                      msgDate: "2:24 pm",
                      profileImage:
                          "https://t4.ftcdn.net/jpg/02/84/66/33/360_F_284663321_jg59T2ccVwovZsEsLeGQ5W6T7MIongqN.jpg"),
                  buildChats(
                      name: "Esraa Mostafa",
                      msgText: "متنساش تيجي بقا العيلة كلها موجودة يوم الجمعة",
                      msgDate: "11:37 pm",
                      profileImage:
                      "https://media.istockphoto.com/photos/beautiful-muslim-woman-wearing-hijab-picture-id1070928392?k=20&m=1070928392&s=612x612&w=0&h=666WFzdK6X4NGg7u905C_CTvotxcDhJ0I9J3w3e2FRI="),
                  buildChats(
                      name: "Nour Omara",
                      msgText: "ايه يا حج عامل ايه",
                      msgDate: "5:10 pm",
                      profileImage:
                          "https://media.istockphoto.com/photos/mature-handsome-business-man-picture-id1040308104?k=20&m=1040308104&s=612x612&w=0&h=zZOpj7CCxprdPAMkeGJP7RW76_7TpfKA2BZSOm8hZvY="),
                  buildChats(
                      name: "Robert Downey Jr",
                      msgText: "DO you wanna take a coffee with me?",
                      msgDate: "7:05 pm",
                      profileImage:
                      "https://media1.popsugar-assets.com/files/thumbor/HwtAUAufmAZv-FgGEIMJS2eQM-A/0x1:2771x2772/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2020/03/30/878/n/1922398/eb11f12e5e825104ca01c1.02079643_/i/Robert-Downey-Jr.jpg"),
                  buildChats(
                      name: "Opa Nset Esmy",
                      msgText: "you shared a photo",
                      msgDate: "5:40 pm",
                      profileImage:
                          "https://modo3.com/thumbs/fit630x300/18096/1517907002/%D9%85%D8%A7%D8%B0%D8%A7_%D8%AA%D8%B9%D9%86%D9%8A_%D8%A7%D9%84%D9%88%D8%B1%D8%AF%D8%A9_%D8%A7%D9%84%D8%AD%D9%85%D8%B1%D8%A7%D8%A1.jpg"),
                  buildChats(
                      name: "سيد عبد الحفيظ",
                      msgText: "هنمضي عقد امبابي يوم الجمعة",
                      msgDate: "7:12 pm",
                      profileImage:
                          "https://mediaaws.almasryalyoum.com/news/large/2020/11/01/1354151_0.jpg"),
                  buildChats(
                      name: "Fawzy Abbas",
                      msgText: "روحت لمحسن النهاردة؟",
                      msgDate: "12:55 am",
                      profileImage:
                          "https://www.gannett-cdn.com/presto/2021/08/12/PPOH/1a719636-4c04-42b5-90c3-95eacd440030-Tyler_Bunch.jpg?width=660&height=687&fit=crop&format=pjpg&auto=webp"),
                  buildChats(
                      name: "Mohsen Mohammed",
                      msgText: "متقولش بقا لفوزي انك كنت عندي",
                      msgDate: "1:05 am",
                      profileImage:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDQ_edM_L3jDtXpsujF9bLksoxiNlC73kpNA&usqp=CAU"),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Container buildContainer({String strURL, String name}) {
    return Container(
      width: 60,
      margin: EdgeInsets.only(top: 15, left: 15),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(strURL),
                backgroundColor: Colors.grey,
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.green,
              )
            ],
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Container buildChats(
      {String name, String msgText, String msgDate, String profileImage}) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      margin: EdgeInsets.all(10),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 30,
            backgroundImage: NetworkImage(profileImage),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 140,
                    child: Text(
                      msgText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
                    color: Colors.black45,
                    height: 3,
                    width: 3,
                    margin: EdgeInsets.all(5),
                  ),
                  Text(
                    msgDate,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
