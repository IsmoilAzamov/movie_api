import 'package:flutter/material.dart';
import 'package:movie_api/core/api_response.dart';
import 'package:movie_api/viewmodel/main_view_model.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  initState(){
    super.initState();
    Provider.of<MainViewModel>(context, listen: false).fetPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyMovies"),

      ),
      body: Consumer<MainViewModel>(builder: (context, data, child){
        debugPrint("${data.response}");
      if(data.response.status== Status.LOADING){
        return const CircularProgressIndicator();
      }
      if(data.response.status==Status.COMPLETED){
        return ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index){
          return Row(
            children: [
              Text(data.movies[index].title),

            ],
          );
        });
      }
      if (data.response.status==Status.ERROR) {
        return Text("${data.response.messagae} 777 ");

      }
      if(data.response.status==Status.INITIAL){
        return const Text("INITIAL");

      }
      return Container(color: Colors.blue, width: 200, height: 200,);
      },),
    );
  }

}


