import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/profile/profile_cubit.dart';

class Together extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home:BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state is ProfileLoaded
       ?Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Together"),
          elevation: 0,
          ),
          
        backgroundColor: Color.fromARGB(255, 255, 255, 255),

       
        body: 
    
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        backgroundImage: NetworkImage(state.myuser.imgurl!),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 40),
                                        child:      Text(
            state.myuser.firstname!,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
                                      )
           

            ],
          ),
        
          SizedBox(height: 20),
          _buildTextField('Location', Icons.search),
          SizedBox(height: 16),
          _buildTextField('July 08 - July 15', Icons.calendar_today),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '2 Guests',
                style: TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  _buildGuestButton(Icons.remove),
                  _buildGuestButton(Icons.add),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: Text('Search'),
            style: ElevatedButton.styleFrom(
             // primary: Color(0xFF00BFAE), // Custom teal color
              padding: EdgeInsets.symmetric(vertical: 16),
              textStyle: TextStyle(fontSize: 16, color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: Text("No article for the Moment"),
          )
        ],
      ),
    ),
      )
      :Scaffold(
        body:  Center(
        child:Text("Create account") ,
      ),
      );
    

        }
      )
    );

  }



     
  }

 Widget _buildGuestButton(IconData icon) {
    return IconButton(
      icon: Icon(icon, color: Colors.blue), // Custom color
      onPressed: () {},
    );
  }

  Widget _buildTextField(String label, IconData icon) {
    return TextField(
      
      decoration: InputDecoration(
        
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.black),
         fillColor: Colors.white, // Set the background color to white
    filled: true,
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color(0xFF00BFAE)), // Custom color
        ),
      ),
    );
  }