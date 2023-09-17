// ignore_for_file: must_be_immutable

import 'package:fitness/models/category_models.dart';
import 'package:fitness/models/diet_models.dart';
import 'package:fitness/models/popular_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<CategoryModel> categories = [];
  List<DietModels> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void initialData() {
    diets = DietModels.getDiet();
    categories = CategoryModel.getCategories();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    initialData();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchBar(),
          SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Category',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 20),
              _categorySection(),
              SizedBox(height: 40),
              _dietSection(),
              SizedBox(height: 40),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Popular',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                popularDiets[index].iconPath,
                                width: 65,
                                height: 65,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    popularDiets[index].name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    popularDiets[index].level +
                                        " | " +
                                        popularDiets[index].duration +
                                        " | " +
                                        popularDiets[index].calorie,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                      "assets/icons/button.svg"))
                            ],
                          ),
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xff1D1617).withOpacity(0.07),
                                    offset: Offset(0, 10),
                                    blurRadius: 40,
                                    spreadRadius: 0)
                              ]),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 25,
                          ),
                      itemCount: popularDiets.length)
                ],
              ),
              SizedBox(height: 40),
            ],
          )
        ],
      ),
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation for Diet',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 240,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                      color: diets[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(diets[index].iconPath),
                      Text(
                        diets[index].name,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      Text(
                        diets[index].level +
                            " | " +
                            diets[index].duration +
                            " | " +
                            diets[index].calorie,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "View",
                            style: TextStyle(
                                color: diets[index].viewIsSelected
                                    ? Colors.white
                                    : Color(0xffc58bf2),
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        height: 45,
                        width: 130,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              diets[index].viewIsSelected
                                  ? Color(0xff9dceff)
                                  : Colors.transparent,
                              diets[index].viewIsSelected
                                  ? Color(0xff92A3FD)
                                  : Colors.transparent,
                            ]),
                            borderRadius: BorderRadius.circular(50)),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    width: 20,
                  ),
              scrollDirection: Axis.horizontal,
              itemCount: diets.length),
        )
      ],
    );
  }

  Container _categorySection() {
    return Container(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 15),
        padding: EdgeInsets.only(left: 20, right: 20),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Details(categorie:categories[index])));
            },
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: SvgPicture.asset(categories[index].iconPath),
                    ),
                  ),
                  Text(
                    categories[index].name,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container _searchBar() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0xff1d1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Search Pancake",
            hintStyle: TextStyle(
              color: Color(0xffdddada),
              fontSize: 18,
            ),
            contentPadding: EdgeInsets.only(top: 30),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset("assets/icons/Search.svg"),
            ),
            suffixIcon: Container(
              width: 80,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 0.1,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset("assets/icons/Filter.svg"),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text("Breakfast",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: EdgeInsets.all(5),
            child: SvgPicture.asset("assets/icons/Arrow - Left 2.svg",
                width: 10, height: 10),
          )),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
              width: 25,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                padding: EdgeInsets.all(5),
                child: SvgPicture.asset("assets/icons/dots.svg",
                    width: 10, height: 10),
              )),
        )
      ],
    );
  }
}

class Details extends StatelessWidget {
  final  categorie;
  const Details({required this.categorie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorie.name,style:TextStyle(color:Colors.black,)),
        
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (_)=>HomePage())
            );
        },
      ),
      // bottomNavigationBar: (),
      body: Column(
        children: [
          
          SvgPicture.asset(categorie.iconPath,height: 300,width: 300,),
          SizedBox(height: 30,),
          Center(
            child: Container(
              
              child: Text(categorie.description,style: TextStyle(
                color:Colors.black54,
                fontSize: 17,
                letterSpacing: 0.2,
                height: 1.5
              ),),
              padding: const EdgeInsets.only(left:30,right: 30),
            ),
          )

        ],
      ),
    );
  }
}
