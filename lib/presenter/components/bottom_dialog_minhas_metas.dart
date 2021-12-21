import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

import 'bottom_dialog_meus_envelopes_row.dart';
import 'bottom_minhas_metas_row.dart';

class BottomDialogMinhasMetas extends StatefulWidget {
  final List<BottomMinhasMetasRow> list;

  const BottomDialogMinhasMetas({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  _BottomDialogMinhasMetasState createState() =>
      _BottomDialogMinhasMetasState();
}

class _BottomDialogMinhasMetasState extends State<BottomDialogMinhasMetas> {
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: AppColors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 16, top: 32, bottom: 24),
          child: Column(
            children: [
              ListView.builder(
                itemCount: widget.list.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final item = widget.list[index];
                  return BottomMinhasMetasRow(
                    percent: item.percent,
                    total: item.total,
                    valorAtual: item.valorAtual,
                    prazo: item.prazo,
                    image: item.image,
                  );
                },
              ),
              InkWell(
                onTap: () async => await Navigator.pushNamed(context, '/criar_meta_1'),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 22),
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
    );
  }
}
