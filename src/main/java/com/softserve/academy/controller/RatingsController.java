package com.softserve.academy.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.softserve.academy.model.Book;
import com.softserve.academy.model.Rating;
import com.softserve.academy.model.User;
import com.softserve.academy.service.author.AuthorService;
import com.softserve.academy.service.book.BookService;
import com.softserve.academy.service.rating.RatingService;
import com.softserve.academy.service.user.UserService;

@Controller
@RequestMapping(value = "/authors/{id}/books/{book_id}")
public class RatingsController {
	@Autowired
	BookService bookService;

	@Autowired
	AuthorService authorService;

	@Autowired
	RatingService ratingService;

	@Autowired
	UserService userService;

	@RequestMapping(value = { "/rating" }, method = RequestMethod.GET)
	public String addNewRating(@PathVariable Long book_id, ModelMap model) {
		Book book = bookService.findById(book_id);
		Rating rating = new Rating();
		model.addAttribute("rating", rating);
		model.addAttribute("book", book);

		return "books/rating";
	}

	@RequestMapping(value = { "/ratingCheck" }, method = RequestMethod.GET)
	public String checkRating(@PathVariable Long book_id, ModelMap model) {
		Book book = bookService.findById(book_id);

		List<Rating> bookRatings = book.getRatings();
		int total = 0;
		int bookRatingsCount = bookRatings.size();

		for (Rating rating : bookRatings) {
			total += rating.getRatingValue();
		}

		book.setAverageRating(String.format("%.1f", (double) total / bookRatingsCount));

		model.addAttribute("book", book);

		return "books/ratingCheck";
	}

	@RequestMapping(value = { "/rating" }, method = RequestMethod.POST)
	public String saveRating(@AuthenticationPrincipal UserDetails userDetails, @PathVariable Long book_id,
			@Valid Rating rating, BindingResult result, ModelMap model, @PathVariable Long id) {
		User user = userService.findByUsername(userDetails.getUsername());
		Rating ratingToSave = new Rating();

		ratingToSave.setBook(bookService.findById(book_id));
		ratingToSave.setRatingValue(rating.getRatingValue());
		ratingToSave.setUser(user);
		System.out.println();

		ratingService.saveRating(ratingToSave);

		return "redirect:/authors/{id}/books/";
	}
}