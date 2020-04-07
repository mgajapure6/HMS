package com.mgsoft.module.contactBook.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.mgsoft.module.contactBook.beans.ContactBook;

public interface ContactBookRepository extends CrudRepository<ContactBook, Long>, JpaRepository<ContactBook, Long> {

}

