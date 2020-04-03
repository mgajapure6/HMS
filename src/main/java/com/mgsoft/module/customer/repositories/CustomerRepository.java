package com.mgsoft.module.customer.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.module.customer.beans.Customer;

@Repository
public interface CustomerRepository extends CrudRepository<Customer, Long>, JpaRepository<Customer, Long> {

}
