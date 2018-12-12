<xsl:template match="book">
    <xsl:apply-templates select="front"/>
    <xsl:apply-templates select="body"/>
    <xsl:apply-templates select="back"/>
</xsl:template>