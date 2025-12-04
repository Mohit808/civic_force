import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_sizes.dart';
import 'border_atom.dart';
import 'text_common.dart';

class TextFieldCommon extends TextFormField{
  TextFieldCommon({
    super.key,
    required String hintText,
    super.keyboardType,
    TextAlign? textAlign,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool? hideOutlineBorder,
    double? borderRadius,
    Color? fillColor,
    bool? isDense,
    double? contentPadding,
    Color? BorderColor,
    Color? colorHint,
    Color? colorText,
    dynamic label,
    super.minLines,
    Function()? onTapOutside,
    Function(String)?onFieldSubmitted,
    super.enabled,
    super.onTap,
    super.controller,
    super.validator,
    super.initialValue,
    super.autovalidateMode=AutovalidateMode.onUserInteraction,
    super.enableSuggestions=true,
    super.maxLength,
    super.inputFormatters,
    super.onChanged,
    super.onEditingComplete,
    super.focusNode,
    super.maxLines,
    super.textInputAction,
    bool isPassword=false,
    super.autofillHints,
    TextCapitalization? textCapitalization,
    bool? tapOutsideOff

  }):super(
      textAlign: textAlign??TextAlign.start,
      obscureText: isPassword,
      onFieldSubmitted: onFieldSubmitted,
      onTapOutside: tapOutsideOff!=null?null: (value){
        FocusManager.instance.primaryFocus?.unfocus();
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        if(onTapOutside!=null){
          onTapOutside();
        }
      },
      style: TextStyle(fontSize: 12,color: colorText),
      textCapitalization: textCapitalization?? TextCapitalization.sentences,

      decoration: InputDecoration(label: label.runtimeType==String?Text(label,style: TextStyle(fontSize: 12,color: Colors.white),):label,filled: true,isDense: isDense,fillColor:fillColor,enabledBorder: hideOutlineBorder!=null?null:OutlineInputBorder(borderRadius: borderRadius!=null?BorderRadius.circular(borderRadius):BorderAtom.borderRadiusTextField,borderSide: BorderSide(color: BorderColor??Colors.grey.shade300)),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle:  TextStyle(fontSize: 12,color: Colors.white70),
        contentPadding:  EdgeInsets.all(contentPadding??AppSizes.h_12),
        border:  hideOutlineBorder!=null?null:OutlineInputBorder(
          borderRadius:  borderRadius!=null?BorderRadius.circular(borderRadius):BorderAtom.borderRadiusTextField,
          borderSide: const BorderSide(
              width: AppSizes.w_0,
              style: BorderStyle.solid
          ),
        ),
      )
  );
}
