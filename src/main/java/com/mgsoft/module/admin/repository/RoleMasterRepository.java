package com.mgsoft.module.admin.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.module.admin.beans.RoleMaster;

@Repository
public interface RoleMasterRepository extends CrudRepository<RoleMaster, Long>, JpaRepository<RoleMaster, Long> {
	
}
