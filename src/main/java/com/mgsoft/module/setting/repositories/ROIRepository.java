package com.mgsoft.module.setting.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.module.setting.beans.ROI;

@Repository
public interface ROIRepository extends CrudRepository<ROI, Long>, JpaRepository<ROI, Long> {
	
	List<ROI> findAllByStatus(String status);
}
