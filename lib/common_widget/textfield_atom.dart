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
    TextStyle? textStyleHint

  }):super(
      textAlign: textAlign??TextAlign.start,
      obscureText: isPassword,
      onFieldSubmitted: onFieldSubmitted,
      onTapOutside: (value){
        FocusManager.instance.primaryFocus?.unfocus();
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        if(onTapOutside!=null){
          onTapOutside();
        }
      },
      style: textStyleHint?? const TextStyle(fontSize: 12),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(label: label.runtimeType==String?SmallText(text: label,):label,filled: true,isDense: isDense,fillColor:fillColor,enabledBorder: hideOutlineBorder!=null?null:OutlineInputBorder(borderRadius: borderRadius!=null?BorderRadius.circular(borderRadius):BorderAtom.borderRadiusTextField,borderSide: BorderSide(color: BorderColor??Colors.grey.shade300)),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: textStyleHint??TextStyle(fontSize: 12,),
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
