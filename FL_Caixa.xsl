<?xml version="1.0" encoding="ISO-8859-1"?>
	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" extension-element-prefixes="msxsl">
<xsl:output method="xml" indent ="yes"/>
<xsl:template match="/">	
	<xsl:variable name = "v_initiation"><xsl:value-of select="<xbrl  xmlns='http://www.xbrl.org/2003/instance' xmlns:link = 'http://www.xbrl.org/2003/linkbase' xmlns:xlink = 'http://www.w3.org/1999/xlink'>"/></xsl:variable>
	<xsl:variable name = "v_declarations"><xsl:value-of select="<link:schemaRef xlink:type='simple' xlink:href='Regras_FL_Caixa.xsd'/> <unit id='U-Monetary'><measure>iso4217:USD</measure></unit>"/></xsl:variable>
<xsl:value-of select="$v_initiation"/>
<!-- initialing xbrl -->
<xsl:value-of select="$v_declarations"/>
<!-- namespace, declarations, units -->
	<xsl:for-each select = "Arq/Registro">
		<xsl:variable name = "v_period"><xsl:value-of select="@period"/></xsl:variable>
		<xsl:for-each select = "Assunto">
			<xsl:variable name = "v_subject"><xsl:value-of select="strAssunto"/></xsl:variable>
			<xsl:for-each select = "Fonte">
<Cash_Flow> 
<dtDate><xsl:value-of select="$v_period"/></dtDate>
<strSubject><xsl:value-of select="$v_subject"/></strSubject>
<intOrigin><xsl:value-of select="intFonte"/></intOrigin>
<curValue unitRef='U-Monetary' decimals='INF'><xsl:value-of select="curValor"/></curValue>
</Cash_Flow> 
			</xsl:for-each>
		</xsl:for-each>
	</xsl:for-each>
 </Fl_caixa>  
</xbrl>
</xsl:template> 
</xsl:stylesheet>  
