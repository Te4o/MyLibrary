package com.softserve.academy.service.rating;

import java.util.List;

import com.softserve.academy.model.Rating;

public interface RatingService {

	List<Rating> findAllRatings();

	
	void saveRating(Rating rating);

	
	List<Rating> findAllRatingsByBook(Long bookId);

	
	List<Rating> findAllRatingsByUser(Long userId);

}