import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:live_news/presentation/widgets/edit_profile.dart';
import 'package:live_news/presentation/widgets/logout_dialog.dart';
import '../widgets/profile_list.dart';
import '../widgets/task_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // profile name and icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        taskButton(iconName: FontAwesomeIcons.arrowLeft, context: context),
                        Text(
                          'Profile',
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade200),
                        ),
                        Icon(
                          Icons.menu_sharp,
                          color: Colors.grey.shade200,
                          size: 25,
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    // Profile picture and name, email
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profilepicLN.jpeg'),
                          radius: 27,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Prateek Bhaisare',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.grey.shade200),
                              ),
                              Text(
                                'bhaisareprateek65@gmail.com',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade400),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(30)),
                          child: IconButton(
                              onPressed: () => showEditProfileWidget(context),
                              icon: Icon(Icons.edit,
                                  color: Colors.grey.shade400)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Text(
                      'SETTINGS',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade200),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    settingsList(
                        circleAvatarBgColor: const Color(0xff37f927),
                        circleAvatarIcon: FontAwesomeIcons.moneyCheckDollar,
                        listText: 'Payments',
                        trailing: Icons.keyboard_arrow_right_outlined,
                    context: context),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.013,
                    ),
                    settingsList(
                        circleAvatarBgColor: const Color(0xff38a1b4),
                        circleAvatarIcon: FontAwesomeIcons.peopleArrows,
                        listText: 'Referrals',
                        trailing: Icons.keyboard_arrow_right_outlined,
                    context: context),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.013,
                    ),
                    settingsList(
                        circleAvatarBgColor: const Color(0xff2a54a0),
                        circleAvatarIcon: Icons.notifications_none,
                        listText: 'Notifications',
                        trailing: Icons.keyboard_arrow_right_outlined,
                    context: context),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.013,
                    ),
                    settingsList(
                        circleAvatarBgColor: const Color(0xfff386a2),
                        circleAvatarIcon: Icons.sunny,
                        listText: 'Theme Mode',
                        trailing: Icons.keyboard_arrow_right_outlined,
                    context: context),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.013,
                    ),
                    settingsList(
                        circleAvatarBgColor: const Color(0xfff19efc),
                        circleAvatarIcon: Icons.currency_rupee,
                        listText: 'Support',
                        trailing: Icons.keyboard_arrow_right_outlined,
                    context: context),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.013,
                    ),
                    InkWell(
                      child: settingsList(
                          circleAvatarBgColor: const Color(0xfff70e0e),
                          circleAvatarIcon: FontAwesomeIcons.trashCan,
                          listText: 'Delete Account',
                          trailing: Icons.keyboard_arrow_right_outlined, context: context),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return logoutDialog(
                                isDelete: true, context: context,
                              );
                            });
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.013,
                    ),
                    InkWell(
                      child: settingsList(
                        circleAvatarBgColor: const Color(0xff641aa2),
                        circleAvatarIcon:
                            FontAwesomeIcons.arrowRightFromBracket,
                        listText: 'Logout', context: context,
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return logoutDialog(context: context);
                            });
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.013,
                    ),
                  ],
                ),
              ),
            ),
          ], // void getData() async{
          //   var sharedPrefr = await SharedPreferences.getInstance();
          //
          // }
        ),
      ),
    );
  }
}
