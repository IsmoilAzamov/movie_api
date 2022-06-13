import 'package:flutter/material.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_api/view/screens/details_screen.dart';
import '../../constants.dart';
import '../../model/Genre.dart';

class MovieItem extends StatefulWidget {
  final Movie movie;
  final List<Genre> genres;


  const MovieItem(
    this.genres,
    this.movie, {
    Key? key,
  }) : super(key: key);

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: Colors.black54,
                  duration: const Duration(seconds: 10),
                  content: SizedBox(
                    width: 120,
                    height: MediaQuery.of(context).size.height,
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 280,
                            alignment: Alignment.center,
                            child: Image.network(
                              "${Constants.imgEndpoint}${widget.movie.backdropPath}",
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
                          ),
                          Text(
                            "${widget.movie.overview}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),

                        ],
                      ),
                    ),
                  )),
            );
          });
        }
      },
      child: Card(
        //color: Color.fromARGB(52, Random().nextInt(1) + 254, Random().nextInt(1) + 154, Random().nextInt(1) + 154),
        elevation: 1,
        shadowColor: Colors.blueGrey,
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(
                "${Constants.imgEndpoint}${widget.movie.posterPath}",
                width: 120,
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.movie.title ?? "---",
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    buildGenres(widget.genres),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(widget.movie.releaseDate ?? "___"),
                        TextButton(onPressed: (){
                          openDetailsPage( widget.movie.id!.toInt());
                        }, child: const Text("more...", style: TextStyle(color: Colors.white),)),

                      ],
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

  Widget buildGenres(List<Genre> genres) {
    List<Widget> widgets = [];

    for (var element in genres) {
      widgets.add(Text(
        "\n${element.name}",
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widgets,
    );
  }


  void openDetailsPage(num movieId){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return DetailPage(movieId);
    }));

  }
}
