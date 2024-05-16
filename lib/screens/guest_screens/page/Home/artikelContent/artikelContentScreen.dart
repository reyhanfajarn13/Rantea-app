import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

import 'package:url_launcher/link.dart';

import 'artikelSkeletonCardLoading.dart';

class artikelContentScreen extends StatefulWidget {
  const artikelContentScreen({super.key});

  @override
  State<artikelContentScreen> createState() => _artikelContentScreenState();
}

class _artikelContentScreenState extends State<artikelContentScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<dynamic>> fetchBlogData() async {
    final response =
        await http.get(Uri.parse('https://rantea.vercel.app/api/blog'));

    if (response.statusCode == 200) {
      return json.decode(response.body); // Kembalikan data sebagai list
    } else {
      throw Exception('Failed to load blog data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
              child: Text(
                "Artikel Berita",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 0.17,
                ),
              ),
            ),
            Spacer(),
            Container(
              child: Text(
                '------------------------------------------------------',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        FutureBuilder(
            future: fetchBlogData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3, // Jumlah skeleton yang ingin ditampilkan
                  itemBuilder: (context, index) {
                    return artikelSkeletonCardLoading(); // Gunakan skeleton card sebagai placeholder
                  },
                );
              } else if (snapshot.hasError) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3, // Jumlah skeleton yang ingin ditampilkan
                  itemBuilder: (context, index) {
                    return artikelSkeletonCardLoading(); // Gunakan skeleton card sebagai placeholder
                  },
                );
              } else {
                var data = snapshot.data;
                data!.sort((a, b) => b['id'].compareTo(a['id']));
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: min(3, data!.length),
                  itemBuilder: (context, index) {
                    var blog = data[index];
                    return Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Link(
                          target: LinkTarget.self,
                          uri: Uri.parse(blog['link']),
                          builder: (context, followlink) {
                            return GestureDetector(
                              onTap: followlink,
                              child: Card(
                                color: Colors.white,
                                shadowColor: Colors.black,
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Spacer(),
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          Container(
                                            height: 100,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image.network(
                                                blog['imageUrl'],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListTile(
                                              title: Text(
                                                blog['title'],
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87,
                                                ),
                                                maxLines:
                                                    2, // Batasi hingga 2 baris
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    blog['desc'],
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black87,
                                                    ),
                                                    maxLines:
                                                        5, // Batasi hingga 2 baris
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  },
                );
              }
            }),
      ],
    );
  }
}
