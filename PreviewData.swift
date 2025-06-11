//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Michael Arnold on 5/15/25.
//

import Foundation

var transactionPreviewData = Transaction(id: 1, date: "2022-01-24", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: "debit", typeEnum: "pos", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
