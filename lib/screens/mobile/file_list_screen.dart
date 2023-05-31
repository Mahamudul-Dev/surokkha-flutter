import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:surokkha/controllers/file_list_controller.dart';
import 'package:surokkha/modals/get_data_modal.dart';
import 'package:surokkha/services/global_service/global_service.dart';
import 'package:surokkha/utils/apis.dart';
import 'package:surokkha/widgets/global/details_card.dart';

class FileListScreen extends StatelessWidget {
  FileListScreen({super.key});
  final FileListController controller = Get.put(FileListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(() => AnimSearchBar(
              color: Colors.white,
              width: MediaQuery.of(context).size.width / 1.2,
              textController: controller.searchBarController.value,
              onSuffixTap: () {
                controller.searchBarController.value.clear();
                controller.filteredList.clear();
              },
              suffixIcon: const Icon(
                Icons.close,
                color: Colors.blue,
              ),
              searchIconColor: Colors.blue,
              onSubmitted: (query) {
                controller.queryList(query);
              })),
          const SizedBox(width: 30)
        ],
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.blue, size: 50),
              )
            : Obx(() {
                return controller.filteredList.isNotEmpty
                    ? ListView.separated(
                        itemBuilder: (context, index) {
                          return DetailsCard(
                            serial: "${controller.filteredList[index].id}",
                            name: controller.filteredList[index].name ?? 'Null',
                            certificate:
                                controller.filteredList[index].certificateNo ??
                                    'Null',
                            nid: controller.filteredList[index].nationalId ??
                                'Null',
                            passport:
                                controller.filteredList[index].passportNo ??
                                    'Null',
                            date: controller.filteredList[index].createdAt!
                                .substring(0, 24),
                            createdBy: controller.currentUserName.value,
                            onDelete: () => controller
                                .deletePdf(controller.filteredList[index].id),
                            onDownload: () => GlobalService().downloadFile(
                                Api.BASE_URL +
                                    controller.filteredList[index].pdfUrl
                                        .toString(),
                                controller.filteredList[index].name! +
                                    controller.filteredList[index].id
                                        .toString()),
                            onPdfView: () => GlobalService().openLinkInNewTab(
                                Api.BASE_URL +
                                    controller.filteredList[index].pdfUrl
                                        .toString(),
                                '${controller.filteredList[index].name!}-${controller.filteredList[index].id}'),
                          );
                        },
                        itemCount: controller.filteredList.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            height: 5,
                          );
                        },
                      )
                    : FutureBuilder<GetDataModal>(
                        future: controller.fetchFileList(),
                        builder:
                            (context, AsyncSnapshot<GetDataModal> snapshot) {
                          return snapshot.hasData
                              ? snapshot.data!.data!.isNotEmpty
                                  ? ListView.separated(
                                      itemBuilder: (context, index) {
                                        return DetailsCard(
                                          serial:
                                              "${snapshot.data!.data![index].id}",
                                          name: snapshot
                                                  .data!.data![index].name ??
                                              'Null',
                                          certificate: snapshot.data!
                                                  .data![index].certificateNo ??
                                              'Null',
                                          nid: snapshot.data!.data![index]
                                                  .nationalId ??
                                              'Null',
                                          passport: snapshot.data!.data![index]
                                                  .passportNo ??
                                              'Null',
                                          date: snapshot
                                              .data!.data![index].createdAt!
                                              .substring(0, 24),
                                          createdBy:
                                              controller.currentUserName.value,
                                          onDelete: () {
                                            controller.deletePdf(
                                                snapshot.data!.data![index].id);
                                          },
                                          onDownload: () => GlobalService()
                                              .downloadFile(
                                                  Api.BASE_URL +
                                                      snapshot.data!
                                                          .data![index].pdfUrl
                                                          .toString(),
                                                  snapshot.data!.data![index]
                                                          .name! +
                                                      snapshot
                                                          .data!.data![index].id
                                                          .toString()),
                                          onPdfView: () => GlobalService()
                                              .openLinkInNewTab(
                                                  Api.BASE_URL +
                                                      snapshot.data!
                                                          .data![index].pdfUrl
                                                          .toString(),
                                                  '${snapshot.data!.data![index].name!}-${snapshot.data!.data![index].id}'),
                                        );
                                      },
                                      itemCount: snapshot.data!.data!.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const Divider(
                                          height: 5,
                                        );
                                      },
                                    )
                                  : const Center(
                                      child: Text(
                                        'No Data Found',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    )
                              : Center(
                                  child:
                                      LoadingAnimationWidget.staggeredDotsWave(
                                          color: Colors.blue, size: 50),
                                );
                        },
                      );
              });
      }),
    );
  }
}
