import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(     
        
          borderRadius: BorderRadius.circular(10),
          child: TextField(
            decoration: InputDecoration(
              fillColor: Color.fromARGB(255, 134, 236, 134)   ,        filled: true,
              hintText: 'Search Places',
              border: OutlineInputBorder(
                borderSide: BorderSide.none
              ),
              prefixIcon: Icon(CupertinoIcons.search),
              ),
            ),
         
      ),
    );
  }
}

