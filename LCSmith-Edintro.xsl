<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
   <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Jul 24, 2012</xd:p>
         <xd:p><xd:b>Author:</xd:b>H. Lewis Ulman</xd:p>
         <xd:p></xd:p>
      </xd:desc>
   </xd:doc>
      
 <!-- VARIABLE CSS RULES -->
      
   <xsl:variable name="bodyRule">
      body {
      font-family: 'Fanwood Text',georgia, serif;
      font-size: 1em;
      width: 800px;
      margin-left: 50px;
      margin-right: 50px;
      margin-top: 100px;
      }
   </xsl:variable>
   <xsl:variable name="navBarRule">
      #navBar {
      position: fixed;
      top: 120px;
      float : left;
      text-align : left;
      margin-left: 10px;
      margin-top:0px;
      background-color: rgba(255, 255, 255, 1);
      }
      #viewMenu {
      position: fixed;
      top:120px;
      left: 865px;
      width:150px;
      margin-top: 0px;
      }     
   </xsl:variable>
   <xsl:variable name="maintextRule">
      #maintext {
      float:right;
      width:610px;
      margin-top:35px;
      margin-left:20px;
      padding:5px;
      background-color: rgba(209,209,209, 0.5);
      -webkit-border-radius: 10px;
      -moz-border-radius: 10 px;
      border-radius: 10px;	
      }
   </xsl:variable>
      
   <!-- 
   
   HTML WRAPPER: Note that this section (between the xsl:template tags) 
   places the entire contents enclosed within the TEI Header into 
   the body element of the HTML page. 
   
   -->
   <xsl:template match="/">
      <html>
         <head>
            <!-- Populate meta element with keywords -->
            <xsl:element name="meta">
               <xsl:attribute name="name">keywords</xsl:attribute>
               <xsl:attribute name="content">
                  <xsl:for-each select="//tei:keywords[@scheme='#LCSH']/tei:term">
                     <xsl:choose>
                        <xsl:when test="current()=//tei:keywords[@scheme='#LCSH']/tei:term[1]">
                           <xsl:apply-templates/>
                        </xsl:when>
                        <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
                     </xsl:choose>
                  </xsl:for-each>
               </xsl:attribute>
            </xsl:element>
            <title>
               <xsl:value-of
                  select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
            </title>
            
            <!-- LOCAL JS CALLS -->
            <link rel="stylesheet" href="jquery-ui.css"/>
            <link href="LCSmithDiariesCSS.css" rel="stylesheet" type="text/css" />
            <script src="jquery-1.8.3.min.js"/>
            <script src="jquery-ui-1.9.2.custom.js"/>
                        
            <!-- CALL VARIABLES -->  
            <style type="text/css">
               <xsl:value-of select="$maintextRule"/>
               <xsl:value-of select="$navBarRule"/>
               <xsl:value-of select="$bodyRule"/>
            </style>
            
            <!-- DECLARE FONTS-->
            <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'/>
            <link href='http://fonts.googleapis.com/css?family=Fanwood+Text' rel='stylesheet' type='text/css'/>
            
         </head>
         
         <!-- BUILD THE BODY OF THE HTML PAGE -->
         
         <body>
            
            <!-- BUILD THE MENUBAR -->
            
            <div class="masthead">
               <div id="navigation">
                  <ul class="nav">
                     <li class="link"><a class="main"  href="./lcsmith-diaries.html#introduction">Editorial Introduction</a>
                        <ul class="sub">
                           <li><a href="./lcsmith-diaries.html#source">The Source Document</a></li>
                           <li><a href="./lcsmith-diaries.html#edition">The Electronic Edition</a></li>
                           <li><a href="./lcsmith-diaries.html#peopleMentioned">People Mentioned</a></li>
                           <li><a href="./lcsmith-diaries.html#placesMentioned">Places Mentioned</a></li>
                           <li><a href="./lcsmith-diaries.html#organizationsMentioned">Organizations Mentioned</a></li>
                           <li><a href="./lcsmith-diaries.html#worksCited">Works Cited</a></li>
                           <li><a href="./lcsmith-diaries.html#revHistory">Revision History</a></li>
                           <li><a href="./lcsmith-diaries.html#view">About the Introduction</a></li>
                        </ul>
                     </li>
                     <li class="link"><a class="main"  href="">Historical Introduction</a>
                        <ul class="sub">
                           <li><a href="./lcsmith-diaries.html#family">Family Dynamics</a></li>
                           <li><a href="./lcsmith-diaries.html#milling">Mill Operations</a></li>
                           <li><a href="./lcsmith-diaries.html#sorghum">Sorghum Farming</a></li>
                           <li><a href="./lcsmith-diaries.html#civilWar">Civil War and Civic Life</a></li>
                           <li><a href="./lcsmith-diaries.html#borders">Borderlands/Hinterlands</a></li>
                        </ul>
                     </li>
                     <li class="link"><a class="main"  href="">Views of the Diary</a>
                        <ul class="sub">
                           <li><a href="./lcsmith-by-entry.html">By Diary Entry</a></li>
                           <li><a href="./lcsmith-by-ms-page.html">By MS Page</a></li>
                           <li><a href="./lcsmith-combined.html">Facsimile/Text</a></li>
                        </ul>
                     </li>
                     <li class="link"><a class="main"  href="./lcsmith-diaries.html#appendices">Appendices</a>
                        <ul class="sub">
                           <li><a href="./lcsmith-diaries.html#projectDescription">Project Description</a></li>
                           <li><a href="./LCSmithMarkup.html">Markup Guidelines</a></li>
                           <li><a href="./LCSmithHands.html">Guide to Smith's Hand</a></li>
                           <li><a href="./LCSmithAcknowledgements.html">Acknowledgements</a></li>
                           <li><a href="./LCSmithAboutEditors.html">About the Editors</a></li>
                           <li><a href="./LCSmith_ZoomIndex.html">Images of the MS Pages</a></li>
                           <li><a href="./LCSmithMaps.html">Map</a></li>
                        </ul>
                     </li>
                     <li class="link"><a class="main"  href="">Source Files</a>
                        <ul class="sub">
                           <li><a href="./LCSmith-Diaries.xml">TEI: Source Markup</a></li>
                           <li><a href="./LCSmith-Common.xsl">XSL: Base Stylesheet</a></li>
                           <li><a href="./LCSmith-Diplomatic.xsl">XSL: MS Page View</a></li>
                           <li><a href="./LCSmith-Reading.xsl">XSL: Entry View</a></li>
                           <li><a href="./LCSmith-CombinedView.xsl">XSL: Text/Facs View</a></li>
                           <li><a href="./LCSmith-Edintro.xsl">XSL: Ed. Intro</a></li>
                           <li><a href="./LCSmith-Current.odd">ODD: TEI Customization</a></li>
                           <li><a href="./LCSmith-Current.rng">RNG: Schema</a></li>
                        </ul>
                     </li>
                  </ul> <!-- End ul class nav -->
               </div> <!-- End div id navigation -->
               
               <div id="titleBar">
               <p align="center"><span class="projectTitle">Selected Entries from the Lucius Clark Smith Diaries,<br/>
                  30 July 1862 to 31 December 1862</span></p>
               <hr/>
            </div> <!-- END titleBar -->
            </div> <!-- END masthead -->
       
            <!-- BUILD THE VERTICAL IMAGE BAR -->
       
            <div id="navBar">
               <div id="display1"><img src="image-LCSmith-daguerreotype.jpg" width="150" title="Portrait of Lucius Clark Smith, 1858 (Age 23)"/></div>
               <div id="display2"><img src="image-archibaldsmithhouse.jpg" width="150" title="Photograph of Smith Homestead"/></div>
               <div id="display3"><img src="image-archibald-maryannsmith.jpg" width="150" title="Portraits of Lucius Smith's parents, Archibald and MaryAnn"/></div>
               <div id="display4"><img src="image-horse-power-canemill-1857.jpg" width="150" title="Drawing of a sorghum mill"/></div>
               <div id="display5"><img src="image-warmeeting-18620815.jpg" width="150" title="Notice in Newark Advocate for 15 August 1862 of a war meeting."/></div>
            </div> <!-- END div navBar (now images; need to fix) -->

            <div id="viewMenu">
               <div class="container">
                  <p class="font-size-label">Font Size <button id="up">+</button> <button id="down">-</button></p>
                  <!--<p id="font-size"></p>-->
               </div>
            </div>
              
   <xsl:element name="div">
   <xsl:attribute name="id">maintext</xsl:attribute>
      
            <!-- Order and apply templates for the sections of the header you wish to include. -->
      
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='introductory']"/>
            <xsl:apply-templates
               select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='descriptive']"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:projectDesc"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:editorialDecl"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:refsDecl"/>
            <hr/>
            <h2 id="worksCited">List of Works Cited</h2>
            <xsl:apply-templates
               select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listBibl"/>
            <hr/>
            <h2>Appendices</h2>            
            <xsl:apply-templates
               select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listOrg"></xsl:apply-templates>
            <xsl:apply-templates
               select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listEvent"></xsl:apply-templates>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:revisionDesc"/>
            <hr/>
            <h2>About this Editorial Introduction</h2>
            <p><a name="view"/>Text on this page is derived from the
               edition's XML source document, LCSmith-Diaries.xml.</p>
            <hr/>
      <p>&#x2192; <a href="./lcsmith-by-entry.html">Link to the text of the journal</a>.
            </p>
   </xsl:element> <!-- END maintext -->
            <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
            <script src="index.js"></script>
         </body>

         <!-- Change text size script here?? -->         

      </html>
   </xsl:template>
   
   <!-- Format the introductory notes. -->
      
   <xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='introductory']">
      <h2 id="introduction">Introduction</h2>
      <xsl:apply-templates/>
   </xsl:template>
   
   <!-- Format information about the source document. -->
      
   <xsl:template
      match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='descriptive']">
      <hr/>
      <h2 id="source">About the Source Documents</h2>
      <p><strong>Title</strong>: "<xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:title"/>" 
         <br/><strong>Extent</strong>: <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:extent"/>
      </p>
         <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:refsDecl">
      <h3>Encoding Conventions</h3>
      <xsl:apply-templates/>
      <p align="left">
         <xsl:value-of
            select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:p[@xml:id='CreativeCommons']"
            disable-output-escaping="yes"/>
      </p>      
   </xsl:template>
   
   <xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability">
      <p>
         <em>
            <xsl:apply-templates/>
         </em>
      </p>
      <p>
         <em>
            <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:pubPlace"/>, <xsl:value-of
               select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/>.
         </em>
      </p>
   </xsl:template>

   <!-- Format information about the electronic document. -->
      
   <xsl:template match="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:projectDesc">
      <a name="projectDescription"></a><h3>Project Description</h3>
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   <xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt">
      <hr/>
      <h2 id="edition">About the Electronic Edition</h2>
      <p><strong>Title</strong>: <xsl:value-of select="tei:title"/></p>
         <p><strong>Editors</strong>: <xsl:for-each select="tei:editor">
            <xsl:choose>
               <xsl:when test="current()=//tei:editor[1]">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>.</p>
      <xsl:for-each select="tei:respStmt">
         <p>
      <strong><xsl:value-of select="tei:resp"/></strong>
      <xsl:for-each select="tei:persName">
            <xsl:choose>
               <xsl:when test="current()=//tei:respStmt/tei:persName[1]">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>.
         </p>
      </xsl:for-each>
   </xsl:template>
   
   <xsl:template match="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:editorialDecl">
      <h3>Editorial Method</h3>
      <xsl:apply-templates/>
   </xsl:template>
   
   <!-- SORTING AND FORMATTING LISTS OF WORKS CITED, PLACES, ORGANIZATIONS, AND SO ON. -->
   
   <xsl:template match="tei:listBibl">
      <xsl:for-each select="tei:bibl">
         <xsl:sort select="@n"/>
         <p class="hang25"><a>
            <xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute></a>
            <xsl:apply-templates/></p>
      </xsl:for-each>
   </xsl:template>
   
   <xsl:template match="tei:listPerson[@type='mentioned']">
      <h3 id="peopleMentioned">List of People Mentioned in Lucius Smith's Diary</h3>
      <xsl:for-each select="tei:person">
         <xsl:sort select="tei:persName[1]"/>
         <p>
            <strong><xsl:value-of select="tei:persName"/></strong>
            <xsl:if test="tei:birth or tei:death">
               <xsl:choose>
                  <xsl:when test="tei:birth[@notAfter]"> (b. not before <xsl:value-of select="tei:birth/@notAfter"/></xsl:when>
                  <xsl:when test="tei:birth[@when]"> (b. <xsl:value-of select="tei:birth/@when"/></xsl:when>
                  <xsl:otherwise> (</xsl:otherwise></xsl:choose>
               <xsl:choose>
                  <xsl:when test="not(tei:birth)"></xsl:when>
                  <xsl:when test="not(tei:death)"></xsl:when>
                  <xsl:otherwise>; </xsl:otherwise>
               </xsl:choose>
               <xsl:choose>
                  <xsl:when test="tei:death[@notBefore]">d. not before <xsl:value-of select="tei:death/@notBefore"/></xsl:when>
                  <xsl:when test="tei:death[@when]">d. <xsl:value-of select="tei:death/@when"/></xsl:when>
                  <xsl:otherwise></xsl:otherwise></xsl:choose>)</xsl:if>.
          <xsl:apply-templates select="tei:note[@type='biographical']"/>
         </p>
      </xsl:for-each>
   </xsl:template>
   
   <xsl:template match="tei:listOrg">
      <h3 id="organizationsMentioned">List of Organizations Mentioned in Lucius Smith's Diary</h3>
      <xsl:for-each select="tei:org">
         <xsl:sort select="tei:orgName[1]"/>
         <p>
            <strong><xsl:value-of select="tei:orgName"/></strong>:
            <xsl:apply-templates select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>
   
   <xsl:template match="tei:listPerson[@type='editors']"/>
   
   <xsl:template match="tei:listPlace">
      <h3 id="placesMentioned">List of Places Mentioned in Lucius Smith's Diary</h3>
      <xsl:for-each select="tei:place">
         <xsl:sort select="tei:geogName"/>
         <xsl:sort select="tei:placeName[1]"/>
         <p>
            <xsl:if test="tei:geogName[1]"><strong><xsl:value-of select="tei:geogName[1]"/></strong></xsl:if>
            <xsl:if test="tei:geogName[2]"> (<xsl:value-of select="tei:geogName[2]"/>)</xsl:if>
            <xsl:if test="tei:placeName[1]"><strong><xsl:value-of select="tei:placeName[1]"/></strong></xsl:if>
            <xsl:if test="tei:placeName[2]"> (<xsl:value-of select="tei:placeName[2]"/>)</xsl:if>.
            <xsl:value-of select="tei:country"/> 
            <xsl:if test="tei:region">; <xsl:value-of select="tei:region"/></xsl:if>
            <xsl:if test="tei:location/tei:geo"> (Lat/Long: 
               <xsl:value-of select="tei:location/tei:geo"/>)</xsl:if>. 
            <xsl:value-of select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>

   <xsl:template match="tei:listEvent">
      <h3 id="OrganizationsMentioned">List of Notable Events Mentioned in Lucius Smith's Diary</h3>
      <xsl:for-each select="tei:event">
         <xsl:sort select="tei:event[1]/@when"/>
         <p>
            <strong><xsl:value-of select="tei:label"/></strong>:
            <xsl:apply-templates select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>

   <!-- Format information about the revision history of the document. -->
      
   <xsl:template match="tei:TEI/tei:teiHeader/tei:revisionDesc">
         <hr/>
         <a name="revHistory"/>
         <h2 id="revision">Revision History</h2>
      <table width="90%" cellpadding="5px">
         <tr>
            <td>
               <h3>Date</h3>
            </td>
            <td>
               <h3>Name</h3>
            </td>
            <td>
               <h3>Change</h3>
            </td>
         </tr>
         <xsl:for-each select="tei:change">
            <xsl:variable name="ID"><xsl:value-of select="@who"/></xsl:variable>
            <tr class="revTable" valign="top">
               <td nowrap="nowrap">
                  <xsl:value-of select="@when"/>
               </td>
               <td nowrap="nowrap">
                  <xsl:value-of select="//tei:listPerson[@type='editors']/tei:person[@xml:id=$ID]/tei:persName"></xsl:value-of>
               </td>
               <td>
                  <xsl:value-of select="text()"/>
               </td>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template>

   <!-- Format miscellaneous elements -->
      
   <xsl:template match="tei:lb"><br/></xsl:template>
   <xsl:template match="tei:fileDesc/tei:titleStmt/tei:title/tei:lb">
      <br/><xsl:apply-templates/>
   </xsl:template>   
   <xsl:template match="tei:p[@rend='h3']">
      <xsl:element name="h3">
         <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="//tei:p[not(@xml:id='CreativeCommons') and not(@rend='h3')]">
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   <xsl:template match="tei:q[@rend='block']">
      <br/>
      <br/>
      <div class="blockquote">
         <xsl:apply-templates/>
         <br/>
         <br/>
      </div>
   </xsl:template>
   <xsl:template match="tei:quote[@rend='blockquote']">
      <br/>
      <div class="blockquote">
         <xsl:apply-templates/>
         <br/>
      </div>
   </xsl:template>
   <xsl:template match="tei:quote[@rend='epigraph']">
      <div class="epigraph">
         <xsl:apply-templates/>
         <br/>
      </div>
   </xsl:template>
   <xsl:template match="tei:name">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:name[@type='ship']">
      <i><xsl:apply-templates/></i>
   </xsl:template>
   <xsl:template match="tei:foreign">
      <i>
         <xsl:apply-templates/>
      </i>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='bold']">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='italics']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>
   <xsl:template match="tei:emph[@rend='bold']">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="emph[@rend='italics']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='italic']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='underline']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   <xsl:template match="emph[@rend='sup']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>
   <xsl:template match="tei:q">
      "<xsl:apply-templates/>"
   </xsl:template>
   <xsl:template match="//tei:note[@type='introductory' or 'biographical']//tei:bibl">(<xsl:apply-templates/>)</xsl:template>
   <xsl:template match="tei:title[@level='a']">"<xsl:apply-templates/>"</xsl:template>
   <xsl:template match="tei:title[@level='m']"><cite><xsl:apply-templates/></cite></xsl:template>
   <xsl:template match="tei:title[@level='j']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>   
   <xsl:template match="tei:date"/>

   <!-- LINK OR EMBED IMAGES AND OTHER NON-TEXTUAL MATERIALS -->
      
   <xsl:template match="tei:figure[@rend='link']"> 
      <a>
         <xsl:attribute name="HREF">
            <xsl:value-of select="tei:graphic/@url"/>
         </xsl:attribute>
         <xsl:attribute name="alt">
            <xsl:value-of select="tei:figDesc"/>
         </xsl:attribute>
         <xsl:attribute name="target">blank</xsl:attribute>
         <xsl:value-of select="tei:head"/>
      </a></xsl:template>
   <xsl:template match="tei:figure[@rend='embed']">
      <div class="fl_img_right">
         <img>
            <xsl:attribute name="src">
               <xsl:value-of select="tei:graphic/@url"/>
            </xsl:attribute>
            <xsl:attribute name="alt">
               <xsl:value-of select="tei:figDesc"/>
            </xsl:attribute>
            <xsl:if test="@n">
               <xsl:attribute name="width">
                  <xsl:value-of select="@n"/>
               </xsl:attribute>
            </xsl:if>
         </img>
         <br/>
         <xsl:value-of select="tei:head"/>
      </div>
   </xsl:template> 
  
   <!-- Suppress some unused elements in the XML file. -->
      
   <xsl:template match="tei:text"/>
   <xsl:template match="tei:editor"/>
   <xsl:template match="tei:principal"/>
   <xsl:template match="tei:editionStmt"/>
   <xsl:template match="tei:extent"/>
   <xsl:template match="tei:encodingDesc"/>
   <xsl:template match="tei:profileDesc"/>
   <xsl:template match="tei:idno"/>
   <xsl:template match="tei:publisher"/>
   <xsl:template match="tei:pubPlace"/>
   <xsl:template match="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:p[@xml:id='CreativeCommons']"/>
</xsl:stylesheet>
