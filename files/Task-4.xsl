<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:key name="objects-by-id" match="Object" use="@ID"/>

    <xsl:template match="/">
        <Objects>
            <xsl:for-each select="//Object[@ID mod 2 = 0]">
                <xsl:sort select="@ID" data-type="number" order="ascending"/>
                <xsl:copy-of select="."/>
            </xsl:for-each>
        </Objects>
    </xsl:template>
</xsl:stylesheet>
