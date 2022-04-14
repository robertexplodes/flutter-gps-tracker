package com.example.server.controller;

import com.example.server.domain.Coordinate;
import com.example.server.domain.Run;
import com.example.server.persistence.CoordinateRepository;
import com.example.server.persistence.RunRepository;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
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
        return runRepository.findAllByFinishedTrue();
    }

    @PostMapping("/runs")
    public Long postRun(@RequestBody Run run) {
        return runRepository.save(run).getId();
    }

    @DeleteMapping("/runs/{id}")
    public void deleteRun(@PathVariable Long id) {
        var run = runRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Run not found."));
        runRepository.delete(run);
    }

    @PostMapping("/runs/finish/{id}")
    public void finishRun(@PathVariable(name = "id") Long id, @RequestBody Run newRun) {
        var run = runRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Run not found."));
        if(run.isFinished()) {
            throw new IllegalArgumentException("Run already finished.");
        }
        run.setDuration(newRun.getDuration());
        run.setDistance(calculateDistance(run));
        run.setFinished(true);
        runRepository.save(run);
    }

    private double calculateDistance(Run run) {
        double distance = 0;
        var coordinates = run.getCoordinates();
        for (int i = 1; i < coordinates.size(); i++) {
            var coordinate1 = coordinates.get(i - 1);
            var coordinate2 = coordinates.get(i);
            distance += coordinate1.distance(coordinate2);
        }
        return distance;
    }

    @PostMapping("/runs/{id}/coordinates")
    public Long postCoordinate(@PathVariable(name = "id") Long id, @RequestBody Coordinate coordinate) {
        var run = runRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Run not found."));
        if(run.isFinished()) {
            throw new IllegalArgumentException("Run already finished.");
        }
        coordinate.setRun(run);
        return coordinateRepository.save(coordinate).getId();
    }

    @GetMapping("/runs/{id}/coordinates")
    public List<Coordinate> getRunDetails(@PathVariable Long id) {
        var run = runRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Run not found."));
        var coordinates = run.getCoordinates();
        Collections.sort(coordinates);
        return coordinates;
    }
}
