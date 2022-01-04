import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mepoupeapp/presenter/components/bottom_minhas_metas_row.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class MinhasMetas extends StatefulWidget {
  const MinhasMetas({Key? key}) : super(key: key);

  @override
  _MinhasMetasState createState() => _MinhasMetasState();
}

class _MinhasMetasState extends State<MinhasMetas> {
  var list = [
    BottomMinhasMetasRow(
      percent: 80613 / 1000000 * 100,
      total: 'R\$ 2.000',
      prazo: 'fev 2022',
      valorAtual: 'R\$ 0',
      image: Image.asset('assets/umbrella.png'),
      editable: true,
      rocketVisibility: true,
      title: 'Férias na praia',
    ),
    BottomMinhasMetasRow(
      percent: 200 / 700 * 100,
      total: 'R\$ 700',
      prazo: 'dez 2022',
      valorAtual: 'R\$ 22.500',
      image: Image.asset('assets/bicycle.png'),
      editable: true,
      rocketVisibility: true,
      title: 'Bicicleta SOuth Stark',
    ),
    BottomMinhasMetasRow(
      percent: 80613 / 1000000 * 100,
      total: 'R\$ 200.000',
      prazo: 'set 2036',
      valorAtual: 'R\$ 10.000',
      image: Image.asset('assets/house.png'),
      editable: true,
      rocketVisibility: true,
      title: 'Imóvel',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginBackground,
      appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: AppColors.white,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: AppColors.white),
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, top: 24, right: 20, bottom: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/home_pos_selfie')),
                          // Navigator.pushNamed(context, '/home_pos_selfie'),
                          icon: const FaIcon(
                            FontAwesomeIcons.angleLeft,
                            color: AppColors.purple,
                            size: 28,
                          ),),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Minhas metas',
                          style: TextStyles
                              .textSelfieCardMedium15MontserratDarkBlueSemiBold,
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 32, bottom: 24),
                      child: Column(
                        children: [
                          ListView.builder(
                            itemCount: list.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              final item = list[index];
                              return BottomMinhasMetasRow(
                                percent: item.percent,
                                total: item.total,
                                valorAtual: item.valorAtual,
                                prazo: item.prazo,
                                image: item.image,
                                editable: item.editable,
                                rocketVisibility: item.rocketVisibility,
                                title: item.title,
                              );
                            },
                          ),
                          InkWell(
                            onTap: () async => await Navigator.pushNamed(
                                context, '/criar_meta_1'),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 22),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.darkBlue,
                                    radius: 14,
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.white,
                                      radius: 12,
                                      child: Text(
                                        '+',
                                        style: TextStyles
                                            .textSelfieCardMedium15MontserratDarkBlueSemiBold,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Criar próxima meta!',
                                  style: TextStyles.paragraphSmall11DarkBlue,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
