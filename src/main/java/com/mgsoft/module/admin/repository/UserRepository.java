package com.mgsoft.module.admin.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.module.admin.beans.UserMaster;

@Repository
public interface UserRepository extends CrudRepository<UserMaster, Long>, JpaRepository<UserMaster, Long> {
	UserMaster findByUserLoginNameAndUserLoginPassword(String loginName,String loginPassword);
}
