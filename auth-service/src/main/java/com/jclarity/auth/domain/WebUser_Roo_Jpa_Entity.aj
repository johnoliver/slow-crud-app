// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.jclarity.auth.domain;

import com.jclarity.auth.domain.WebUser;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect WebUser_Roo_Jpa_Entity {
    
    declare @type: WebUser: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long WebUser.id;
    
    @Version
    @Column(name = "version")
    private Integer WebUser.version;
    
    public Long WebUser.getId() {
        return this.id;
    }
    
    public void WebUser.setId(Long id) {
        this.id = id;
    }
    
    public Integer WebUser.getVersion() {
        return this.version;
    }
    
    public void WebUser.setVersion(Integer version) {
        this.version = version;
    }
    
}