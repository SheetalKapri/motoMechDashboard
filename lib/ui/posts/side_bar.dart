import 'package:flutter/material.dart';
import 'package:motomechdashboard/utils/constants.dart';

class SideBarItems extends StatelessWidget {
  const SideBarItems({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: secondaryColor,
        child: Column(
          children: const [
            Header(),

            SizedBox(height: 10,),

          ],
        ) 
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: InkWell(
        splashColor: Colors.teal.shade800,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: primaryColor,
              child: IconButton(
                  icon: const Icon(Icons.notifications),
                  color: Colors.white, //SvgPicture.asset('assets/ring.svg', width: 20.0),
                  iconSize: 18,
                  onPressed: () {}
              ),
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              radius: 18,
              backgroundColor: primaryColor,
              child: IconButton(
                icon: const Icon(Icons.message),
                iconSize: 18,
                color: Colors.white,
                onPressed: () {}
              ),
            ),
            const SizedBox(width: 10),
            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
              ),
            ),
            const SizedBox(width: 10),
            const Text("Admin",style: TextStyle(fontSize: 10),),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required TextEditingController searchController,
    required this.searchText,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;
  final String searchText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.65,
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        //type: MaterialType.card,
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 35),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(width: 2, color: primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: primaryColor),
                borderRadius: BorderRadius.circular(30.0)),
            hintText: searchText,
            hintStyle: const TextStyle(fontSize: 12),
            suffixIcon: SizedBox(
              width: 85,
              child: InkWell(
                splashColor: Colors.teal.shade800,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.filter_alt, color: primaryColorLight),
                      iconSize: 25,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.search, color: primaryColorLight),
                      iconSize: 25,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
