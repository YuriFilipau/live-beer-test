import 'package:flutter/material.dart';
import 'package:live_beer/app/constants/app_styles.dart';

class TextInputField extends StatefulWidget {
  final String title;
  final TextEditingController? controller;
  final String? hintText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmit;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  final String? errorText;
  final bool hasError;

  const TextInputField({
    super.key,
    this.controller,
    this.hintText,
    this.initialValue,
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.onSubmit,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.autoFocus = false,
    this.textInputAction,
    this.errorText,
    this.hasError = false,
    required this.title,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  String? _errorText;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _validate(String value) {
    if (widget.validator != null) {
      final error = widget.validator!(value);
      setState(() {
        _errorText = error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: AppStyles.textLiteGrey,
            fontSize: AppStyles.s14,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppStyles.radius),
            border: Border.all(color: _getBorderColor()),
            color: widget.enabled ? Colors.white : AppStyles.enabledBorder,
          ),
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            enabled: widget.enabled,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            onChanged: (value) {
              _validate(value);
              widget.onChanged?.call(value);
            },
            onSubmitted: (value) {
              widget.onSubmit?.call(value);
            },
            autofocus: widget.autoFocus,
            textInputAction: widget.textInputAction,
            style: const TextStyle(
              fontSize: AppStyles.s17,
              color: AppStyles.text,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              contentPadding:
                  widget.contentPadding ?? const EdgeInsets.all(AppStyles.s14),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintStyle: const TextStyle(color: AppStyles.textLiteGrey),
              counterText: '',
            ),
          ),
        ),
        if ((_errorText != null && _errorText!.isNotEmpty) ||
            (widget.hasError &&
                widget.errorText != null &&
                widget.errorText!.isNotEmpty))
          _buildErrorText(widget.errorText ?? _errorText!),
      ],
    );
  }

  Color _getBorderColor() {
    if (widget.hasError || _errorText != null) {
      return AppStyles.errorBorder;
    }
    if (_isFocused) {
      return AppStyles.focusedBorder;
    }
    return AppStyles.enabledBorder;
  }

  Widget _buildErrorText(String error) {
    return Text(
      error,
      style: const TextStyle(
        color: AppStyles.errorBorder,
        fontSize: AppStyles.s14,
      ),
    );
  }
}
