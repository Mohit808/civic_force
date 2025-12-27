import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/utils/app_images.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'controller_web_view.dart';


class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key, required this.search});
  final String search;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerWebView(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Pinterest"),
          body: Stack(
            children: [
              Column(children: [
                // Expanded(
                //   child: InAppWebView(
                //     initialUrlRequest: URLRequest(
                //       url: WebUri('https://in.pinterest.com/search/pins/?q=${search.replaceAll("Division", "").trim()}'),
                //     ),
                //     onDownloadStartRequest: (controller, request) {
                //       print("Download URL: ${request.url}");
                //     },
                //   ),
                // )
                // Expanded(child: InAppWebView(
                //   initialUrlRequest: URLRequest(
                //     url: WebUri(
                //       'https://in.pinterest.com/pin/186758715794781033/',
                //     ),
                //   ),
                //   contextMenu: ContextMenu(
                //     menuItems: [
                //       ContextMenuItem(
                //         id: 1,
                //         title: "Copy Image URL",
                //         action: () async {},
                //       ),
                //     ],
                //     onCreateContextMenu: (hitTestResult) {
                //       if (hitTestResult.type ==
                //           InAppWebViewHitTestResultType.IMAGE_TYPE ||
                //           hitTestResult.type ==
                //               InAppWebViewHitTestResultType.SRC_IMAGE_ANCHOR_TYPE) {
                //
                //         final imageUrl = hitTestResult.extra;
                //         print("IMAGE URL: $imageUrl");
                //       }
                //     },
                //     onContextMenuActionItemClicked: (menuItem) async {
                //       if (menuItem.id == 1) {
                //         // copy to clipboard
                //       }
                //     },
                //   ),
                // )
                // )

                Expanded(child: InAppWebView(
                  onWebViewCreated: (controllerWebView){
                    controller.inAppWebViewController=controllerWebView;
                  },
                  initialUrlRequest: URLRequest(
                    url: WebUri("https://in.pinterest.com/search/pins/?q=${search.replaceAll("Division", "").trim()}"),
                  ),

                  initialSettings: InAppWebViewSettings(
                    disableHorizontalScroll: false,
                    disableVerticalScroll: false,
                    supportZoom: true,

                    // 🔴 KEY FIX
                    disableContextMenu: false,
                    useShouldOverrideUrlLoading: true,
                  ),

                  onLongPressHitTestResult: (controllerPress, hitTest) {
                    if (hitTest.type ==
                        InAppWebViewHitTestResultType.IMAGE_TYPE ||
                        hitTest.type ==
                            InAppWebViewHitTestResultType.SRC_IMAGE_ANCHOR_TYPE) {

                      final imageUrl = hitTest.extra;
                      print("Image URL: $imageUrl");

                      controller.url=imageUrl;
                      controller.update();
                      // show your own bottom sheet
                    }
                  },
                )
                )
              ],),
              InkWell(onTap: (){
                controller.inAppWebViewController.goBack();
              },
                child: Container(margin: EdgeInsets.all(10),padding: EdgeInsets.all(4),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.grey),boxShadow: [
                  BoxShadow(color: Colors.white.withOpacity(0.3)),
                  BoxShadow(color: Colors.white.withOpacity(0.3)),
                ]),child: Icon(Icons.arrow_back_ios_new_outlined),),
              ),
              if(controller.url!=null)Column(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ContainerDecorated(color: AppColors.primary,padding: 16,child: Row(spacing: 16,children: [
                    ImageCommon(controller.url,size: 50,borderRadius: 10,),
                    Expanded(child: Column(spacing: 4,crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SmallText(text: search,fontWeight: FontWeight.w600,size: 16,overflow: TextOverflow.ellipsis,color: Colors.white,),
                        SmallText(text: "Is this represents your city?",color: Colors.white70,fontWeight: FontWeight.w500,),
                      ],
                    )),
                    ContainerDecorated(onTap: (){
                      Get.back(result: controller.url);
                    },paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 24,vertical: 10),child: SmallText(text: "Use it",color: Colors.green,fontWeight: FontWeight.w600,),)
                  ],),),
                ],
              ),

              if(controller.showAnime)Container(decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(top: 100,left: 24,right: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DotLottieLoader.fromAsset(AppImages.click, frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                          if (dotlottie != null) {
                            return Lottie.memory(dotlottie.animations.values.single);
                          } else {
                            return Container();
                          }
                        }),
                      ),
                    ),
                    SmallText(text: "Hold Press to select image",size: 18,fontWeight: FontWeight.w600,color: Colors.white,),
                    SizedBox(width: 30,)
                  ],
                ),
              ),

            ],
          ),
        );
      }
    );
  }
}
