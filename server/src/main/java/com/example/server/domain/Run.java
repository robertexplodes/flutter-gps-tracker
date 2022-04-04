package com.example.server.domain;


import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

@Entity(name = "runs")
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Run {
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private Long id;

    @Column(nullable = false)
    Double distance;

    @Column(nullable = false)
    Integer duration;

    @Column(nullable = false)
    LocalDate start;

    @JsonIgnore
    @OneToMany(mappedBy = "run", fetch = FetchType.LAZY)
    private List<Coordinate> cooridantes;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Run run = (Run) o;
        return Objects.equals(id, run.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
