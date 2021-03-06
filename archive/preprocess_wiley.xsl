<?xml version="1.0" encoding="UTF-8"?>
<!-- Split Pubmed file with multiple articles to one article per file -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" 
    version="2.0">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" 
        doctype-public="-//NLM//DTD PubMed 2.5//EN"
        doctype-system="http://www.ncbi.nlm.nih.gov:80/entrez/query/static/PubMed.dtd"/>
    <xsl:preserve-space elements="Journal"/>
   
    
    <!-- Generates Valid XML documents for all Wiley content -->
  
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="Journal">
              <xsl:copy>  
                  <xsl:if test="not(PublisherName)">             
                      <PublisherName>John Wiley &amp; Sons, Ltd</PublisherName>
                  </xsl:if>
                <xsl:apply-templates select="node()"/>
            </xsl:copy>     
    </xsl:template>
 
    


</xsl:stylesheet>