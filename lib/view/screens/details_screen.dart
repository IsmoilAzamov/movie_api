import 'package:flutter/material.dart';
import 'package:movie_api/viewmodel/details_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../core/api_response.dart';
import '../../model/details.dart';



class DetailPage extends StatefulWidget {
  final num movieId;
  const DetailPage(this.movieId, {Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  void initState(){
    super.initState();
    Provider.of<DetailsViewModel>(context, listen: false).fetchDetailsById(widget.movieId.toInt(), "&page=2");

  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Consumer<DetailsViewModel>(builder: (context, data, child){
          if (data.response.status==Status.LOADING) {
            return const CircularProgressIndicator(color: Colors.white,);
          }
          if (data.response.status==Status.COMPLETED) {
            return  _initUI(data.details);

          }
          if(data.response.status==Status.INITIAL){
            return  Container();
          }
          if(data.response.status==Status.ERROR){
            return Center(child: Text("${data.response.messagae}"+"id: ${widget.movieId}"),);
          }
          return Center(child: Text("oh noo default"),);
        },),
      )
    );
  }

  Widget _initUI(Details? details) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "${Constants.imgEndpoint}${details?.backdropPath}",
            fit: BoxFit.cover,
            loadingBuilder:
                (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return const Center(
                  child: CircularProgressIndicator());
              // You can use LinearProgressIndicator or CircularProgressIndicator instead
            },
            errorBuilder: (context, error, stackTrace) =>
            const Text('Some errors occurred!'),
          ),
            SizedBox(height: 30,),
            Container(
              padding: const EdgeInsets.all(12),
                child: Text("Title: ${details?.title}", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),)),
            Container(
                padding:EdgeInsets.all(12),child: Text("Budget: ${details?.budget}", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),)),
            Container(
                padding: EdgeInsets.all(12),
                child: Text("Votes: ${details?.voteCount}", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),)),
        ],

      ),
    );
  }
  @override
  void dispose(){
    super.dispose();
    Provider.of<DetailsViewModel>(context, listen: false).clearData();
  }

  @override
  void deactivate(){
    super.deactivate();
    Provider.of<DetailsViewModel>(context, listen: false).clearData();
  }


}
