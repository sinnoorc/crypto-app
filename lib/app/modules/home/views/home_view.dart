import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/assets.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBar(
              expandedHeight: 160.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text("Discover"),
                titlePadding: EdgeInsets.only(left: 16, bottom: 16),
              ),
            ),
          ];
        },
        body: Container(
          child: controller.obx(
            (state) => ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: controller.assets.length,
              separatorBuilder: (context, index) {
                final Assets asset = controller.assets[index];
                final Color color = Colors.primaries[index % Colors.primaries.length];

                return ListTile(
                  title: Text(asset.name ?? 'N/A'),
                  subtitle: Text(asset.assetId ?? 'N/A'),
                  leading: controller.assetsImage.where((element) => element.assetId == asset.assetId).isNotEmpty
                      ? ClipOval(
                          child: Image.network(
                            controller.assetsImage.where((element) => element.assetId == asset.assetId).first.url!,
                            width: 50,
                            height: 50,
                            errorBuilder: (context, error, stackTrace) {
                              return errorImage(color, asset);
                            },
                          ),
                        )
                      : errorImage(color, asset),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '\$ ${asset.priceUsd?.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // Text(
                      //   asset.
                      //   style: TextStyle(
                      //     color: asset.changePercent24Hr!.contains('-') ? Colors.red : Colors.green,
                      //   ),
                    ],
                  ),
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
            ),
            onEmpty: const Center(child: Text("Empty")),
          ),
        ),
      ),
    );
  }

  CircleAvatar errorImage(Color color, Assets asset) {
    return CircleAvatar(
      radius: 27,
      backgroundColor: color,
      foregroundColor: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
      child: Text(
        asset.name?.substring(0, 2).toUpperCase() ?? 'N/A',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
