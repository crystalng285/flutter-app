
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
    int _selectedPage = 0;
  final _categories = [
    'Home', 'Messages', 'Camera','People','Info' ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: (){
              setState(() {
                _selectedPage = index;
              });
            },
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Text(_categories[index],
              style: TextStyle(
                color: index == _selectedPage ? Colors.teal : Colors.black45,

              ),
              ),
            ),
          );
        },
      ),
    );
  }
}
