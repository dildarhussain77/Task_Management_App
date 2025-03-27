import 'package:flutter/material.dart';
import 'package:task_management_app/screens/login_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Dildar Hussain"), // Your Name
            accountEmail: Text("dildarhussain876543@gmail.com"), // Your Email (Optional)
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/mypic.jpg"), // Your Image
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent, // Change background color
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
               _showLogoutDialog(context);
            },
          ),          
        ],
      ),
    );
  }

  // Function to show the confirmation dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Logout"),
          content: Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

}
