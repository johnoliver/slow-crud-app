// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.jclarity.had_one_dismissal.web;

import com.jclarity.had_one_dismissal.domain.Location;
import com.jclarity.had_one_dismissal.web.LocationController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect LocationController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String LocationController.create(@Valid Location location, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, location);
            return "locations/create";
        }
        uiModel.asMap().clear();
        location.persist();
        return "redirect:/locations/" + encodeUrlPathSegment(location.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String LocationController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Location());
        return "locations/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String LocationController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("location", Location.findLocation(id));
        uiModel.addAttribute("itemId", id);
        return "locations/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String LocationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("locations", Location.findLocationEntries(firstResult, sizeNo));
            float nrOfPages = (float) Location.countLocations() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("locations", Location.findAllLocations());
        }
        return "locations/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String LocationController.update(@Valid Location location, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, location);
            return "locations/update";
        }
        uiModel.asMap().clear();
        location.merge();
        return "redirect:/locations/" + encodeUrlPathSegment(location.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String LocationController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Location.findLocation(id));
        return "locations/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String LocationController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Location location = Location.findLocation(id);
        location.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/locations";
    }
    
    void LocationController.populateEditForm(Model uiModel, Location location) {
        uiModel.addAttribute("location", location);
        uiModel.addAttribute("locations", Location.findAllLocations());
    }
    
    String LocationController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
