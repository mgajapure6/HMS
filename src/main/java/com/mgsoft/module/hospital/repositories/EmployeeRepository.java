package com.mgsoft.module.hospital.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.module.hospital.beans.Employee;

@Repository
public interface EmployeeRepository extends CrudRepository<Employee, Long>,JpaRepository<Employee, Long> {

	List<Employee> findAllByTypeId(long typeId);
	List<Employee> findAllByTypeName(String typeName);
}
