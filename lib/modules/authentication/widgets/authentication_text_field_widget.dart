import 'package:flutter/material.dart';
class AuthenticationTextFieldWidget extends StatelessWidget {
  final Function(String?) onSaved;
  final String label;
  final IconData iconData;
  final IconData? suffixIconData;
  final VoidCallback? onSuffixIconClick;
  final bool isPassword;
  final Color iconColor;
  const AuthenticationTextFieldWidget({
    Key? key,
    required this.onSaved,
    required this.label,
    required this.iconData,
    required this.isPassword,
    this.suffixIconData,
    this.onSuffixIconClick,
    required this.iconColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        onSaved: onSaved,
        decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: label,
          labelStyle: Theme.of(context).textTheme.labelMedium,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CircleAvatar(
                backgroundColor:
                iconColor.withAlpha(10),
                child: Icon(
                  iconData,
                  color: iconColor,
                )),
          ),
          suffixIcon:
          (suffixIconData != null)
          ? Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: onSuffixIconClick,
              child: Icon(
                suffixIconData,
                color: Colors.black54,
              ),
            ),
          )
              : const SizedBox.shrink(),
        ),
        cursorColor: Colors.black54,
        cursorWidth: 1,
        obscureText: (isPassword) ? true : false ,
      ),
    );
  }
}
