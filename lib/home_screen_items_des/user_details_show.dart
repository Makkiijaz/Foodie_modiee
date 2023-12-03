import 'package:flutter/material.dart';
import 'package:food_app/google_map_user.dart';
import 'package:food_app/login_account/login_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetails extends StatefulWidget {
  String adrress;
   UserDetails({super.key,this.adrress = 'Your Address here'});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}
class _UserDetailsState extends State<UserDetails> {

  Future<String> _sharePrefs() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString('address') ?? 'Click here to set address';
}
  @override
  void initState() {
    super.initState();
    Provider.of<LoginProvider>(context, listen: false).getUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final user = loginProvider.user;

    if (user == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         CircleAvatar(
          backgroundImage: NetworkImage(
            'https://foodie.junaidali.tk/storage/app/public/profile/${user.response?.image}',
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  user.response?.fName ?? 'Welcome',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'inter_re',
                  ),
                ),
                Text(
                  user.response?.lName ?? 'User',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'inter_re',
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                _sharePrefs().then((userAddress) {
                  _showModalBottomSheet(context, userAddress);
                });
              },
              child: SizedBox(
                width: 180,
                child: FutureBuilder<String>(
                  future: _sharePrefs(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Text(
                        snapshot.data ?? 'dhg',
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'inter_bo',
                        ),
                      );
                    } else {
                      return const Text(
                        'Loading...',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'inter_bo',
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
  void _showModalBottomSheet(BuildContext context, String userAddress) {
    showModalBottomSheet<void>(
      enableDrag: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 230,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepOrangeAccent.withOpacity(0.5)
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const UserMap(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              InkWell(
                onTap: () async {
                  SharedPreferences sharePrefs = await SharedPreferences.getInstance();
                  sharePrefs.setString('address', address);
                  Navigator.pop(context);
                  print('address$address');
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.deepOrangeAccent.withOpacity(0.5)
                ),
                child:  Text('Save Address',style: GoogleFonts.actor(fontSize: 15,color: Colors.black)),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
