package com.example.server.persistence;

import com.example.server.domain.Run;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RunRepository extends JpaRepository<Run, Long> {

    List<Run> findAllByFinishedTrue();

}
