import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 65, 105, 225),
            Color.fromARGB(255, 135, 206, 250)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
      ),
    );

    return Stack(
      children: [
        _buildBodyBack(),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Novidades"),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance.collection("home").orderBy("pos").getDocuments(),
              builder: (context, snapshot){
                if(!snapshot.hasData)
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white)
                      ),
                    ),
                  );
                  else {
                  return SliverToBoxAdapter(
                      child: Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: Container(),
                      )
                  );
                }
              },
            )
          ],
        )
      ],
    );
  }
}
