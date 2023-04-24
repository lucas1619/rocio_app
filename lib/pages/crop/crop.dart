import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/components/app_bar/crop_app_bar.dart';
import 'package:rocio_app/components/crop/crop_detail.dart';
import 'package:rocio_app/store/crop.dart';
import 'package:rocio_app/utils/images_crop.dart';

class CropPage extends StatefulWidget {
  const CropPage({Key? key}) : super(key: key);

  @override
  _CropPageState createState() => _CropPageState();
}

class _CropPageState extends State<CropPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    final cropStoreOff = Provider.of<CropStore>(context, listen: false);
    return Scaffold(
      appBar: CropAppBar(
        title: cropStoreOff.selectedCrops.name,
        backgroundImage: images[cropStoreOff.selectedCrops.cropType]!,
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'Detalle',
              ),
              Tab(
                text: 'Dispositivos',
              ),
              Tab(
                text: 'Historial',
              ),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                CropDetails(),
                Center(child: Text('Dispositivos')),
                Center(child: Text('Historial')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
