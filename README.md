# Modeling Cholera Risk for the Aftermath of Cyclone Kenneth and Cyclone Idai in Mozambique

We modeled cholera outbreak risk based on four measures:
1.	Gravity model simulating human mobility
2.	Previous cholera incidence
3.	Flooding risk index (based on measured flooding from Cyclone Idai and projected flooding for Cyclone Kenneth)
4.	El Niño sensitivity



**Flood risk index**

Cyclone Idai: The flooding index is based on the flood extent maps from [here](https://geonode.ingc.gov.mz/layers/geonode:hazard_aggregation_summary_13). This index is based on the proportion of area within each district that was affected by flooding following Cyclone Idai.
Cyclone Kenneth: We assumed Tropical Cyclone Kenneth would follow the trajectory described [here](https://reliefweb.int/sites/reliefweb.int/files/resources/ROSEA_20190424_SouthernAfrica_TCKenneth_FlashUpdate_final.pdf). and affect mainly the Cabo Delgado province. We assumed the impact would be highest in the districts closest to the storm trajectory (provided by NetHope on April 25th), with less impact in the districts further away (risk decays with distance). Only districts within the uncertainty zone were considered at risk.


**Previous Cholera Incidence**

This risk index is based on modeled annual cholera incidence, based on previous cholera outbreak data and ecological data, from [Lessler et al.](https://www.thelancet.com/journals/lancet/article/PIIS0140-6736(17)33050-7/)

**El Niño sensitivity**
This risk index is based on comparisons of cholera incidence between El Niño and non El Niño years, from [Moore et al.](https://www.pnas.org/content/114/17/4436/tab-figures-data) We only display sensitivity for districts that have higher incidence in El Niño years. 

**Gravity model**

the gravity (diffusion) model, we assume that travel from Beira occurs based on the population size of Beira, the population size of the receiving district and the geodesic distance between Beira and the receiving district.
Formula: (√population*√(origin_population))/distance (Similar results obtained using different exponents). The gravity model simulates human movement, in the absence of detailed mobility data, and has been used previously in epidemiological models (for example, in [Xia et al.](https://www.journals.uchicago.edu/doi/abs/10.1086/422341)).High resolution population data comes from [Facebook](https://data.humdata.org/dataset/highresolutionpopulationdensitymaps).

We scaled all risk scores to be between zero and one. The maps display each risk score separately, as well as an average of the scores when multiple indices are selected. 

Further detail about the analysis and interpretation of the maps can be found [here](https://www.directrelief.org/2019/04/if-cyclone-kenneth-leads-to-cholera-in-mozambique-who-is-most-at-risk/).

Interactive versions of all maps are also available [here](https://mahmud-ayesha.shinyapps.io/Cholera-MOZ/).

**Organization**
- `code` - Scripts and output for creating all maps
- `data` - Initial data resources
- `maps` - Risk maps for Cyclone Kenneth and Cyclone Idai
- `supplementary maps` - Additional maps 

![Main Figure](maps/Kenneth_incidence_flood_EN_map_ken.pdf "Main Figure")
*For Cyclone Kenneth, the projected risk is an average of the flooding index, El Niño sensitivity index and previous cholera incidence. 


