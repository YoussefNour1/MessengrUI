import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 3/4,
        ),
        children: [
          buildContainer(text: "The Flash", url: "https://r1.ilikewallpaper.net/iphone-12-pro-pro-max-wallpapers/download-109868/Flash-Season-6-4k-Sony-Xperia-X-XZ-Z5-Premium-HD-4.jpg"),
          buildContainer(text: "Spider Man", url: "https://cdn.wallpapersafari.com/82/38/2sQUoz.jpg"),
          buildContainer(text: "Iron Man" ,url: "https://i.pinimg.com/originals/d7/bd/93/d7bd934adc5e5a50da570cb1bc98e946.jpg"),
          buildContainer(text: "Bat Man",url:"https://cutewallpaper.org/21/cool-batman-wallpaper/Cool-Batman-Wallpaper-Iphonefree-Quality-Wallpaper-Batman-.jpg" ),
          buildContainer(text: "Captain America",url: "https://i.pinimg.com/originals/9f/af/bf/9fafbf1c72e379c45f5aee0771441c6b.jpg"),
          buildContainer(text: "Super Man",url: "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fjvchamary%2Ffiles%2F2016%2F03%2Fman_of_steel-1200x800.jpg"),
          buildContainer(text: "Ant Man",url: "https://progameguides.com/wp-content/uploads/2021/03/fortnite-outfit-Ant-Man.jpg"),
          buildContainer(text: "Dr Strange",url: "https://cdn.wallpapersafari.com/58/68/MUq3cj.jpg"),
          buildContainer(text: "Black Panther",url: "https://etbilarabi.com/sites/default/files/styles/article_landing/public/2021-07/Untitled_1.jpg?itok=J6-yArbk"),
          buildContainer(text: "Thor",url: "https://mediaproxy.salon.com/width/1200/https://media.salon.com/2019/07/thor-ragnarok2.jpg"),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pop(context);
      },
        child: Icon(Icons.arrow_back_outlined),
      ),
    );
  }

  Container buildContainer({String text, String url}) {
    return Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(bottom: 20),
          child: Container(child: Text(text, style: TextStyle(fontSize: 25, color: Colors.white),),color: Colors.black.withOpacity(0.7),padding: EdgeInsets.fromLTRB(15, 5, 5, 5),),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.red,
            image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(url))
          ),
        );
  }
}
