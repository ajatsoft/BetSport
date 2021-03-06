
import 'package:betipl/controller/matchcontroller.dart';
import 'package:betipl/controller/usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Team1request extends StatelessWidget {

 final String team1player;
 final String team1uid;
 final int amount;

Team1request({this.team1player, this.amount,this.team1uid});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
           boxShadow: [
      BoxShadow(
        color: Colors.green.withOpacity(0.5),
        spreadRadius: 7,
        blurRadius: 10,
        offset: Offset(3, 5), // changes position of shadow
      ),
    ],
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 23,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:35.0, right: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Status: Requested',textAlign: TextAlign.left,style: TextStyle(fontSize: 12,color: Colors.white),),
                   
                    Text('Rs. ${amount.toString()}',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.white),),
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(team1player, style: TextStyle(fontSize: 16,color: Colors.white),),
                  Text('VS', style: TextStyle(fontSize: 18,color: Colors.white),),
                  Padding(
                    padding: const EdgeInsets.only(top:13.0,bottom: 13),
                    child: Container(
                      decoration: BoxDecoration(
                  
                    border: Border.all(color: Colors.white,),
                  
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                      child: FlatButton(
                        hoverColor: Colors.black,
                        onPressed: (){
                          if(team1player != Get.find<UserController>().user.name){
                           Get.find<UserController>().user.currentbalance >= amount ? (){
                              Get.find<MatchController>().matchingRequest(team1player, Get.find<UserController>().user.name, amount,true,team1uid,Get.find<UserController>().user.id);
                           Get.find<UserController>().updateBalannce(amount,Get.find<UserController>().user.id);
                           Get.find<UserController>().updateBalannce(amount,team1uid);
                           Get.find<UserController>().user.currentbalance  = Get.find<UserController>().user.currentbalance - amount;

                           }()
                         :
                           Get.snackbar('Sorry','You dont have enough balance to bet',snackPosition: SnackPosition.BOTTOM,colorText: Colors.white );}
                           else{
                              Get.snackbar('Dont be clever','You cant bet yourself ',snackPosition: SnackPosition.BOTTOM,colorText: Colors.white );
                           }
                        },
                        child: Text('Bet against', style: TextStyle(fontSize: 10,color: Colors.white),),
                      ),
                    ),
                  )
                ],


              ),


            ),
          ],
        ),
      ),
    );
  }
}
