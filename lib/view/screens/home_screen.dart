import 'package:flutter/material.dart';
import 'package:movie_api/core/api_response.dart';
import 'package:movie_api/model/Genre.dart';
import 'package:movie_api/view/widgets/movie_item.dart';
import 'package:movie_api/viewmodel/main_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();
    Provider.of<MainViewModel>(context, listen: false).fetchPopular();
    Provider.of<MainViewModel>(context, listen: false).fetchGenres();
    Provider.of<MainViewModel>(context, listen: false ).nextPage();
    Provider.of<MainViewModel>(context, listen: false ).lastPage();

  }


  @override
  Widget build(BuildContext context) {
    return  Consumer<MainViewModel>(
        builder: (context, data, child) {
          List<Genre> genres = data.genres;

          if (data.response.status == Status.LOADING) {
            return const CircularProgressIndicator();
          }
          if (data.response.status == Status.COMPLETED) {
            return Scaffold(
              appBar: AppBar(title: const Text("My Movie"),
              actions: [
                        Row(
                          children: [
                            TextButton(onPressed: (){
                              Provider.of<MainViewModel>(context, listen: false).lastPage();
                            }, child: const Text("Last", style: TextStyle(fontSize: 18, color: Colors.lightBlueAccent),)),
                            TextButton(onPressed: (){
                              Provider.of<MainViewModel>(context, listen: false).nextPage();
                            }, child: const Text("Next", style: TextStyle(fontSize: 18, color: Colors.lightBlueAccent),)),

                          ],
                        )
              ],),
              body: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int? index) {
                    List<Genre> movieGenres = [Genre(id: 01, name: " ")];

                    data.movies[index??1].genreIds?.forEach((id) {
                      movieGenres
                          .add(genres.firstWhere((genre) => genre.id == id, orElse:() => Genre(id: 0, name: "...")));
                    });

                    return MovieItem(movieGenres, data.movies[index??1]);
                  }),
            );
          }
          if (data.response.status == Status.ERROR) {
            return Text("${data.response.messagae} ERROR ");
          }
          if (data.response.status == Status.INITIAL) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
            color: Colors.blue,
            width: 200,
            height: 200,
          );
        },

    );
  }
}
