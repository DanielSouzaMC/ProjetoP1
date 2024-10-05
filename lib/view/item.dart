import 'package:flutter/material.dart';

class Itemview extends StatefulWidget{
    const Itemview({super.key});

    @override
    State<Itemview> createState()=> _Itemview();
}

class _Itemview extends State<Itemview>{
  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      
      
      body: SingleChildScrollView(
        child: Center(
                   
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Image.asset('lib/images/logopizza.jpg',
                  width: 300,
                  height: 300,
                ),
              ),
              const SizedBox(height: 30),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed:(){
                  }, 
                  child: const Text('Oi',style: TextStyle(fontSize: 20)),
                )
              ],          
            )
            ],
          ),        
        ),
      ),      
    );    
  }

}
