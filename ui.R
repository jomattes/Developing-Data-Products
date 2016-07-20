library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Healthcare-Associated Infections"),
  sidebarPanel(
    selectInput("id1", "Select HAI Measure",
                c("HAI_1_SIR", "HAI_2_SIR", "HAI_3_SIR",
                  "HAI_4_SIR", "HAI_5_SIR", "HAI_6_SIR")),
    h5(HTML("<b> HAI_1_SIR: </b>"), "Central Line Associated Blood Stream Infections (CLABSI)"),
    h5(HTML("<b> HAI_2_SIR: </b>"), "Catheter Associated Urinary Tract Infections (CAUTI)"),
    h5(HTML("<b> HAI_3_SIR: </b>"), "Surgical Site Infections from colon surgery (SSI: Colon)"),
    h5(HTML("<b> HAI_4_SIR: </b>"), "Surgical Site Infections from abdominal hysterectomy (SSI:Hysterectomy)"),
    h5(HTML("<b> HAI_5_SIR: </b>"), "Methicillin-resistant Staphylococcus aureus (or MRSA) blood infections"),
    h5(HTML("<b> HAI_6_SIR: </b>"), "Clostridium difficile (or C.diff.) Infections (intestinal infections"),
    h6("Source: American Hospital Directory - Quality Definitions and Methodology - 
        July 18, 2016"),
    HTML("<br> <br>"),
    h5(HTML("<b> WHAT ARE HEALTHCARE-ASSOCIATED INFECTIONS? </b>")),
    h5("To receive payment from CMS, hospitals are required to report data about some infections to the 
       Centers for Disease Control and Prevention's (CDC's) National Healthcare Safety Network (NHSN). 
       The HAI measures show how often patients in a particular hospital contract certain infections 
       during the course of their medical treatment, when compared to like hospitals. HAI measures 
       provide information on infections that occur while the patient is in the hospital and include: 
       central line-associated bloodstream infections (CLABSI), catheter-associated urinary tract 
       infections (CAUTI), surgical site infection (SSI) from colon surgery or abdominal hysterectomy, 
       methicillin-resistant Staphylococcus Aureus (MRSA) blood laboratory-identified events 
       (bloodstream infections), and Clostridium difficile (C.diff.) laboratory-identified events 
       (intestinal infections). The HAI measures show how often patients in a particular hospital 
       contract certain infections during the couse of their medical treatment, when compared to like 
       hospitals. The CDC calculates a Standardized Infection Ratio (SIR) which may take into account 
       the type of patient care location, number of patients with an existing infection, laboratory 
       methods, hospital affiliation with a medical school, bed size of the hospital, patient age, and 
       classification of patient health. SIRs are calculated for the hospital, the state, and the nation.
       Hospitals' SIRs are compared to the national benchmark to determine if hospitals' performance on 
       these measures is better than the national benchmark (lower), no different than the national 
       benchmark, or worse than the national benchmark (higher). The HAI measures apply to all patients 
       treated in acute care hospitals, including adult, pediatric, neonatal, Medicare, and non-Medicare 
       patients."),
    h6("Source: CMS Hospital Compare")
  ),
  mainPanel(
    plotOutput('new_plot')
  )
))