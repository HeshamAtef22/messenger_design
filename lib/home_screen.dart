import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appbar desin
      appBar: AppBar(
        //titleSpacing بعد الوبدجت عن الحواف
        titleSpacing: 20,
        elevation: 0.0,
        backgroundColor: Colors.white,
        //profile image and Chats text
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage("assets/images/userimage_1.jpg"),
            ),
            SizedBox(width: 15),
            Text(
              "Chats",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        //two iconbutton in appbar
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
                child: Icon(Icons.camera_alt, size: 16, color: Colors.white)),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
                child: Icon(Icons.edit, size: 16, color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Search
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 15),
                    Text("Search"),
                  ],
                ),
              ),

              SizedBox(height: 20),

              //Story Items
              Container(
                height: 105,
                //استخدمت ليست فيو سبريتور علشان خاصية سبريتور بيلدر اللي بتعمل مسافه بين كل ايتم والتاني
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                itemCount: 10,
                ),
              ),
              SizedBox(height: 20),

              //Chat Items
              ListView.separated(
                //هوقف السكرول لاني عامل اسكرول للصفحة كلها بالفعل
                physics: NeverScrollableScrollPhysics(),
                //shrinkWrap بستخدمها لما بقفل السكرول علشان يبني الليست كلها مره واحده
                //غير كدا هو بينبي الليت علي حسب القيم اللي ظهره بس ولما بعمل اسكرول بيبدأيبني الباقي طب مانا اصلا موقف السكرول
                //يبقي العملية دي مش هتحصل يبقي ايرور
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemBuilder: (context, index) => buildChatItem(),
                itemCount: 10,
              ),


            ],
          ),
        ),
      ),
    );
  }
}


//Short cut // Custom Widget to ChatItems
Widget buildChatItem() => Row(
  children: [
    Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage:
          AssetImage("assets/images/userimage_1.jpg"),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(bottom: 3, end: 5),
          child: CircleAvatar(
            radius: 7,
            backgroundColor: Colors.red,
          ),
        ),
      ],
    ),
    SizedBox(width: 20),
    //عملت اكسباند علشان لو الاسم طويل اكبر من عرض الشاشة يبدأ ينزل تحت بشكل افقي وياخد مساحة تانيه وسطر تاني
    //وبما ان الاسم مش محتاج يظهر منه غير سطر واحد فهعمل للاسم ماكس لينس 1
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ahmed Ali", maxLines: 1,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),),
          SizedBox(height: 5),
          Row(children: [
            //هعمل اسكباند للتيكست علشان لو اطول من العرض يبدأ ياخد صف تاني وميعملش اوفرفلو
            //وهعمل ماكس لينس للتيكست يبقيسطر واحد
            Expanded(
                child: Text(
                  "Hello My name is Ahmed can i ask you something",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                radius: 5,
                backgroundColor: Colors.blue,
              ),
            ),
            Text("02:00 PM"),
          ])
        ],
      ),
    )
  ],
);

//Short cut // Custom Widget to StoryItems
Widget buildStoryItem() => Container(
  width: 60,
  child: Column(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage:
            AssetImage("assets/images/userimage_1.jpg"),
          ),
          Padding(
            padding:
            EdgeInsetsDirectional.only(bottom: 3, end: 5),
            child: CircleAvatar(
              radius: 7,
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
      SizedBox(height: 5),
      Text(
        "Hisham Atef lotfy ",
        style: TextStyle(fontSize: 13),
        //maxLines تقسيم التيكست لسطرين فين
        maxLines: 2,
        //overflow في حالة التكيست اكبر من المكان بيعمل نقط ان في كلام ناقص
        overflow: TextOverflow.ellipsis,
      ),
    ],
  ),
);
