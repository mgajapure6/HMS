package com.mgsoft.module.diagnostic.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.mgsoft.module.diagnostic.beans.TestMaster;

public interface TestMasterRepository extends CrudRepository<TestMaster, Long>, JpaRepository<TestMaster, Long> {

}
