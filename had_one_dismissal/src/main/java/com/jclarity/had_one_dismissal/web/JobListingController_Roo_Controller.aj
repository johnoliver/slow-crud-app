// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.jclarity.had_one_dismissal.web;

import com.jclarity.had_one_dismissal.domain.Company;
import com.jclarity.had_one_dismissal.domain.JobListing;
import com.jclarity.had_one_dismissal.web.JobListingController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect JobListingController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String JobListingController.create(@Valid JobListing jobListing, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, jobListing);
            return "joblistings/create";
        }
        uiModel.asMap().clear();
        jobListing.persist();
        return "redirect:/joblistings/" + encodeUrlPathSegment(jobListing.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String JobListingController.createForm(Model uiModel) {
        populateEditForm(uiModel, new JobListing());
        return "joblistings/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String JobListingController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("joblisting", JobListing.findJobListing(id));
        uiModel.addAttribute("itemId", id);
        return "joblistings/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String JobListingController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("joblistings", JobListing.findJobListingEntries(firstResult, sizeNo));
            float nrOfPages = (float) JobListing.countJobListings() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("joblistings", JobListing.findAllJobListings());
        }
        addDateTimeFormatPatterns(uiModel);
        return "joblistings/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String JobListingController.update(@Valid JobListing jobListing, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, jobListing);
            return "joblistings/update";
        }
        uiModel.asMap().clear();
        jobListing.merge();
        return "redirect:/joblistings/" + encodeUrlPathSegment(jobListing.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String JobListingController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, JobListing.findJobListing(id));
        return "joblistings/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String JobListingController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        JobListing jobListing = JobListing.findJobListing(id);
        jobListing.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/joblistings";
    }
    
    void JobListingController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("jobListing_postedat_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void JobListingController.populateEditForm(Model uiModel, JobListing jobListing) {
        uiModel.addAttribute("jobListing", jobListing);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("companys", Company.findAllCompanys());
    }
    
    String JobListingController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}