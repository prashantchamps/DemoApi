package com.example.demo.itinerary;

import com.example.demo.Repo.EmployeeRepository;
import com.example.demo.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class itineraryController {
    @Autowired
    EmployeeRepository repo;

    @GetMapping("/employees")
    public Iterable<Employee> findAllEmployees() {
        return this.repo.findAll();
    }

    /*@PostMapping("/employees")
    public Employee addOneEmployee(@RequestBody Employee employee) {
        return this.employeeRepository.save(employee);
    }*/
}
