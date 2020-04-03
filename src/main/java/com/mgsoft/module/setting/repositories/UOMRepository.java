package com.mgsoft.module.setting.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.module.setting.beans.UOM;

@Repository
public interface UOMRepository extends CrudRepository<UOM, Long>, JpaRepository<UOM, Long> {
	
	List<UOM> findAllByStatus(String status);
}
