import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputWidgetBase extends FormField<String> {
  TextInputWidgetBase({
    super.key,
    String? hintText,
    String? labelText,
    int? maxLength,
    TextStyle? labelStyle,
    Widget? titleInputWidget,
    Widget? prefixIcon,
    bool readOnly = false,
    bool displayOnly = false,
    bool securePassword = false,
    TextInputType? keyboardType,
    bool isDense = false,
    TextAlign textAlign = TextAlign.start,
    EdgeInsetsGeometry? padding,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onFieldSubmitted,
    TextInputAction? textInputAction,
    VoidCallback? onEditingComplete,
    void Function()? onTap,
    int? maxLines = 1,
    Color? colorSuccess,
    BoxConstraints? suffixIconConstraints,
    BoxConstraints? prefixIconConstraints,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    Widget? suffixIcon,
    Widget? Function(bool)? suffixIconValidator,
    FocusNode? focusNode,
    bool autofocus = false,
    EdgeInsetsGeometry? contentPadding,
    Color focusBorderColor = Colors.purpleAccent,
    bool isSuccess = false,
    Color? enabledBorderColor,
    super.enabled,
    super.validator,
    super.autovalidateMode,
    Color? borderColor,
    List<TextInputFormatter>? inputFormatters,
  }) : super(
          builder: (FormFieldState<String> state) {
            return Padding(
              padding: padding ?? const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (titleInputWidget != null) titleInputWidget,
                  Padding(
                    padding: EdgeInsets.only(
                      top: (labelStyle?.fontSize ?? 0) / 2,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: !state.hasError &&
                                    state.value != null &&
                                    state.value!.isNotEmpty ||
                                isSuccess
                            ? colorSuccess
                            : Colors.white,
                      ),
                      child: TextFormField(
                        maxLength: maxLength,
                        onEditingComplete: onEditingComplete,
                        onFieldSubmitted: onFieldSubmitted,
                        textInputAction: textInputAction,
                        onTap: onTap,
                        maxLines: maxLines,
                        style: textStyle ??
                            const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                        controller: controller,
                        readOnly: readOnly,
                        enabled: enabled,
                        autofocus: autofocus,
                        focusNode: focusNode,
                        inputFormatters: inputFormatters,
                        onChanged: (s) {
                          state.didChange(s);
                          onChanged?.call(s);
                        },
                        keyboardType: keyboardType,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: textAlign,
                        decoration: InputDecoration(
                          counterText: '',
                          isDense: isDense,
                          labelText: labelText,
                          floatingLabelStyle: labelStyle,
                          alignLabelWithHint: true,
                          prefixIcon: prefixIcon,
                          prefixIconColor: Colors.transparent,
                          suffixIconColor: Colors.transparent,
                          suffixIcon: suffixIcon ??
                              suffixIconValidator?.call(!(state.value == null ||
                                  state.value!.isEmpty ||
                                  state.hasError)),
                          suffixIconConstraints: suffixIconConstraints,
                          prefixIconConstraints: prefixIconConstraints,
                          hintText: hintText,
                          hintStyle: hintStyle ??
                              const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                          contentPadding: contentPadding ??
                              const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 4,
                              ).copyWith(
                                  left: textAlign == TextAlign.start ? 10 : 0),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (state.hasError)
                    Text(
                      state.errorText ?? '',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            );
          },
        );
}
