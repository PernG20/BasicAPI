import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ความรู้เกี่ยวกับคอมพิวเตอร์"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: FutureBuilder(
            builder: (context, snapshot) {
              var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return MyBox(data[index]['title'], data[index]['subtitle'], data[index]['image_url'], data[index]['detail']);
                  },
                itemCount: data.length,
                  );
            },
            future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
          ),
        ));
  }

  Widget MyBox(var title, var subtitle, var image_url ,var detail) {
// var _v1 = title;
// var _v2 = subtitle;
// var _v3 = image_url;
// var _v4 = detail;
    return Container(
      padding: EdgeInsets.all(20),
       margin: EdgeInsets.all(10),
      height: 160,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        image: DecorationImage(
            image: NetworkImage(image_url),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25), BlendMode.darken)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
              onPressed: () {
                print("Next pages");
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => DetailPage(title,subtitle,image_url,detail))));
              },
              child: Text("ອ່ານຕໍ່"))
        ],
      ),
    );
  }


}


//   Widget MyBox({var title, var subtitle, var image_url}) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       // margin: EdgeInsets.all(100),
//       height: 160,
//       decoration: BoxDecoration(
//         color: Colors.blue[100],
//         image: DecorationImage(
//             image: NetworkImage(image_url),
//             fit: BoxFit.cover,
//             colorFilter: ColorFilter.mode(
//                 Colors.black.withOpacity(0.25), BlendMode.darken)),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//                 fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             subtitle,
//             style: TextStyle(fontSize: 15, color: Colors.white),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           TextButton(
//               onPressed: () {
//                 print("Next pages");
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: ((context) => DetailPage())));
//               },
//               child: Text("ອ່ານຕໍ່"))
//         ],
//       ),
//     );
//   }
// }
