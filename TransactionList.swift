//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Michael Arnold on 6/3/25.
//

import SwiftUI

struct TransactionList: View {
	@EnvironmentObject var transactionListVM: TransactionListViewModel
	var body: some View {
		VStack {
			List {
				// MARK: Transaction Groups
				ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key) { month,
					transactions in
					Section {
						// MARK: Transaction List
						ForEach(transactions) { transaction in
							TransactionRow(transaction: transaction)
						}
					} header: {
						// MARK: Transaction Month
						Text(month)
					}
					.listSectionSeparator(.hidden)
				}
			}
			.listStyle(.plain)
		}
		.navigationTitle("Transactions")
		.navigationBarTitleDisplayMode(.inline)
	}
}

struct TransactionList_Previews: PreviewProvider {
	static let transactionListVM: TransactionListViewModel = {
		let transactionListVM = TransactionListViewModel()
		transactionListVM.transactions = transactionListPreviewData
		return transactionListVM
	}()
	
	static var previews: some View {
		Group {
			TransactionList()
			TransactionList()
				.preferredColorScheme(.dark)
		}
		.environmentObject(transactionListVM)
	}
}
