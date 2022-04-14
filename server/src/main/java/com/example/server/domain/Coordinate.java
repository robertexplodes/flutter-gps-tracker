package com.example.server.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.sun.istack.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.Objects;

@Entity(name = "coordinates")
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Coordinate implements Comparable<Coordinate> {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private Long id;

    @Column(nullable = false)
    private Double latitude;

    @Column(nullable = false)
    private Double longitude;

    @Column(nullable = false)
    private LocalDateTime timestamp;

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

//    public double getDistance(Coordinate coordinate2) {
//        return Math.sqrt(Math.pow(coordinate2.getLatitude() - this.getLatitude(), 2) + Math.pow(coordinate2.getLongitude() - this.getLongitude(), 2));
//    }

    public double distance(Coordinate coordinate) {
        var lat1 = this.latitude;
        var lat2 = coordinate.latitude;
        var lon1 = this.longitude;
        var lon2 = coordinate.longitude;
        double theta = lon1 - lon2;
        double dist = Math.sin(Math.toRadians(lat1)) * Math.sin(Math.toRadians(lat2)) + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) * Math.cos(Math.toRadians(theta));
        dist = Math.acos(dist);
        dist = Math.toDegrees(dist);
        dist = dist * 60 * 1.1515;
        return dist * 1.609344;
    }

    @Override
    public int compareTo(@NotNull Coordinate o) {
        return Comparator.comparing(Coordinate::getTimestamp).compare(this, o);
    }
}
