//
//  NSAttributedString.swift
//  ExFoundation
//
//  Created by 林達也 on 2018/02/10.
//  Copyright © 2018年 林達也. All rights reserved.
//

import Foundation
#if os(macOS)
    import class AppKit.NSFont
    import class AppKit.NSColor
#else
    import class UIKit.UIFont
    import class UIKit.UIColor
#endif

extension NSAttributedString {
    public enum Attribute {
        #if os(macOS)
            public typealias Font = NSFont
            public typealias Color = NSColor
        #else
            public typealias Font = UIFont
            public typealias Color = UIColor
        #endif

        public enum Link {
            case url(NSURL)
            case string(String)

            fileprivate var rawValue: Any {
                switch self {
                case .url(let value): return value
                case .string(let value): return value
                }
            }
        }
        public enum VerticalGlyphForm: Int {
            case horizontal
            #if os(macOS)
            case vertical
            #endif
        }

        case font(Font)
        case paragraphStyle(NSParagraphStyle)
        case foregroundColor(Color)
        case backgroundColor(Color)
        case ligature(Int)
        case kern(CGFloat)
        case strikethroughStyle(NSUnderlineStyle)
        case underlineStyle(NSUnderlineStyle)
        case strokeColor(Color)
        case strokeWidth(CGFloat)
        case shadow(NSShadow)
        case textEffect(TextEffectStyle)
        case attachment(NSTextAttachment)
        case link(Link)
        case baselineOffset(CGFloat)
        case underlineColor(Color)
        case strikethroughColor(Color)
        case obliqueness(CGFloat)
        case expansion(CGFloat)
        case writingDirection([NSWritingDirection])
        case verticalGlyphForm(VerticalGlyphForm)

        fileprivate var key: NSAttributedStringKey {
            switch self {
            case .font: return .font
            case .paragraphStyle: return .paragraphStyle
            case .foregroundColor: return .foregroundColor
            case .backgroundColor: return .backgroundColor
            case .ligature: return .ligature
            case .kern: return .kern
            case .strikethroughStyle: return .strikethroughStyle
            case .underlineStyle: return .underlineStyle
            case .strokeColor: return .strokeColor
            case .strokeWidth: return .strokeWidth
            case .shadow: return .shadow
            case .textEffect: return .textEffect
            case .attachment: return .attachment
            case .link: return .link
            case .baselineOffset: return .baselineOffset
            case .underlineColor: return .underlineColor
            case .strikethroughColor: return .strikethroughColor
            case .obliqueness: return .obliqueness
            case .expansion: return .expansion
            case .writingDirection: return .writingDirection
            case .verticalGlyphForm: return .verticalGlyphForm
            }
        }

        fileprivate var value: Any {
            switch self {
            case .font(let value): return value
            case .paragraphStyle(let value): return value
            case .foregroundColor(let value): return value
            case .backgroundColor(let value): return value
            case .ligature(let value): return value
            case .kern(let value): return value
            case .strikethroughStyle(let value): return value.rawValue
            case .underlineStyle(let value): return value.rawValue
            case .strokeColor(let value): return value
            case .strokeWidth(let value): return value
            case .shadow(let value): return value
            case .textEffect(let value): return value.rawValue
            case .attachment(let value): return value
            case .link(let value): return value.rawValue
            case .baselineOffset(let value): return value
            case .underlineColor(let value): return value
            case .strikethroughColor(let value): return value
            case .obliqueness(let value): return value
            case .expansion(let value): return value
            case .writingDirection(let value): return value.map { $0.rawValue }
            case .verticalGlyphForm(let value): return value.rawValue
            }
        }
    }

    public typealias Components = (string: String, attributes: [Attribute])

    public convenience init(string str: String, attributes attrs: [Attribute]) {
        self.init(string: str, attributes: Dictionary(uniqueKeysWithValues: attrs.map { ($0.key, $0.value) }))
    }

    public convenience init(_ comps: [(string: String, attributes: [Attribute])]) {
        self.init(attributedString: comps.attributedString)
    }
}

extension Array where Element == NSAttributedString.Components {
    public var attributedString: NSAttributedString {
        let str = NSMutableAttributedString()
        map { NSAttributedString(string: $0.string, attributes: $0.attributes) }.forEach(str.append)
        return NSAttributedString(attributedString: str)
    }
}
