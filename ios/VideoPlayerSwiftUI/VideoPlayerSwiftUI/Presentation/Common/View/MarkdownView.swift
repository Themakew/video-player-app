//
//  MarkdownView.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

import SwiftUI
import MarkdownKit

struct MarkdownView: UIViewRepresentable {
    var markdownText: String
    var textColor: UIColor = .black
    var font = UIFont.systemFont(ofSize: 16)

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        textView.textColor = textColor
        textView.font = font
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return textView
    }

    func updateUIView(_ textView: UITextView, context: Context) {
        let markdownParser = MarkdownParser(font: font, color: textColor)
        textView.attributedText = markdownParser.parse(markdownText)
        textView.sizeToFit()
    }
}

#Preview {
    MarkdownView(markdownText: "Test **bold**")
}
