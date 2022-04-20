package com.katebarber.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.katebarber.savetravels.models.Expense;
import com.katebarber.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	private final ExpenseRepository expenseRepository;
	
	public ExpenseService(ExpenseRepository expenseRepository) {
		this.expenseRepository = expenseRepository;
	}
	
	public List<Expense> allExpenses() {
		return expenseRepository.findAll();
	}
	
	public Expense showOne(Long id) {
		Optional<Expense> optionalExpense = expenseRepository.findById(id);
		if(optionalExpense.isPresent()) {
			return optionalExpense.get();
		}else {
			return null;
		}
	}
	
	public Expense createExpense(Expense e) {
		return expenseRepository.save(e);
	}
	
	public Expense updateExpense(Expense e, Long id) {
		Optional<Expense> optionaExpense = expenseRepository.findById(id);
		if (optionaExpense.isPresent()) {
			Expense expense = optionaExpense.get();
			expense.setExpenseName(e.getExpenseName());
			expense.setVendor(e.getVendor());
			expense.setAmount(e.getAmount());
			expense.setDescription(e.getDescription());
			return expenseRepository.save(expense);
		} else {
			return null;
		}
	}
	
	public void delete(Long id) {
		expenseRepository.deleteById(id);
	}
	
}