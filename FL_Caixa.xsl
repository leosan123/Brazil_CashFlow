<?xml version="1.0" encoding="ISO-8859-1"?>
	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" extension-element-prefixes="msxsl">
<xsl:output method="xml" indent ="yes"/>
<xsl:template match="/">	
	<xsl:variable name = "v_initiation"><xsl:value-of select="<xbrl  xmlns='http://www.xbrl.org/2003/instance' xmlns:link = 'http://www.xbrl.org/2003/linkbase' xmlns:xlink = 'http://www.w3.org/1999/xlink'>"/></xsl:variable>
	<xsl:variable name = "v_declarations"><xsl:value-of select="<link:schemaRef xlink:type='simple' xlink:href='Regras_FL_Caixa.xsd'/> <unit id='U-Monetary'><measure>iso4217:USD</measure></unit>"/></xsl:variable>
<xsl:value-of select="$v_initiation"/>	
<!-- initialing xbrl -->
	
<!-- context tags 
   <context id='zzz'>
      <entity>
         <identifier scheme='http://www.zyw.com'>zyw</identifier>
      </entity>
      <period>
         <instant>2018-01-31</instant>
      </period>
   </context>
   <context id='yyy'>
      <entity>
         <identifier scheme='http://www.zop.com'>zop</identifier>
      </entity>
      <period>
         <instant>2018-02-03</instant>
      </period>
   </context>
-->
	
<xsl:value-of select="$v_declarations"/>
<!-- namespace, declarations, units -->
<DataRecords>
	<xsl:for-each select = "Arq/Registro">
		<xsl:variable name = "v_period"><xsl:value-of select="@period"/></xsl:variable>
		<xsl:for-each select = "Assunto">
			<xsl:variable name = "v_subject"><xsl:value-of select="strAssunto"/></xsl:variable>			
<Cash_Flow> 
<dtDate><xsl:value-of select="$v_period"/></dtDate>
<strSubject><xsl:value-of select="$v_subject"/></strSubject>
			<xsl:for-each select = "Fonte">
				<xsl:choose>
<xsl:when test="./intFonte = 1"><curOrigin1 unitRef='U-Monetary' decimals='INF'><xsl:value-of select="curValor"/></curOrigin1></xsl:when>
<xsl:when test="./intFonte = 2"><curOrigin2 unitRef='U-Monetary' decimals='INF'><xsl:value-of select="curValor"/></curOrigin2></xsl:when>
<xsl:when test="./intFonte = 3"><curOrigin3 unitRef='U-Monetary' decimals='INF'><xsl:value-of select="curValor"/></curOrigin3></xsl:when>
<xsl:when test="./intFonte = 5"><curOrigin5 unitRef='U-Monetary' decimals='INF'><xsl:value-of select="curValor"/></curOrigin5></xsl:when>
<xsl:when test="./intFonte = 6"><curOrigin6 unitRef='U-Monetary' decimals='INF'><xsl:value-of select="curValor"/></curOrigin6></xsl:when>
<xsl:when test="./intFonte = 7"><curOrigin7 unitRef='U-Monetary' decimals='INF'><xsl:value-of select="curValor"/></curOrigin7></xsl:when>
<xsl:otherwise></xsl:otherwise>
				</xsl:choose>	
			</xsl:for-each>
</Cash_Flow> 			
		</xsl:for-each>
	</xsl:for-each>
</DataRecords>
</xbrl>
</xsl:template> 
</xsl:stylesheet>  
