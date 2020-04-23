package com.mgsoft.module.appointment.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.mgsoft.module.appointment.beans.AppointmentHead;
import com.mgsoft.module.appointment.beans.AppointmentLine;

public interface AppointmentHeadRepository extends JpaRepository<AppointmentHead, Long>, CrudRepository<AppointmentHead, Long> {

	List<AppointmentLine> findAllByTrno(Long trno);

}
