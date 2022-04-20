package com.katebarber.savetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.katebarber.savetravels.models.Expense;
import com.katebarber.savetravels.services.ExpenseService;


@Controller
public class ExpenseController {
	private final ExpenseService expenseService;
	public ExpenseController(ExpenseService expenseService) {
		this.expenseService = expenseService;
	}
	
	// SHOW ALL
	@GetMapping("/")
	public String index(@ModelAttribute("expense") Expense expense, Model model) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		return "index.jsp";
	}
	
	// SHOW ONE
	@GetMapping("/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Expense expense = expenseService.showOne(id);
		model.addAttribute("expense", expense);
		return "edit.jsp";
	}
	
	@GetMapping("/expenses/{id}")
	public String details(@PathVariable("id") Long id, Model model) {
		Expense expense = expenseService.showOne(id);
		model.addAttribute("expense", expense);
		return "showone.jsp";
	}
	
	// CREATE
	@PostMapping("/")
	public String create (@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Expense> expenses = expenseService.allExpenses();
			model.addAttribute("expenses", expenses);
			return "index.jsp";
		} else {
			expenseService.createExpense(expense);
			return "redirect:/";
		}
	}
	
	// UPDATE (EDIT)
	@PutMapping("/{id}/edit")
	public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, @PathVariable("id")Long id) {
		if (result.hasErrors()) {		
			System.out.println("error");
			return "edit.jsp";
		} else {
			expenseService.updateExpense(expense, id);
			return "redirect:/";
		}
	}
		
	//	DELETE
	@DeleteMapping("/{id}/delete")
	public String delete(@PathVariable("id")Long id) {
		expenseService.delete(id);
		return "redirect:/";
	}
	
}
