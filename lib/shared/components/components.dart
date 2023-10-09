import 'package:flutter/material.dart';
import 'package:news/modules/web_view/web_view_screen.dart';
import '../cubit/app_cubit.dart';

Widget buildNewsItem(article, context) => InkWell(
 // onTap: (){
 //   navigateTo(context, WebViewScreen(article["url"]));
 // },
  child:   Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: NetworkImage(
                    '${article["urlToImage"]}',
                // https://th.bing.com/th/id/OIP.y-ef6q6C1H3JoT-Vq72KwwHaFj?pid=ImgDet&rs=1
                    ),
                fit: BoxFit.cover),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: SizedBox(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    article["title"],
                    style: AppCubit.get(context).appTheme
                        ? Theme.of(context).textTheme.bodySmall
                        : Theme.of(context).textTheme.bodyMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    article["publishedAt"],
                    style: const TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  ),
);

Widget newsBuilder(list, context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildNewsItem(list
        //"urlToImage
        , context),
    separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.grey[200],
            height: 2,
            width: double.infinity,
          ),
        ),
    itemCount: list.length);

 navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
