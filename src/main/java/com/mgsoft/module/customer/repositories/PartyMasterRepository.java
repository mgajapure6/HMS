package com.mgsoft.module.customer.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.module.customer.beans.PartyMaster;

@Repository
public interface PartyMasterRepository extends CrudRepository<PartyMaster, Long>, JpaRepository<PartyMaster, Long> {

}
