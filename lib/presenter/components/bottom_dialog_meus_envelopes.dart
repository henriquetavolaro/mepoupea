import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

import 'bottom_dialog_meus_envelopes_row.dart';

class BottomDialogMeusEnvelopes extends StatefulWidget {
  final List<BottomMeusEnvelopesRow> list;

  const BottomDialogMeusEnvelopes({Key? key, required this.list})
      : super(key: key);

  @override
  _BottomDialogMeusEnvelopesState createState() =>
      _BottomDialogMeusEnvelopesState();
}

class _BottomDialogMeusEnvelopesState extends State<BottomDialogMeusEnvelopes> {
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)),
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
                  return BottomMeusEnvelopesRow(
                    percent: item.percent,
                    title: item.title,
                    total: item.total,
                    valorAtual: item.valorAtual,
                    prazo: item.prazo,
                  );
                },
              ),
              Row(
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
                          )),
                    ),
                  ),
                  Text(
                    'Novo envelope de gastos!',
                    style: TextStyles.paragraphSmall11DarkBlue,
                  )
                ],
              )
            ],
          ),
        ),)
      ,
    );
  }
}
