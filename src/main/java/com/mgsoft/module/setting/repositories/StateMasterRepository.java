package com.mgsoft.module.setting.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.module.setting.beans.StateMaster;

@Repository
public interface StateMasterRepository extends CrudRepository<StateMaster, Long>, JpaRepository<StateMaster, Long> {

}
