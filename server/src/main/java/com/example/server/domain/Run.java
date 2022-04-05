package com.example.server.domain;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

@Entity(name = "runs")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Run {
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private Long id;

    Double distance;

    Integer duration;

    @Column(nullable = false)
    LocalDate start;

    @Column(nullable = false)
    boolean finished;

    @JsonIgnore
    @OneToMany(mappedBy = "run", fetch = FetchType.LAZY)
    private List<Coordinate> coordinates;

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
