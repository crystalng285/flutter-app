import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  TextEditingController _searchController = TextEditingController();

//  _clearSearch() {
//    WidgetsBinding.instance
//        .addPostFrameCallback((_) => _searchController.clear());
//    setState(() {
//      _users = null;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        onSubmitted: (input){
          print(input);
        },
          controller: _searchController,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              border: InputBorder.none, filled: true,
              hintText: 'Search',
              prefixIcon: Icon( //Icon nam ben trong testfield ben trai
                Icons.search,
                size: 30.0,
              ),
            suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: (){},
            )
          )
      ),
    );
  }
}
