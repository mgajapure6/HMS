package com.mgsoft.module.admin.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.module.admin.beans.RoleRights;

@Repository
public interface RoleRightsRepository extends CrudRepository<RoleRights, Long>, JpaRepository<RoleRights, Long> {

}
