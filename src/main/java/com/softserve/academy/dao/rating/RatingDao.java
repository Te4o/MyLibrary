package com.softserve.academy.dao.rating;

import java.util.List;

import com.softserve.academy.model.Rating;

public interface RatingDao {

	Rating findById(Long id);

	void saveRating(Rating rating);

	List<Rating> findAllRatings();
	
	List<Rating> findAllRatingsByBook(Long bookId);
	
	List<Rating> findAllRatingsByUser(Long userId);
}