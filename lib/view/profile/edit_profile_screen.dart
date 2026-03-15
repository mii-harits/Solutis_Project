import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/widgets/box_decoration.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: AppColor.teal3,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.check, color: AppColor.white),
                  SizedBox(width: 3),
                  Text("Save", style: TextStyle(color: AppColor.white)),
                ],
              ),
            ),
          ),
        ],
      ),

      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.white, width: 2),
                        color: AppColor.teal,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 18,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Text("Tekan untuk mengganti Foto Profil"),

              SizedBox(height: 10),

              Container(
                padding: EdgeInsets.all(12.0),
                decoration: boxDecorationConstant(),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person_outline),
                      title: Text("Full Name"),
                      subtitle: Text("Dinda Putri Anggraini"),
                      trailing: Icon(Icons.edit),
                    ),

                    Divider(),

                    ListTile(
                      leading: Icon(Icons.email_outlined),
                      title: Text("Email"),
                      subtitle: Text("dinda.putri@gmail.com"),
                      trailing: Icon(Icons.edit),
                    ),

                    Divider(),

                    ListTile(
                      leading: Icon(Icons.phone_outlined),
                      title: Text("Phone Number"),
                      subtitle: Text("+62 812 3456 7890"),
                      trailing: Icon(Icons.edit),
                    ),

                    Divider(),

                    ListTile(
                      leading: Icon(Icons.calendar_today_outlined),
                      title: Text("Date of Birth"),
                      subtitle: Text("12 March 1998"),
                      trailing: Icon(Icons.chevron_right),
                    ),

                    Divider(),

                    ListTile(
                      leading: Icon(Icons.person_outline),
                      title: Text("Gender"),
                      subtitle: Text("Female"),
                      trailing: Icon(Icons.expand_more),
                    ),

                    Divider(),

                    ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: Text("Address"),
                      subtitle: Text("Jl. Merdeka No. 10, Jakarta"),
                      trailing: Icon(Icons.edit),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Text("Security"),

              SizedBox(height: 10),

              Container(
                padding: EdgeInsets.all(12.0),
                decoration: boxDecorationConstant(),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.lock_outline),
                      title: Text("Change Password"),
                      subtitle: Text("Update your password"),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
