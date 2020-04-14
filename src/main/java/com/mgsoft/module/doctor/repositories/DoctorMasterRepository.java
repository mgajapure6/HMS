package com.mgsoft.module.doctor.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.module.doctor.beans.DoctorMaster;

@Repository
public interface DoctorMasterRepository extends CrudRepository<DoctorMaster, Long>, JpaRepository<DoctorMaster, Long> {

}
