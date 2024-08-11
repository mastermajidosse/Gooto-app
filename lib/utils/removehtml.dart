class RemoveHtmlTags {
  String removeHtmlTags(String htmlText) {
    // Regular expression to match HTML tags
    RegExp tagExp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    // Replace all HTML tags with an empty string
    String cleanedText = htmlText.replaceAll(tagExp, '');

    // Replace multiple whitespaces with a single space and trim the string
    cleanedText = cleanedText.replaceAll(RegExp(r'\s+'), ' ').trim();

    return cleanedText.trim();
  }
}
