<?xml version="1.0" encoding="ISO-8859-1"?>
	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" extension-element-prefixes="msxsl">
<xsl:output method="xml" indent ="yes"/>
<xsl:template match="/">
<xsl:variable name = "v_Lista">
<Arq>
	<xsl:for-each select = "zzz/Registro">
		<Reg> 
			<Data><xsl:value-of select="@period"/></Data>
		</Reg>
	</xsl:for-each>
</Arq>
</xsl:variable>
 <xsl:variable name ="ordena" select ="msxsl:node-set($v_Lista)"/>
 <Fl_caixa>
   <xsl:for-each select = "$ordena/Arq/Reg">    
      <xsl:copy-of select="."/>      
  </xsl:for-each>
 </Fl_caixa>  
</xsl:template> 
</xsl:stylesheet>  