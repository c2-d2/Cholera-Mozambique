<qgis version="2.18.20" simplifyAlgorithm="0" minimumScale="0" maximumScale="1e+08" simplifyDrawingHints="1" minLabelScale="0" maxLabelScale="1e+08" simplifyDrawingTol="1" readOnly="0" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" simplifyLocal="1" scaleBasedLabelVisibilityFlag="0">
<edittypes>
<edittype widgetv2type="TextEdit" name="hazard_id">
<widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
</edittype>
<edittype widgetv2type="TextEdit" name="hazard_class">
<widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
</edittype>
<edittype widgetv2type="TextEdit" name="aggregation_id">
<widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
</edittype>
<edittype widgetv2type="TextEdit" name="aggregation_name">
<widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
</edittype>
<edittype widgetv2type="TextEdit" name="population_exposure_count">
<widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
</edittype>
<edittype widgetv2type="TextEdit" name="size">
<widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
</edittype>
<edittype widgetv2type="TextEdit" name="affected">
<widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
</edittype>
<edittype widgetv2type="TextEdit" name="population_displacement_ratio">
<widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
</edittype>
<edittype widgetv2type="TextEdit" name="displaced">
<widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
</edittype>
</edittypes>
<renderer-v2 attr="hazard_class" forceraster="0" symbollevels="0" type="categorizedSymbol" enableorderby="0">
<categories>
<category render="true" symbol="0" value="wet" label="Wet (13,100)"/>
<category render="true" symbol="1" value="dry" label="Dry (0)"/>
</categories>
<symbols>
<symbol alpha="1" clip_to_extent="1" type="fill" name="0">
<layer pass="0" class="SimpleFill" locked="0">
<prop k="border_width_map_unit_scale" v="0,0,0,0,0,0"/>
<prop k="color" v="240,59,32,255"/>
<prop k="joinstyle" v="bevel"/>
<prop k="offset" v="0,0"/>
<prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
<prop k="offset_unit" v="MM"/>
<prop k="outline_color" v="0,0,0,255"/>
<prop k="outline_style" v="solid"/>
<prop k="outline_width" v="0.26"/>
<prop k="outline_width_unit" v="MM"/>
<prop k="style" v="solid"/>
</layer>
</symbol>
<symbol alpha="1" clip_to_extent="1" type="fill" name="1">
<layer pass="0" class="SimpleFill" locked="0">
<prop k="border_width_map_unit_scale" v="0,0,0,0,0,0"/>
<prop k="color" v="255,255,178,255"/>
<prop k="joinstyle" v="bevel"/>
<prop k="offset" v="0,0"/>
<prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
<prop k="offset_unit" v="MM"/>
<prop k="outline_color" v="0,0,0,255"/>
<prop k="outline_style" v="solid"/>
<prop k="outline_width" v="0.26"/>
<prop k="outline_width_unit" v="MM"/>
<prop k="style" v="solid"/>
</layer>
</symbol>
</symbols>
<rotation/>
<sizescale scalemethod="diameter"/>
</renderer-v2>
<labeling type="simple"/>
<customproperties/>
<blendMode>0</blendMode>
<featureBlendMode>0</featureBlendMode>
<layerTransparency>0</layerTransparency>
<displayfield>aggregation_name</displayfield>
<label>0</label>
<labelattributes>
<label fieldname="" text="Label"/>
<family fieldname="" name="Sans Serif"/>
<size fieldname="" units="pt" value="12"/>
<bold fieldname="" on="0"/>
<italic fieldname="" on="0"/>
<underline fieldname="" on="0"/>
<strikeout fieldname="" on="0"/>
<color fieldname="" red="0" blue="0" green="0"/>
<x fieldname=""/>
<y fieldname=""/>
<offset x="0" y="0" units="pt" yfieldname="" xfieldname=""/>
<angle fieldname="" value="0" auto="0"/>
<alignment fieldname="" value="center"/>
<buffercolor fieldname="" red="255" blue="255" green="255"/>
<buffersize fieldname="" units="pt" value="1"/>
<bufferenabled fieldname="" on=""/>
<multilineenabled fieldname="" on=""/>
<selectedonly on=""/>
</labelattributes>
<annotationform>.</annotationform>
<aliases>
<alias field="hazard_id" index="0" name=""/>
<alias field="hazard_class" index="1" name=""/>
<alias field="aggregation_id" index="2" name=""/>
<alias field="aggregation_name" index="3" name=""/>
<alias field="population_exposure_count" index="4" name=""/>
<alias field="size" index="5" name=""/>
<alias field="affected" index="6" name=""/>
<alias field="population_displacement_ratio" index="7" name=""/>
<alias field="displaced" index="8" name=""/>
</aliases>
<excludeAttributesWMS/>
<excludeAttributesWFS/>
<attributeactions default="-1"/>
<attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
<columns/>
</attributetableconfig>
<editform>.</editform>
<editforminit/>
<editforminitcodesource>0</editforminitcodesource>
<editforminitfilepath>.</editforminitfilepath>
<editforminitcode></editforminitcode>
<featformsuppress>0</featformsuppress>
<editorlayout>generatedlayout</editorlayout>
<widgets/>
<conditionalstyles>
<rowstyles/>
<fieldstyles>
<fieldstyle fieldname="hazard_class">
<style text_color_alpha="0" background_color_alpha="0" background_color="#000000" rule="hazard_class='wet'" name="wet" text_color="#000000">
<font description="Sans Serif,9,-1,5,50,0,0,0,0,0" style=""/>
<symbol alpha="1" clip_to_extent="1" type="marker" name="icon">
<layer pass="0" class="SimpleMarker" locked="0">
<prop k="angle" v="0"/>
<prop k="color" v="240,59,32,255"/>
<prop k="horizontal_anchor_point" v="1"/>
<prop k="joinstyle" v="bevel"/>
<prop k="name" v="circle"/>
<prop k="offset" v="0,0"/>
<prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
<prop k="offset_unit" v="MM"/>
<prop k="outline_color" v="0,0,0,255"/>
<prop k="outline_style" v="solid"/>
<prop k="outline_width" v="0"/>
<prop k="outline_width_map_unit_scale" v="0,0,0,0,0,0"/>
<prop k="outline_width_unit" v="MM"/>
<prop k="scale_method" v="diameter"/>
<prop k="size" v="3"/>
<prop k="size_map_unit_scale" v="0,0,0,0,0,0"/>
<prop k="size_unit" v="MM"/>
<prop k="vertical_anchor_point" v="1"/>
</layer>
</symbol>
</style>
<style text_color_alpha="0" background_color_alpha="0" background_color="#000000" rule="hazard_class='dry'" name="dry" text_color="#000000">
<font description="Sans Serif,9,-1,5,50,0,0,0,0,0" style=""/>
<symbol alpha="1" clip_to_extent="1" type="marker" name="icon">
<layer pass="0" class="SimpleMarker" locked="0">
<prop k="angle" v="0"/>
<prop k="color" v="255,255,178,255"/>
<prop k="horizontal_anchor_point" v="1"/>
<prop k="joinstyle" v="bevel"/>
<prop k="name" v="circle"/>
<prop k="offset" v="0,0"/>
<prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
<prop k="offset_unit" v="MM"/>
<prop k="outline_color" v="0,0,0,255"/>
<prop k="outline_style" v="solid"/>
<prop k="outline_width" v="0"/>
<prop k="outline_width_map_unit_scale" v="0,0,0,0,0,0"/>
<prop k="outline_width_unit" v="MM"/>
<prop k="scale_method" v="diameter"/>
<prop k="size" v="3"/>
<prop k="size_map_unit_scale" v="0,0,0,0,0,0"/>
<prop k="size_unit" v="MM"/>
<prop k="vertical_anchor_point" v="1"/>
</layer>
</symbol>
</style>
</fieldstyle>
</fieldstyles>
</conditionalstyles>
<defaults>
<default field="hazard_id" expression=""/>
<default field="hazard_class" expression=""/>
<default field="aggregation_id" expression=""/>
<default field="aggregation_name" expression=""/>
<default field="population_exposure_count" expression=""/>
<default field="size" expression=""/>
<default field="affected" expression=""/>
<default field="population_displacement_ratio" expression=""/>
<default field="displaced" expression=""/>
</defaults>
<previewExpression/>
<layerGeometryType>2</layerGeometryType>
</qgis>
