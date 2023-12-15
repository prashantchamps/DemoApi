package com.example.demo.itinerary;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class itineraryController {
    @GetMapping("/itineraries")
    private String getAllItineraries()
    {
        return "Testing Application";
    }
}
