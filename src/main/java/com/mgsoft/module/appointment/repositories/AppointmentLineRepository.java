package com.mgsoft.module.appointment.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.mgsoft.module.appointment.beans.AppointmentLine;

public interface AppointmentLineRepository extends JpaRepository<AppointmentLine, Long>, CrudRepository<AppointmentLine, Long> {

	List<AppointmentLine> findAllByLineTrno(Long trno);

}
