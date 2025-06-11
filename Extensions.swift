//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Michael Arnold on 5/15/25.
//

import Foundation
import SwiftUI

extension Color {
	static let appBackground = Color("Background")
	static let appIcon = Color("Icon")
	static let appText = Color("Text")
	static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
	static let allNumericUSA: DateFormatter = {
		print("Initializing DateFormatter")
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM_dd"
		
		return formatter
	}()
}

extension String {
	func dateParsed() -> Date {
		guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }
		return parsedDate
	}
}
