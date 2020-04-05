package com.mgsoft.module.patient.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.mgsoft.module.patient.beans.PatientMaster;

public interface PatientMasterRepository
		extends CrudRepository<PatientMaster, Long>, JpaRepository<PatientMaster, Long> {

}
