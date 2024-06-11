import 'package:dattingapp/res/color.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  const InputTextField(
      {
      required this.myController,
      required this.focusNode,
      required this.onFieldSubmittedValue,
      required this.keyboardType,
      this.isPasswordField,
      required this.hint,
      this.enable = true,
      this.autoFocus = false,
      required this.onValidator});


  final TextEditingController myController;
  final FocusNode? focusNode;
  final FormFieldSetter? onFieldSubmittedValue;
  final FormFieldValidator? onValidator;
  final TextInputType? keyboardType;
  final String? hint;
  final bool? isPasswordField;
  final bool? enable, autoFocus;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      key: _formKey,
      controller: widget.myController,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmittedValue,
      validator: widget.onValidator,
      keyboardType: widget.keyboardType,
      enabled: widget.enable,
      obscureText: widget.isPasswordField == true? _obscureText : false,
      
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 19),
      decoration: InputDecoration(

        hintText: widget.hint,
        contentPadding: EdgeInsets.all(15),
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColors.primaryTextTextColor.withOpacity(0.8)),
        border: OutlineInputBorder(
          
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(199, 0, 68, 255),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.alertColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textFieldDefaultBorderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
                    suffixIcon: new GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child:
              widget.isPasswordField==true? Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: _obscureText == false ? Color.fromARGB(255, 0, 140, 255) : Color.fromRGBO(40, 69, 150, 1),) : Text(""),
            ),
      ),
    );
  }
}
