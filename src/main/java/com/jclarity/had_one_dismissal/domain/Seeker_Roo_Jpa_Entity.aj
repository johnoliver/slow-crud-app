// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.jclarity.had_one_dismissal.domain;

import com.jclarity.had_one_dismissal.domain.Seeker;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Seeker_Roo_Jpa_Entity {
    
    declare @type: Seeker: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Seeker.id;
    
    @Version
    @Column(name = "version")
    private Integer Seeker.version;
    
    public Long Seeker.getId() {
        return this.id;
    }
    
    public void Seeker.setId(Long id) {
        this.id = id;
    }
    
    public Integer Seeker.getVersion() {
        return this.version;
    }
    
    public void Seeker.setVersion(Integer version) {
        this.version = version;
    }
    
}
