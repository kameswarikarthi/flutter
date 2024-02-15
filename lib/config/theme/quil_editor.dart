import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuilEditor extends StatelessWidget {
  const QuilEditor({
    super.key,
    this.withLabel = false,
    this.requiredField = false,
    this.label = '',
    this.isValid = true,
    required this.editorController,
    this.isViewOnly = false,
  });

  final bool withLabel;
  final bool requiredField;
  final String label;
  final QuillController editorController;
  final bool isValid;
  final bool isViewOnly;

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        withLabel ? Text(label) : const SizedBox.shrink(),
        SizedBox(
          height: withLabel ? 9.0 : 0,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            border: Border.all(
              color: isValid
                  ? Color(0xFF8F9BBA)
                  : Color.fromARGB(255, 219, 13, 13),
              width: 1.0,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
          child: QuillProvider(
            configurations: QuillConfigurations(
              controller: editorController,
              sharedConfigurations: const QuillSharedConfigurations(),
            ),
            child: Column(
              children: [
                QuillToolbarProvider(
                  toolbarConfigurations: const QuillToolbarConfigurations(),
                  child: QuillBaseToolbar(
                    configurations: QuillBaseToolbarConfigurations(
                      toolbarSize: 50,
                      toolbarSectionSpacing: 10,
                      childrenBuilder: (context) {
                        final controller =
                            editorController; // new extension which is a little bit shorter to access the quill provider then the controller
                        // there are many options, feel free to explore them all!!
                        return isViewOnly
                            ? []
                            : [
                                QuillToolbarHistoryButton(
                                  controller: controller,
                                  options:
                                      const QuillToolbarHistoryButtonOptions(
                                          isUndo: true),
                                ),
                                QuillToolbarHistoryButton(
                                  controller: controller,
                                  options:
                                      const QuillToolbarHistoryButtonOptions(
                                          isUndo: false),
                                ),
                                QuillToolbarToggleStyleButton(
                                  attribute: Attribute.bold,
                                  controller: controller,
                                  options:
                                      const QuillToolbarToggleStyleButtonOptions(
                                    iconData: Icons.format_bold,
                                    iconSize: 20,
                                  ),
                                ),
                                QuillToolbarToggleStyleButton(
                                  attribute: Attribute.italic,
                                  controller: controller,
                                  options:
                                      const QuillToolbarToggleStyleButtonOptions(
                                    iconData: Icons.format_italic,
                                    iconSize: 20,
                                  ),
                                ),
                                QuillToolbarToggleStyleButton(
                                  attribute: Attribute.underline,
                                  controller: controller,
                                  options:
                                      const QuillToolbarToggleStyleButtonOptions(
                                    iconData: Icons.format_underline,
                                    iconSize: 20,
                                  ),
                                ),
                                QuillToolbarClearFormatButton(
                                  controller: controller,
                                  options:
                                      const QuillToolbarClearFormatButtonOptions(
                                    iconData: Icons.format_clear,
                                    iconSize: 20,
                                  ),
                                ),
                                VerticalDivider(
                                  indent: 12,
                                  endIndent: 12,
                                  color: Colors.grey.shade400,
                                ),
                                QuillToolbarSelectHeaderStyleButtons(
                                  controller: controller,
                                  options:
                                      const QuillToolbarSelectHeaderStyleButtonsOptions(
                                    iconSize: 20,
                                  ),
                                ),
                                QuillToolbarToggleStyleButton(
                                  attribute: Attribute.ol,
                                  controller: controller,
                                  options:
                                      const QuillToolbarToggleStyleButtonOptions(
                                    iconData: Icons.format_list_numbered,
                                    iconSize: 20,
                                  ),
                                ),
                                QuillToolbarToggleStyleButton(
                                  attribute: Attribute.ul,
                                  controller: controller,
                                  options:
                                      const QuillToolbarToggleStyleButtonOptions(
                                    iconData: Icons.format_list_bulleted,
                                    iconSize: 20,
                                  ),
                                ),
                                QuillToolbarToggleStyleButton(
                                  attribute: Attribute.blockQuote,
                                  controller: controller,
                                  options:
                                      const QuillToolbarToggleStyleButtonOptions(
                                    iconData: Icons.format_quote,
                                    iconSize: 20,
                                  ),
                                ),
                                VerticalDivider(
                                  indent: 12,
                                  endIndent: 12,
                                  color: Colors.grey.shade400,
                                ),
                                QuillToolbarIndentButton(
                                    controller: controller,
                                    isIncrease: true,
                                    options:
                                        const QuillToolbarIndentButtonOptions(
                                      iconData: Icons.format_indent_increase,
                                      iconSize: 20,
                                    )),
                                QuillToolbarIndentButton(
                                  controller: controller,
                                  isIncrease: false,
                                  options:
                                      const QuillToolbarIndentButtonOptions(
                                    iconData: Icons.format_indent_decrease,
                                    iconSize: 20,
                                  ),
                                ),
                              ];
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                    color: isViewOnly == true
                        ? Theme.of(context).colorScheme.onBackground
                        : Theme.of(context).colorScheme.background,
                    border: Border(
                      bottom: BorderSide(
                        color: isValid
                            ? Color(0xFF8F9BBA)
                            : Color.fromARGB(255, 219, 13, 13),
                        width: 0.5,
                      ),
                      top: BorderSide(
                        color: isValid
                            ? Color(0xFF8F9BBA)
                            : Color.fromARGB(255, 219, 13, 13),
                        width: 0.5,
                      ),
                      left: BorderSide(
                        color: isValid
                            ? Color(0xFF8F9BBA)
                            : Color.fromARGB(255, 219, 13, 13),
                        width: 0.5,
                      ),
                      right: BorderSide(
                        color: isValid
                            ? Color(0xFF8F9BBA)
                            : Color.fromARGB(255, 219, 13, 13),
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                    child: QuillEditor.basic(
                      scrollController: ScrollController(),
                      focusNode: focusNode,
                      configurations: QuillEditorConfigurations(
                        showCursor: !isViewOnly,
                        minHeight: 200,
                        scrollable: true,
                        autoFocus: true,
                        readOnly: isViewOnly,
                        expands: false,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
