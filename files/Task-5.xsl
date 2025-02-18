<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:key name="params" match="Param" use="@Name"/>

    <xsl:template match="/">
        <root>
            <xsl:for-each select="//Param[generate-id() = generate-id(key('params', @Name)[1])]">
                <xsl:for-each select="key('params', @Name)">
                <xsl:variable name="combined-name-pos" select="concat(@Name, @pos)"/>
                    <Param>
                        <xsl:attribute name="ID"><xsl:value-of select="@ID"/></xsl:attribute>
                        <xsl:attribute name="Name"><xsl:value-of select="$combined-name-pos"/></xsl:attribute>
                        <xsl:attribute name="pos"><xsl:value-of select="@pos"/></xsl:attribute>
                        <xsl:copy-of select="@*[name() != 'ID' and name() != 'Name' and name() != 'pos']"/>
                    </Param>
                </xsl:for-each>
            </xsl:for-each>
        </root>
    </xsl:template>
</xsl:stylesheet>
