## install.packages('dplyr')
## library('dplyr')
## install.packages('stringr')
## library('stringr')

## reads data
## datat <- read.csv("~/Desktop/info_201/final-project/Seattle_Police_Department_Police_Report_Incident.csv.bz2", header = TRUE)


## animal offense 
animal <- datat%>%
  filter(str_detect(Offense.Type, "^ANIMAL"))
## assault offense 
assault <- datat%>%
  filter(str_detect(Offense.Type, "^ASSLT"))
## burglary offense
burglary <- datat%>%
  filter(str_detect(Offense.Type, "^BURGLARY"))
## counterfeit offense 
counterfeit <- datat%>%
  filter(str_detect(Offense.Type, "^COUNTERFEIT"))
## dispute offense 
dispute <- datat%>%
  filter(str_detect(Offense.Type, "^DISPUTE"))
## disturbance offense 
disturbance <- datat%>%
  filter(str_detect(Offense.Type, "^DISTURBANCE"))
## dui offense 
dui <- datat%>%
  filter(str_detect(Offense.Type, "^DUI"))
## embezzle offense 
embezzle <- datat%>%
  filter(str_detect(Offense.Type, "^EMBEZZLE"))
## false report 
false_report <- datat%>%
  filter(str_detect(Offense.Type, "^FALSE REPORT"))
## forgery check offense 
forgery_check <- datat%>%
  filter(str_detect(Offense.Type, "^FORGERY-CHECK"))
## fraud offense
fraud <- datat%>%
  filter(str_detect(Offense.Type, "^FRAUD"))
## harassment offense
harassment <- datat%>%
  filter(str_detect(Offense.Type, "^HARASSMENT"))
## homicide offense
homicide <- datat%>%
  filter(str_detect(Offense.Type, "^HOMICIDE"))
## injury 
injury <- datat%>%
  filter(str_detect(Offense.Type, "^INJURY"))
## liquor law offense 
liquor_law <- datat%>%
  filter(str_detect(Offense.Type, "^LIQUOR LAW VIOLATION"))
## malicious harassment offense 
mal_harass <- datat%>%
  filter(str_detect(Offense.Type, "^MALICIOUS"))
## narcotics offense 
narcotics <- datat%>%
  filter(str_detect(Offense.Type, "^NARC"))
## obstruct offense 
obstruct <- datat%>%
  filter(str_detect(Offense.Type, "^OBSTRUCT"))
## property damage offense 
property_damage <- datat%>%
  filter(str_detect(Offense.Type, "^PROPERTY DAMAGE"))
## prostitution offense 
prostitution <- datat%>%
  filter(str_detect(Offense.Type, "^PROSTITUTION"))
## reckless burning offense 
reckless_burning <- datat%>%
  filter(str_detect(Offense.Type, "^RECKLESS BURNING"))
## robbery offense 
robbery <- datat%>%
  filter(str_detect(Offense.Type, "^ROBBERY"))
## theft offense 
theft <- datat%>%
  filter(str_detect(Offense.Type, "^THEFT"))
## threats offense 
threats <- datat%>%
  filter(str_detect(Offense.Type, "^THREATS"))
## vehicle theft 
vehicle_theft <- datat%>%
  filter(str_detect(Offense.Type, "^VEH-THEFT"))
## violation of court order 
viol_court <- datat%>%
  filter(str_detect(Offense.Type, "VIOL-COURT ORDER"))
## warrants
warrant <- datat%>%
  filter(str_detect(Offense.Type, "^WARRA"))
## weapon 
weapon <- datat%>%
  filter(str_detect(Offense.Type, "^WEAPON"))






