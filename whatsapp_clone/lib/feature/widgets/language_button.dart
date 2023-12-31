import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/utils/coloors.dart';
import 'package:whatsapp_clone/common/widgets/custom_icon_button.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
  });

  showBottomSheet(context) {

    /*
    A modal bottom sheet is an alternative to a menu or a dialog
    and prevents the user from interacting with the rest of the
    app.
     */

    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Container(
                height: 4,
                width: 30,
                decoration: BoxDecoration(
                  color: context.theme.greyColor!.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [

                  const SizedBox(width: 20),

                  CustomIconButton(
                    onTap: () => Navigator.of(context).pop(),
                    icon: Icons.close_outlined,
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    'App Language' ,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 10),

              /*
              Divider widget is used when you have multiple child and want
              to separate by the line or divider.
               */

              Divider(
                color: context.theme.greyColor!.withOpacity(0.3),
                thickness: .5,
              ),



              RadioListTile(
                value: true,
                groupValue: true,
                onChanged: (value) {},
                activeColor: Coloors.greenDark,
                title: const Text('English'),
                subtitle: Text("(phone's language)", style: TextStyle(
                  color: context.theme.greyColor,
                ),),
              ),

              RadioListTile(
                value: true,
                groupValue: false,
                onChanged: (value) {},
                activeColor: Coloors.greenDark,
                title: const Text('ለማርዊ'),
                subtitle: Text("Amharic", style: TextStyle(
                  color: context.theme.greyColor,
                ),),
              ),


            ],

          ),
        );
    },);

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.langBtnBgColor,
      borderRadius: BorderRadius.circular(20),

      child: InkWell(

        onTap: () => showBottomSheet(context),

        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory,
        highlightColor: context.theme.langBtnHighlightColor,

        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.language ,
                color: Coloors.greenDark,
              ),

              SizedBox(width: 10),

              Text(
                'English' ,
                style: TextStyle(
                  color: Coloors.greenDark,
                ),
              ),

              SizedBox(width: 10),

              Icon(
                Icons.keyboard_arrow_down ,
                color: Coloors.greenDark,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
