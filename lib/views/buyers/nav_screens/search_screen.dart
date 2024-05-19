import 'package:flutter/material.dart';
import 'package:master_travel/views/buyers/nav_screens/widgets/search_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  static List<SearchModel> main_search_list=[
   SearchModel("Sigiriya",
   "Dambulla in the Central Province",),
      //"assets/images/sigiriya.jpg"),

    SearchModel("Yala National Park",
    "south east ",),
      //"assets/images/y.jpg"),

    SearchModel("Dalada Maligawa",
   "Kandy",),
     //"assets/images/maligawa.jpg"),
     
    SearchModel("Pathirakali Amman Temple",
     "Trincomalee",), 
    //"assets/images/kovil.jpg"),
    SearchModel("Flower Garden",
     "Nuwara Eliya",),
    //  "https://www.attractionsinsrilanka.com/wp-content/uploads/2019/09/Hakgala-botanical-gardens.jpg"),
  ];

List<SearchModel> display_list = List.from(main_search_list);


void updateList(String value){
 setState(() {
   display_list =main_search_list
   .where((element) => 
   element.place_title!.toLowerCase().contains(value.toLowerCase()))
   .toList();
 });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 191, 168),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 179, 123),
        elevation: 0.0,
      ),
      body: Padding(
        padding:EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/b-search.jpg",),
        fit: BoxFit.cover,
        opacity: 0.8,
        
        ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search Your Places",
                style: TextStyle(
                  color: Color.fromARGB(255, 53, 52, 52),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  onChanged: (value) => updateList(value),
                  style: TextStyle(color: const Color.fromARGB(255, 13, 13, 13)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 244, 195, 142),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Sigiriya",
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.brown,
                  ),
                ),
                SizedBox(height: 20.0,),
                Expanded(
                  child: ListView.builder(
                    itemCount: display_list.length,
                    itemBuilder: (context,index) => ListTile(
                      contentPadding: EdgeInsets.all(8.0),
                        title: Text(
                          display_list[index].place_title!,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        subtitle: Text(
                         display_list[index].location!,
                         style: TextStyle(
                          color: Colors.white,
                         ),
                        ),
                      //  leading: Image.network(display_list[index].place_poster_url!),
                    ))
                ),
            ],
          ),
        ),
        ),
    );
  }
}