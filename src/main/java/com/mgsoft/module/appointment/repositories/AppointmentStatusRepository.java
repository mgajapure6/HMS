package com.mgsoft.module.appointment.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import com.mgsoft.module.appointment.beans.AppointmentStatus;

public interface AppointmentStatusRepository  extends JpaRepository<AppointmentStatus, Long>, CrudRepository<AppointmentStatus, Long> {

	
}
