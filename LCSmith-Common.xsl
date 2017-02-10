<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
   <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Jul 24, 2012</xd:p>
         <xd:p><xd:b>Author:</xd:b>H. Lewis Ulman</xd:p>
         <xd:p/>
      </xd:desc>
   </xd:doc>

   <!-- This style sheet is divided into the following sections:
      
      HTML WRAPPER
      MAJOR DOCUMENT STRUCTURES
      PAGE, COLUMN, AND LINE BREAKS
      
      
      MAJOR TEXTUAL STRUCTURES
      SORTING AND FORMATTING LISTS
      ANNOTATIONS
      MANUSCRIPT FEATURES
      MISCELLANEOUS TEXTUAL FEATURES
      IMAGES      
   -->
   <xsl:template match="/">
   <!-- HTML WRAPPER: Note that this template 
      places the entire contents enclosed within the text tags of your document into 
      the HTML of the Web page. 
   -->
      <html>
         <head>
            <!-- Creat the head of the HTML document -->
            <!-- First, populate meta element with keywords -->
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
            <!-- Grab title from the fileDesc element of the TEI header. -->
            <title>
               <xsl:value-of
                  select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
            </title>
            <!-- LOCAL JS CALLS -->
            <link rel="stylesheet" href="jquery-ui.css"/>
            <link href="LCSmithDiariesCSS.css" rel="stylesheet" type="text/css" />
            <script src="jquery-1.8.3.min.js"/>
            <script src="jquery-ui-1.9.2.custom.js"/>
            
            <!-- CREATE TOGGLE BUTTON FOR DIPLOMATIC/REGULARIZED SPELLING -->
            <script>
               $(document).ready(function(){
               $("button").click(function(){
               $(".sic").toggleClass("sictoggle");
               $(".corr").toggleClass("corrtoggle");
               });
               });
            </script>
            
            <!-- CALL VARIABLES (Needed here?) -->  
            <style type="text/css">
               <xsl:value-of select="$maintextRule"/>
               <xsl:value-of select="$navBarRule"/>
               <xsl:value-of select="$bodyRule"/>
            </style>
            
            <!-- DECLARE FONTS -->
            <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'/>
            <link href='http://fonts.googleapis.com/css?family=Fanwood+Text' rel='stylesheet' type='text/css'/>
                   
         </head>
         
         <!-- BUILD THE BODY OF THE HTML PAGE -->
         
         <body>
            
            <!-- BUILD THE MENUBAR -->
            
            <div class="masthead">
               <div id="navigation">
                  <ul class="nav">
                     <li class="link"><a class="main"  href="./lcsmith-diaries.html#projectDescription">Editorial Introduction</a>
                        <ul class="sub">
                           <li><a href="./lcsmith-diaries.html#projectDescription">Project Description</a></li>
                           <li><a href="./lcsmith-diaries.html#source">The Source Document</a></li>
                           <li><a href="./lcsmith-diaries.html#edition">The Electronic Edition</a></li>
                           <li><a href="./lcsmith-diaries.html#revHistory">Revision History</a></li>
                        </ul>
                     </li>
                     <li class="link"><a class="main"  href="./lcsmith-diaries.html#introduction">Historical Introduction</a>
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
                           <li><a href="./LCSmithMarkup.html">Markup Guidelines</a></li>
                           <li><a href="./LCSmithHands.html">Guide to Smith's Hand</a></li>
                           <li><a href="./LCSmith_ZoomIndex.html">Images of the MS Pages</a></li>
                           <li><a href="./LCSmithMaps.html">Maps</a></li>
                           <li><a href="./lcsmith-diaries.html#peopleMentioned">People Mentioned</a></li>
                           <li><a href="./lcsmith-diaries.html#placesMentioned">Places Mentioned</a></li>
                           <li><a href="./lcsmith-diaries.html#organizationsMentioned">Organizations Mentioned</a></li>
                           <li><a href="./lcsmith-diaries.html#worksCited">Works Cited</a></li>
                           <li><a href="./LCSmithAcknowledgements.html">Acknowledgements</a></li>
                           <li><a href="./LCSmithAboutEditors.html">About the Editors</a></li>
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
               
               <div id="display1"><!-- Begin display1 -->
                  <button class="modalb" id="b1"><img id="myImg1" src="image-LCSmith-daguerreotype.jpg" alt="Portrait of Lucius Clark Smith, 1858 (Age 23). Courtesy of New Albany Historical Society." title="Portrait of Lucius Clark Smith, 1858 (Age 23)" width="150"/></button>
                  <div id="myModal1" class="modal">
                     <button class="modalb close" onclick="document.getElementById('myModal1').style.display='none'">[Close]</button>
                     <img class="modal-content" id="img1" src="image-LCSmith-daguerreotype.jpg" alt="Portrait of Lucius Clark Smith, 1858 (Age 23). Courtesy of New Albany Historical Society."/>
                     <div id="caption1">
                        Portrait of Lucius Clark Smith, 1858 (Age 23). Courtesy of New Albany Historical Society.
                     </div>
                  </div> <!-- End myModal1 -->
               </div> <!-- End display1 -->
               
               <!-- Begin display2 -->
               <div id="display2">
                  <button class="modalb" id="b2"><img id="myImg2" src="image-archibaldsmithhouse.jpg" alt="Photograph of Smith Homestead (undated). Courtesy of New Albany Historical Society." title="Photograph of Smith Homestead" width="150"/></button>
                  <div id="myModal2" class="modal">
                     <button class="modalb close" onclick="document.getElementById('myModal2').style.display='none'">[Close]</button>
                     <img class="modal-content" id="img2" src="image-archibaldsmithhouse.jpg" alt="Photograph of Smith Homestead (undated). Courtesy of New Albany Historical Society."/>
                     <div id="caption2">
                        Photograph of Smith Homestead (undated). Courtesy of New Albany Historical Society.
                     </div>
                  </div> <!-- End myModal2 -->
                  <script>		
                     // Get the second modal
                     var modal2 = document.getElementById('myModal2');
                     
                     // Get the image and insert it inside the modal - use its "alt" text as a caption
                     var img2 = document.getElementById('b2');
                     var modalImg2 = document.getElementById("img2");
                     var captionText2 = document.getElementById("caption2");
                     img2.onclick = function(){
                     modal2.style.display = "block";
                     modalImg2.src = this.img.src;
                     captionText2.innerHTML = this.alt;
                     }
                     
                     // Get the span element that closes the modal 
                     var span = document.getElementsByClassName("close")[0];
                     
                     // When the user clicks on span (x), close the modal 
                     span.onclick = function() {
                     modal2.style.display = "none";
                     }
                  </script>
               </div> <!-- End display2 -->
               
               <!-- Begin display3 -->         
               <div id="display3">
                  <button class="modalb" id="b3"><img id="myImg3" src="image-archibald-maryannsmith.jpg" alt="Portraits of Lucius Smith's parents, Archibald and MaryAnn" title="Portraits of Lucius Smith's parents, Archibald and MaryAnn" width="150"/></button>
                  <div id="myModal3" class="modal">
                     <button class=" modalb close" onclick="document.getElementById('myModal3').style.display='none'">[Close]</button>
                     <img class="modal-content" id="img3" src="image-archibald-maryannsmith.jpg" alt="Portraits of Lucius Smith's parents, Archibald and MaryAnn"/>
                     <div id="caption3">
                        Portraits of Lucius Smith's parents, Archibald and MaryAnn
                     </div>
                  </div> <!-- End myModal3 -->
                  <script>
                     
                     // Get the modal
                     var modal3 = document.getElementById('myModal3');
                     
                     // Get the image and insert it inside the modal - use its "alt" text as a caption
                     var img3 = document.getElementById('b3');
                     var modalImg3 = document.getElementById("img3");
                     var captionText3 = document.getElementById("caption3");
                     img3.onclick = function(){
                     modal3.style.display = "block";
                     modalImg3.src = this.img.src;
                     captionText3.innerHTML = this.alt;
                     }
                     
                     // Get the span element that closes the modal
                     var span = document.getElementsByClassName("close")[0];
                     
                     // When the user clicks on span (x), close the modal
                     span.onclick = function() {
                     modal3.style.display = "none";
                     }
                  </script>
               </div> <!-- End display3 -->
               
               <!-- Begin display4 -->
               
               <div id="display4">
                  <button class="modalb" id="b4"><img id="myImg4" src="image-horse-power-canemill-1857.jpg" alt="Drawing of a sorghum mill" title="Drawing of a sorghum mill" width="150"/></button>
                  <div id="myModal4" class="modal">
                     <button class="modalb close" onclick="document.getElementById('myModal4').style.display='none'">[Close]</button>
                     <img class="modal-content" id="img4" src="image-horse-power-canemill-1857.jpg" alt="Drawing of a sorghum mill."/>
                     <div id="caption4">
                        Drawing of a sorghum mill
                     </div> <!-- End myModal4 -->
                     <script>
                        
                        // Get the modal
                        var modal4 = document.getElementById('myModal4');
                        
                        // Get the image and insert it inside the modal - use its "alt" text as a caption
                        var img4 = document.getElementById('b4');
                        var modalImg4 = document.getElementById("img4");
                        var captionText4 = document.getElementById("caption4");
                        img4.onclick = function(){
                        modal4.style.display = "block";
                        modalImg4.src = this.img.src;
                        captionText4.innerHTML = this.alt;
                        }
                        
                        // Get the span element that closes the modal
                        var span = document.getElementsByClassName("close")[0];
                        
                        // When the user clicks on span (x), close the modal
                        span.onclick = function() {
                        modal4.style.display = "none";
                        }
                     </script>
                  </div> <!-- End modal4 -->
               </div> <!-- End display 4 -->
               
               <!-- Begin display5 -->
               
               <div id="display5">
                  <button class="modalb" id="b5"><img id="myImg5" src="image-warmeeting-18620815.jpg" alt="Notice in Newark Advocate for 15 August 1862 of a war meeting" title="Notice in Newark Advocate for 15 August 1862 of a war meeting" width="150"/></button>
                  <div id="myModal5" class="modal">
                     <button class="modalb close" onclick="document.getElementById('myModal5').style.display='none'">[Close]</button>
                     <img class="modal-content" id="img5" src="image-warmeeting-18620815.jpg" alt="Notice in Newark Advocate for 15 August 1862 of a war meeting"/>
                     <div id="caption5">
                        Notice in Newark Advocate for 15 August 1862 of a war meeting
                     </div>
                  </div> <!-- End myModal5 -->
                  <script>
                     
                     // Get the modal
                     var modal5 = document.getElementById('myModal5');
                     
                     // Get the image and insert it inside the modal - use its "alt" text as a caption
                     var img5 = document.getElementById('b5');
                     var modalImg5 = document.getElementById("img5");
                     var captionText5 = document.getElementById("caption5");
                     img5.onclick = function(){
                     modal5.style.display = "block";
                     modalImg5.src = this.img.src;
                     captionText5.innerHTML = this.alt;
                     }
                     
                     // Get the span element that closes the modal
                     var span = document.getElementsByClassName("close")[0];
                     
                     // When the user clicks on span (x), close the modal
                     span.onclick = function() {
                     modal5.style.display = "none";
                     }
                  </script>
               </div> <!-- End display5 -->
               <script>
                  // Get the first modal
                  var modal1 = document.getElementById('myModal1');
                  
                  // Get the image and insert it inside the modal - use its "alt" text as a caption
                  var img1 = document.getElementById('b1');
                  var modalImg1 = document.getElementById("img1");
                  var captionText1 = document.getElementById("caption1");
                  img1.onclick = function(){
                  modal1.style.display = "block";
                  modalImg1.src = this.img.src;
                  captionText1.innerHTML = this.alt;
                  }
                  
                  // Get the span element that closes the modal
                  var span = document.getElementsByClassName("close")[0];
                  
                  // When the user clicks on span (x), close the modal
                  span.onclick = function() {
                  modal1.style.display = "none";
                  }
               </script>
               
            </div> <!-- End div id NavBar -->
            
            <!-- END THE VERTICAL IMAGE BAR -->
            
            <div id="viewMenu">
               <p class="aboutView"><a href="#view">About this View.</a></p>
               <p><button>Switch between Smith's spelling and regularized spelling.</button></p>
               <div class="container">
                  <p class="font-size-label">Font Size <button id="up">+</button> <button id="down">-</button></p>
                  <!--<p id="font-size"></p>-->
               </div>
            </div>
            
            
            <!-- Apply templates to the tei:body. -->
            
            <xsl:element name="div">
               <xsl:attribute name="id">maintext</xsl:attribute>
               <xsl:apply-templates select="/tei:TEI/tei:text/tei:body"/>
               
            <!-- Insert, count, encode by cardinal position, and link the explanatory annotations. -->
  
             <hr/>
            <h2>Explanatory Annotations</h2>
            <xsl:for-each select="//tei:body//tei:note[@resp='ed']">
               <xsl:choose>
                  <xsl:when test="position()>=100">
                     <p class="hang35"><a>
                        <xsl:attribute name="name">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:body//tei:note[@resp='ed']" level="any"
                        />.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:when>
                  <xsl:when test="position()>=10">
                     <p class="hang25"><a>
                        <xsl:attribute name="name">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:body//tei:note[@resp='ed']" level="any"
                        />.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:when>
                  <xsl:otherwise>
                     <p class="hang15"><a>
                           <xsl:attribute name="name">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:body//tei:note[@resp='ed']" level="any"/>.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:otherwise>
               </xsl:choose>

            </xsl:for-each>
            
            <hr/>
            <a name="WorksCited"/>
            <h2>List of Works Cited</h2>
            <xsl:apply-templates
               select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listBibl"/>
            <hr/>
            <!-- Describe this view of the journal. -->
            <h2>About this View of the Journal</h2>
            <p><a name="view"/><xsl:value-of select="$aboutView"/></p>
               
            <hr/>
            <a href="#topofpage">Top of Page</a>
               
            <!-- Insert link to home page, creation date, and licensing statement.-->
            <p align="left">
               <br/>
               <br/>
               <emph>Created: <xsl:apply-templates
                     select="//tei:TEI/tei:teiHeader/tei:profileDesc/tei:creation/tei:date"/></emph>
            </p>
            <p align="center">
               <xsl:value-of
                  select="//tei:teiCorpus/tei:teiHeader/tei:availability/tei:p[@id='CreativeCommons']"
                  disable-output-escaping="yes"/>
            </p>
            <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
            <script src="index.js"></script>
               
          </xsl:element>                      
         </body>                  
      </html>
   </xsl:template>

   <!-- MAJOR DOCUMENT STRUCTURES: These elements include the front, body, and back
      elements of you XML documents in the result tree of your output.-->

   <xsl:template match="tei:div[@type='Entry']">
         <div class="Entry">
            <xsl:element name="a"><xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:element>
            <xsl:apply-templates/>
         </div>
   </xsl:template>
   <xsl:template match="tei:div[@type='Entry']/tei:dateline">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   

   <!-- PAGE, COLUMN, AND LINE BREAKS; Page Layout: These template rules determine how page breaks and
      line breaks will be encoded, or whether they will be included, in your Web page. -->

   <xsl:template match="tei:ab/tei:persName">
      <br/><xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:addrLine">
      <br/><xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:div[@type='letter']/tei:head">
      <p><xsl:apply-templates/></p>
   </xsl:template>
   <!-- Template rule for editorial divs in back matter -->

   <xsl:template match="tei:div[@type='editorial']">
      <hr/>
      <br/>
      <a>
         <xsl:attribute name="name">
            <xsl:value-of select="@xml:id"/>
         </xsl:attribute>
      </a>
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:div[@type='editorial']/tei:head">
      <h1>
         <xsl:apply-templates/>
      </h1>
   </xsl:template>

   <!-- SORTING AND FORMATTING LISTS OF WORKS CITED, PLACES, ORGANIZATIONS, AND SO ON. -->

   <xsl:template match="//tei:listBibl">
      <xsl:for-each select="tei:bibl">
         <xsl:sort select="@n"/>
         <p class="hang25">
            <a>
               <xsl:attribute name="name">
                  <xsl:value-of select="@xml:id"/>
               </xsl:attribute>
            </a>
            <xsl:apply-templates/>
         </p>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="tei:note[@type='introductory']//tei:bibl">(<xsl:apply-templates/>)</xsl:template>
   <xsl:template match="tei:note[@resp='ed']//tei:bibl">(<xsl:apply-templates/>)</xsl:template>
   <xsl:template match="tei:ref"><xsl:apply-templates/></xsl:template>
   <xsl:template match="tei:title[@level='a']">"<xsl:apply-templates/>"</xsl:template>
   <xsl:template match="tei:title[@level='m']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>
   <xsl:template match="tei:title[@level='j']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>
   <xsl:template match="tei:listPlace">
      <xsl:for-each select="tei:place">
         <xsl:sort select="tei:geogName"/>
         <xsl:sort select="tei:placeName"/>
         <p>
            <xsl:if test="tei:geogName[1]"><strong><xsl:value-of select="tei:geogName[1]"
               /></strong></xsl:if>
            <xsl:if test="tei:geogName[2]"> (<xsl:value-of select="tei:geogName[2]"/>)</xsl:if>
            <xsl:if test="tei:placeName[1]"><strong><xsl:value-of select="tei:placeName[1]"
                  /></strong></xsl:if>
            <xsl:if test="tei:placeName[2]"> (<xsl:value-of select="tei:placeName[2]"/>)</xsl:if>.
               <xsl:value-of select="tei:country"/>
            <xsl:if test="tei:region">; <xsl:value-of select="tei:region"/></xsl:if>
            <xsl:if test="tei:location/tei:geo"> (Lat/Long: <xsl:value-of
                  select="tei:location/tei:geo"/>)</xsl:if>. <xsl:value-of select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>

   <!-- ANNOTATIONS -->

   <xsl:template match="tei:TEI//tei:ptr[@type='noteAnchor']">
      <a>
         <xsl:attribute name="name">p<xsl:value-of select="@target"></xsl:value-of>
         </xsl:attribute>
         <xsl:attribute name="class">notePointer</xsl:attribute>
      </a>
      <a>
         <xsl:attribute name="href">#n<xsl:value-of select="@target"/></xsl:attribute>
         <xsl:attribute name="class">annotation</xsl:attribute>
         <xsl:attribute name="title"><xsl:value-of select="normalize-space(following::tei:note[1])"></xsl:value-of></xsl:attribute>
         <sup class="noteAnchor">
            <xsl:number level="any" count="tei:TEI//tei:ptr[@type='noteAnchor']"/>
            <xsl:apply-templates/>
         </sup>
      </a>
   </xsl:template>
   <xsl:template match="tei:note[@xml:id]"/>

   <!-- MSS ITEMS: These rules process various tags particularly relevant to 
      transcriptions of primary handwritten materials. -->

   <!-- Handshifts -->
<!--   <xsl:template match="tei:handShift"> [<xsl:value-of select="@new"/>] </xsl:template>-->
   <xsl:template match="tei:handShift"/>

   <!-- Gaps in your transcript of the source text (tears in the page, and so on). -->
   <xsl:template match="tei:gap">
      <xsl:apply-templates/>[ .&#xA0;.&#xA0;. ] </xsl:template>
   <xsl:template match="tei:damage"> [<em>Damage: <xsl:value-of select="@agent"/> (<xsl:value-of
            select="@extent"/>
         <xsl:value-of select="@unit"/>)</em>] </xsl:template>

   <!-- Editorial emendations -->
   <xsl:template match="tei:supplied">[<xsl:apply-templates/>] </xsl:template>

   <!-- Additions by the author or another hand. -->
   <xsl:template match="tei:add">
      <xsl:apply-templates/>
   </xsl:template>

   <!-- Unclear passages. -->
   <xsl:template match="tei:unclear"> [<xsl:apply-templates/>?] </xsl:template>

   <!-- Nonstandard or erroneous text for which you have encoded a correct or regularized alternative. -->
   <xsl:template match="tei:choice/tei:orig">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:choice/tei:reg"/>
   <xsl:template match="tei:distinct[@type='babyTalk']">
      <xsl:apply-templates/> [sic] 
   </xsl:template>

   <!--MISCELLANEOUS TEXTUAL FEATURES. -->

   <!-- Quotes -->
   <xsl:template match="tei:q">
      <q>
      <xsl:apply-templates/>
      </q>
   </xsl:template>
   <xsl:template match="//tei:quote[@type='blockquote']">
      <p class="blockquote">
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   <!-- Choice Elements -->
   <xsl:template match="tei:choice/tei:abbr">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:choice/tei:expan"/>
   <xsl:template match="tei:choice/tei:sic">
      <span class="sic"><xsl:apply-templates/>[sic]</span>
   </xsl:template>
   <xsl:template match="tei:choice/tei:corr">
      <span class="corr corrtoggle"><xsl:apply-templates/></span>
   </xsl:template>
   

   <!-- Passages in languages other than your document's base language. -->
   
   <xsl:template match="tei:foreign">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>

   <!-- Names -->
   <xsl:template match="tei:rs">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:note/tei:name[@type='ship']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>
   <xsl:template match="tei:person/tei:name[@type='ship']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>

   <!-- Text highlighted in the source document -->

   <xsl:template match="tei:hi[@rend='underlined']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='superscript']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>

   <!-- LINK OR EMBED IMAGES AND OTHER NON-TEXTUAL MATERIALS -->

   <xsl:template match="tei:figure[@rend='link']"> [<a>
         <xsl:attribute name="href">
            <xsl:value-of select="tei:graphic/@url"/>
         </xsl:attribute>
         <xsl:attribute name="alt">
            <xsl:value-of select="tei:figDesc"/>
         </xsl:attribute>
         <xsl:attribute name="target">_blank</xsl:attribute>
         <xsl:value-of select="tei:head"/>
      </a>].
   </xsl:template>
   
   <xsl:template match="tei:figure[@rend='namedanchor']">
      <a>
      <xsl:attribute name="name">
         <xsl:value-of select="tei:graphic/@url"/>
      </xsl:attribute>
   </a>
   </xsl:template>
   

</xsl:stylesheet>
