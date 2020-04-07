package com.mgsoft.module.diagnostic.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.mgsoft.module.diagnostic.beans.TestGroup;

public interface TestGroupRepository extends CrudRepository<TestGroup, Long>, JpaRepository<TestGroup, Long> {

}
