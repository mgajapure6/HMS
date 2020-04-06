package com.mgsoft.module.doctor.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.module.doctor.beans.EmployeeType;

@Repository
public interface EmployeeTypeRepository extends CrudRepository<EmployeeType, Long>, JpaRepository<EmployeeType, Long>{

	List<EmployeeType> findAllByStatus(String status);
}
