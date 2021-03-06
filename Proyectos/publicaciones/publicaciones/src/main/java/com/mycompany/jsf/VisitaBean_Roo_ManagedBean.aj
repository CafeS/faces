// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mycompany.jsf;

import com.mycompany.domain.Publicacion;
import com.mycompany.domain.Visita;
import com.mycompany.jsf.VisitaBean;
import com.mycompany.jsf.converter.PublicacionConverter;
import com.mycompany.service.PublicacionService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import javax.faces.convert.DateTimeConverter;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.calendar.Calendar;
import org.primefaces.component.message.Message;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect VisitaBean_Roo_ManagedBean {
    
    declare @type: VisitaBean: @ManagedBean(name = "visitaBean");
    
    declare @type: VisitaBean: @SessionScoped;
    
    @Autowired
    PublicacionService VisitaBean.publicacionService;
    
    private String VisitaBean.name = "Visitas";
    
    private Visita VisitaBean.visita;
    
    private List<Visita> VisitaBean.allVisitas;
    
    private boolean VisitaBean.dataVisible = false;
    
    private List<String> VisitaBean.columns;
    
    private HtmlPanelGrid VisitaBean.createPanelGrid;
    
    private HtmlPanelGrid VisitaBean.editPanelGrid;
    
    private HtmlPanelGrid VisitaBean.viewPanelGrid;
    
    private boolean VisitaBean.createDialogVisible = false;
    
    @PostConstruct
    public void VisitaBean.init() {
        columns = new ArrayList<String>();
        columns.add("fechaRegistro");
    }
    
    public String VisitaBean.getName() {
        return name;
    }
    
    public List<String> VisitaBean.getColumns() {
        return columns;
    }
    
    public List<Visita> VisitaBean.getAllVisitas() {
        return allVisitas;
    }
    
    public void VisitaBean.setAllVisitas(List<Visita> allVisitas) {
        this.allVisitas = allVisitas;
    }
    
    public String VisitaBean.findAllVisitas() {
        allVisitas = Visita.findAllVisitas();
        dataVisible = !allVisitas.isEmpty();
        return null;
    }
    
    public boolean VisitaBean.isDataVisible() {
        return dataVisible;
    }
    
    public void VisitaBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid VisitaBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void VisitaBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid VisitaBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void VisitaBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid VisitaBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void VisitaBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid VisitaBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText publicacionCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        publicacionCreateOutput.setId("publicacionCreateOutput");
        publicacionCreateOutput.setValue("Publicacion:   ");
        htmlPanelGrid.getChildren().add(publicacionCreateOutput);
        
        AutoComplete publicacionCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        publicacionCreateInput.setId("publicacionCreateInput");
        publicacionCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{visitaBean.visita.publicacion}", Publicacion.class));
        publicacionCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{visitaBean.completePublicacion}", List.class, new Class[] { String.class }));
        publicacionCreateInput.setDropdown(true);
        publicacionCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "publicacion", String.class));
        publicacionCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{publicacion.titulo} #{publicacion.descripcion} #{publicacion.tipo} #{publicacion.cantidad}", String.class));
        publicacionCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{publicacion}", Publicacion.class));
        publicacionCreateInput.setConverter(new PublicacionConverter());
        publicacionCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(publicacionCreateInput);
        
        Message publicacionCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        publicacionCreateInputMessage.setId("publicacionCreateInputMessage");
        publicacionCreateInputMessage.setFor("publicacionCreateInput");
        publicacionCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(publicacionCreateInputMessage);
        
        HtmlOutputText fechaRegistroCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        fechaRegistroCreateOutput.setId("fechaRegistroCreateOutput");
        fechaRegistroCreateOutput.setValue("Fecha Registro: * ");
        htmlPanelGrid.getChildren().add(fechaRegistroCreateOutput);
        
        Calendar fechaRegistroCreateInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        fechaRegistroCreateInput.setId("fechaRegistroCreateInput");
        fechaRegistroCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{visitaBean.visita.fechaRegistro}", Date.class));
        fechaRegistroCreateInput.setNavigator(true);
        fechaRegistroCreateInput.setEffect("slideDown");
        fechaRegistroCreateInput.setPattern("dd/MM/yyyy");
        fechaRegistroCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(fechaRegistroCreateInput);
        
        Message fechaRegistroCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        fechaRegistroCreateInputMessage.setId("fechaRegistroCreateInputMessage");
        fechaRegistroCreateInputMessage.setFor("fechaRegistroCreateInput");
        fechaRegistroCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(fechaRegistroCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid VisitaBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText publicacionEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        publicacionEditOutput.setId("publicacionEditOutput");
        publicacionEditOutput.setValue("Publicacion:   ");
        htmlPanelGrid.getChildren().add(publicacionEditOutput);
        
        AutoComplete publicacionEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        publicacionEditInput.setId("publicacionEditInput");
        publicacionEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{visitaBean.visita.publicacion}", Publicacion.class));
        publicacionEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{visitaBean.completePublicacion}", List.class, new Class[] { String.class }));
        publicacionEditInput.setDropdown(true);
        publicacionEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "publicacion", String.class));
        publicacionEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{publicacion.titulo} #{publicacion.descripcion} #{publicacion.tipo} #{publicacion.cantidad}", String.class));
        publicacionEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{publicacion}", Publicacion.class));
        publicacionEditInput.setConverter(new PublicacionConverter());
        publicacionEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(publicacionEditInput);
        
        Message publicacionEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        publicacionEditInputMessage.setId("publicacionEditInputMessage");
        publicacionEditInputMessage.setFor("publicacionEditInput");
        publicacionEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(publicacionEditInputMessage);
        
        HtmlOutputText fechaRegistroEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        fechaRegistroEditOutput.setId("fechaRegistroEditOutput");
        fechaRegistroEditOutput.setValue("Fecha Registro: * ");
        htmlPanelGrid.getChildren().add(fechaRegistroEditOutput);
        
        Calendar fechaRegistroEditInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        fechaRegistroEditInput.setId("fechaRegistroEditInput");
        fechaRegistroEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{visitaBean.visita.fechaRegistro}", Date.class));
        fechaRegistroEditInput.setNavigator(true);
        fechaRegistroEditInput.setEffect("slideDown");
        fechaRegistroEditInput.setPattern("dd/MM/yyyy");
        fechaRegistroEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(fechaRegistroEditInput);
        
        Message fechaRegistroEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        fechaRegistroEditInputMessage.setId("fechaRegistroEditInputMessage");
        fechaRegistroEditInputMessage.setFor("fechaRegistroEditInput");
        fechaRegistroEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(fechaRegistroEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid VisitaBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText publicacionLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        publicacionLabel.setId("publicacionLabel");
        publicacionLabel.setValue("Publicacion:   ");
        htmlPanelGrid.getChildren().add(publicacionLabel);
        
        HtmlOutputText publicacionValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        publicacionValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{visitaBean.visita.publicacion}", Publicacion.class));
        publicacionValue.setConverter(new PublicacionConverter());
        htmlPanelGrid.getChildren().add(publicacionValue);
        
        HtmlOutputText fechaRegistroLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        fechaRegistroLabel.setId("fechaRegistroLabel");
        fechaRegistroLabel.setValue("Fecha Registro:   ");
        htmlPanelGrid.getChildren().add(fechaRegistroLabel);
        
        HtmlOutputText fechaRegistroValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        fechaRegistroValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{visitaBean.visita.fechaRegistro}", Date.class));
        DateTimeConverter fechaRegistroValueConverter = (DateTimeConverter) application.createConverter(DateTimeConverter.CONVERTER_ID);
        fechaRegistroValueConverter.setPattern("dd/MM/yyyy");
        fechaRegistroValue.setConverter(fechaRegistroValueConverter);
        htmlPanelGrid.getChildren().add(fechaRegistroValue);
        
        return htmlPanelGrid;
    }
    
    public Visita VisitaBean.getVisita() {
        if (visita == null) {
            visita = new Visita();
        }
        return visita;
    }
    
    public void VisitaBean.setVisita(Visita visita) {
        this.visita = visita;
    }
    
    public List<Publicacion> VisitaBean.completePublicacion(String query) {
        List<Publicacion> suggestions = new ArrayList<Publicacion>();
        for (Publicacion publicacion : publicacionService.findAllPublicacions()) {
            String publicacionStr = String.valueOf(publicacion.getTitulo() +  " "  + publicacion.getDescripcion() +  " "  + publicacion.getTipo() +  " "  + publicacion.getCantidad());
            if (publicacionStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(publicacion);
            }
        }
        return suggestions;
    }
    
    public String VisitaBean.onEdit() {
        return null;
    }
    
    public boolean VisitaBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void VisitaBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String VisitaBean.displayList() {
        createDialogVisible = false;
        findAllVisitas();
        return "visita";
    }
    
    public String VisitaBean.displayCreateDialog() {
        visita = new Visita();
        createDialogVisible = true;
        return "visita";
    }
    
    public String VisitaBean.persist() {
        String message = "";
        if (visita.getCodigo() != null) {
            visita.merge();
            message = "Successfully updated";
        } else {
            visita.persist();
            message = "Successfully created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialog.hide()");
        context.execute("editDialog.hide()");
        
        FacesMessage facesMessage = new FacesMessage(message);
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllVisitas();
    }
    
    public String VisitaBean.delete() {
        visita.remove();
        FacesMessage facesMessage = new FacesMessage("Successfully deleted");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllVisitas();
    }
    
    public void VisitaBean.reset() {
        visita = null;
        createDialogVisible = false;
    }
    
    public void VisitaBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
