package com.example.server.controller;

import com.example.server.domain.Coordinate;
import com.example.server.domain.Run;
import com.example.server.persistence.CoordinateRepository;
import com.example.server.persistence.RunRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/")
public class Controller {

    private final RunRepository runRepository;
    private final CoordinateRepository coordinateRepository;

    public Controller(RunRepository runRepository, CoordinateRepository coordinateRepository) {
        this.runRepository = runRepository;
        this.coordinateRepository = coordinateRepository;
    }

    @GetMapping("/runs")
    public List<Run> getRuns() {
        return runRepository.findAll();
    }

    @PostMapping("/runs")
    public Long postRun(@RequestBody Run run) {
        return runRepository.save(run).getId();
    }

    @PostMapping("/runs/{id}")
    public Long postCoordinate(@PathVariable(name = "id") Long id, @RequestBody Coordinate coordinate) {
        var run = runRepository.findById(id).orElseThrow(()-> new IllegalArgumentException("Run not found."));
        coordinate.setRun(run);
        return coordinateRepository.save(coordinate).getId();
    }

    @GetMapping("/runs/{id}")
    public List<Coordinate> getRunDetails(@PathVariable Long id) {
        var run = runRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Run not found."));
        return run.getCooridantes();
    }
}
