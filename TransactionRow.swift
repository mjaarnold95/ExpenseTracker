//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Michael Arnold on 5/15/25.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
	var transaction: Transaction
	
	var body: some View {
		HStack(spacing: 20) {
			//MARK: Transaction Category Icon
			RoundedRectangle(cornerRadius: 20, style: .continuous)
				.fill(Color.appIcon.opacity(0.3))
				.frame(width: 44, height: 44)
				.overlay {
					FontIcon.text(.awesome5Solid(code: transaction.icon), fontsize: 24, color: Color.appIcon)
				}
			
			VStack(alignment: .leading, spacing: 6) {
				Text(transaction.merchant)
					.font(.subheadline)
					.bold()
					.lineLimit(1)
				
				// MARK: Transaction Category
				Text(transaction.category)
					.font(.footnote)
					.opacity(0.7)
					.lineLimit(1)
				
				// MARK: Transaction Date
				Text(transaction.dateParsed, format: .dateTime.year().month().day())
					.font(.footnote)
					.foregroundColor(.secondary)
			}
			
			Spacer()
			// MARK: Transaction Amount
			Text(transaction.signedAmount, format: .currency(code: "USD"))
				.bold()
				.foregroundColor(transaction.type == TransactionType.credit.rawValue
								? Color.appText : .primary)
		}
		.padding()
	}
}

struct TransactionRow_Previews: PreviewProvider {
	static var previews: some View {
		TransactionRow(transaction: transactionPreviewData)
		TransactionRow(transaction: transactionPreviewData)
			.preferredColorScheme(.dark)
	}
}
