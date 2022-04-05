package com.example.server.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Objects;

@Entity(name="coordinates")
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Coordinate {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private Long id;

    @Column(nullable = false)
    private Double latitude;

    @Column(nullable = false)
    private Double longitude;

    @Setter
    @JsonIgnore
    @ManyToOne
    private Run run;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Coordinate that = (Coordinate) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    public double getDistance(Coordinate coordinate2) {
        return Math.sqrt(Math.pow(this.getLatitude() - coordinate2.getLatitude(), 2) + Math.pow(this.getLongitude() - coordinate2.getLongitude(), 2));
    }
}
