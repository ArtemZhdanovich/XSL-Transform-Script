<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:key name="functions" match="Function" use="@Name"/>
    <xsl:key name="procedures" match="Procedure" use="@Name"/>

    <xsl:template match="/">
        <root>
            <Functions>
                <xsl:for-each select="//Function[generate-id() = generate-id(key('functions', @Name)[1])]">
                    <xsl:for-each select="key('functions', @Name)">
                        <xsl:copy-of select="."/>
                    </xsl:for-each>
                </xsl:for-each>
            </Functions>
            <Procedures>
                <xsl:for-each select="//Procedure[generate-id() = generate-id(key('procedures', @Name)[1])]">
                    <xsl:for-each select="key('procedures', @Name)">
                        <xsl:copy-of select="."/>
                    </xsl:for-each>
                </xsl:for-each>
            </Procedures>
        </root>
    </xsl:template>
</xsl:stylesheet>
