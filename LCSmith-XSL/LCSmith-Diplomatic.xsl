<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b>Jul 24, 2012</xd:p>
            <xd:p><xd:b>Author:</xd:b>H. Lewis Ulman</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Declare variables that will "localize" references to them in Stephens-Common.xsl -->
    
    <xsl:variable name="View">Diplomatic Transcription</xsl:variable>
    <xsl:variable name="aboutView">This diplomatic transcription of the Stephens letters is
        organized by manuscript pages. Line breaks and page breaks reflect those in the letters;
        paragraph breaks are not reported. Spelling, punctuation, capitalization, and abbreviations
        are reported as they appear in the original letters. Text highlighted by correspondents with
        an underscore is underscored in this view. Recoverable cancellations are reported in red,
        strikethrough text. Interlinear additions are reported between arrows (↑ ↓) indicating the
        position of the addition; text added in the margins is reported between pipes (|). All
        material added by the editors is surrounded by square brackets: uncertain readings are
        followed by a question mark, apparent errors in the manuscript are indicated by "sic," and
        text supplied by the editors for clarity is set in italics. Gaps in the manuscript (e.g.,
        tears, unrecoverable cancellations) are noted by ellipses within square brackets. Links to
        explanatory notes are indicated by superscript colored numbers.</xsl:variable>
    <xsl:variable name="bodyRule">
        body {
        background-position: top;
        margin-left: 50px;
        width: 850px;
        margin-right: 50px;
        font-family: Verdana, Arial, Helvetica, sans-serif;
        }                                     
    </xsl:variable>    
    
    <!-- Include common style sheet for Smith diaries. -->
    
    <xsl:include href="LCSmith-Common.xsl"/>
    
    <!-- Define templates required for the diplomatic view. -->
    
    <xsl:template match="tei:pb">
        <hr/>
        <br/>
        <span class="pagebreak">[Page&#xA0;-&#xA0;<xsl:number count="tei:pb" format="1" level="any"/>
            &#xA0;(<a><xsl:attribute
                name="HREF">http://people.cohums.ohio-state.edu/ulman1/LCSmithDiaries/LCSmithZoom.cfm?file=<xsl:value-of
                select="@facs"/>.jpg</xsl:attribute>
            <xsl:attribute name="target">top</xsl:attribute>click to open page image in a new window</a>)]</span>
        <br/>
    </xsl:template>    
    <xsl:template match="tei:lb">
        <br/>
        <a>
            <xsl:attribute name="name">
                <xsl:number count="tei:lb" format="0001" level="any" from="tei:div[@type='letter']"/>
            </xsl:attribute>
        </a>
        <xsl:number count="tei:lb" format="0001" level="any" from="tei:div[@type='letter']"/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
    </xsl:template>
    <xsl:template match="tei:fileDesc/tei:titleStmt/tei:title/tei:lb">
        <br/><xsl:apply-templates/>
    </xsl:template>   
    <xsl:template match="tei:seg[@type='softhyphen']">
        <xsl:apply-templates/>
    </xsl:template>    
    <xsl:template match="tei:p"><xsl:apply-templates/></xsl:template>
    <xsl:template match="tei:choice/tei:sic">
        <xsl:apply-templates/> [sic] </xsl:template>
    <xsl:template match="tei:choice/tei:corr"/>
    <xsl:template match="tei:figure[@rend='embed']"/>
    
    
</xsl:stylesheet>