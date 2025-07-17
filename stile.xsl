<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="tei">

  <xsl:output method="html" indent="yes" encoding="UTF-8"/>

  <!-- ROOT TEMPLATE -->
  <xsl:template match="/">
    <html>
      <head>
        <title>La Rassegna Settimanale</title>
        <meta charset="UTF-8"/>
        <link rel="stylesheet" href="stile.css"/>
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
        <script src="script.js"></script>
      </head>
      <body>

        <div class="navbar">  <!--barra per la navigazione e bottoni dropdown-->
          <div class="dropdown">
            <a class="drop-link" href="#">Articoli</a>
            <div class="contenutonav">
              <xsl:for-each select= "(//tei:text[not(@xml:id='bibliografia')])[position() &gt;=2 and position() &lt;=4]">
                <a href="#{@xml:id}">
                  <xsl:choose>
                    <xsl:when test="@xml:id='lecce'">Corrispondenze da Lecce</xsl:when>
                    <xsl:when test="@xml:id='patria'">Auguri alla patria</xsl:when>
                    <xsl:when test="@xml:id='delfo'">Oracolo di Delfo</xsl:when>
                    <xsl:otherwise><xsl:value-of select="@xml:id"/></xsl:otherwise>
                  </xsl:choose>
                </a>
              </xsl:for-each>
            </div>
          </div>


          <div class="dropdown">
            <a class="drop-link" href="#">Bibliografia</a>
            <div class="contenutonav">
              <xsl:for-each select="(//tei:text)[position() &gt; 4 and not(@xml:id = 'not')]">
                <a href="#{@xml:id}">
                  <xsl:choose>
                    <xsl:when test="@xml:id='biblio1'">Edvige, racconto</xsl:when>
                    <xsl:when test="@xml:id='biblio2'">Una visita agli ossari di San Martino e Solferino</xsl:when>
                    <xsl:otherwise><xsl:value-of select="@xml:id"/></xsl:otherwise>
                  </xsl:choose>
                </a>
              </xsl:for-each>
            </div>
          </div>

        
          <div class="dropdown">
            <a class="drop-link" href="#not">Notizie</a>
          </div>



  
          <div class="dropdown">
            <a class="drop-link" href="#glossario">Glossario</a>
          </div>


          <div class="dropdown">
            <a class="drop-link" href="#info">Informazioni</a>
          </div>

        </div>

        <!--filtri a destra --> 
        <aside class="sidebar">
          <h2>Filtri</h2>
          <ul class="tagList">
            <li><a href="#placeNames" onclick="highlightTag('placeName'); return false;">Luoghi</a></li>
            <li><a href="#geogNameTags" onclick="highlightTag('geogName'); return false;">Luoghi naturali</a></li>
            <li><a href="#persNames" onclick="highlightTag('reale'); return false;">Persone reali</a></li>
            <li><a href="#persNames2" onclick="highlightTag('immaginario'); return false;">Personaggi</a></li>
            <li><a href="#addNames" onclick="highlightTag('addName'); return false;">Epiteti</a></li>
            <li><a href="#TitleOp" onclick="highlightTag('opere'); return false;">Opere</a></li>
            <li><a href="#dateTag" onclick="highlightTag('date'); return false;">Date</a></li>
            <li><a href="#rsTags" onclick="highlightTag('tema'); return false;">Temi</a></li>
            <li><a href="#rsTag2" onclick="highlightTag('verbum'); return false;">Concetti</a></li>
            <li><a href="#citTag" onclick="highlightTag('quote'); return false;">Citazioni</a></li>
            <li><a href="#orgNameTags" onclick="highlightTag('orgName'); return false;">Organizzazioni</a></li>
            <li><a href="#foreignTag" onclick="highlightTag('foreign'); return false;">Lingua straniera</a></li>
            <li><a href="#ediTag" onclick="highlightTag('publisher'); return false;">Case editrici</a></li>
            <li><a href="#rivisteTag" onclick="highlightTag('j'); return false;">Riviste</a></li>
          </ul>
        </aside>

    <main>
  
            <h1><xsl:value-of select="//tei:titleStmt/tei:title"/></h1>

            <p>
              In questa sezione troverai i riferimenti testuali codificati con tag tematici secondo le <strong>linee guida 
              TEI/XML</strong>. 
              Usa il menu laterale per navigare tra le diverse <strong>categorie</strong>.
            </p>
            <p>
              Sono stati codificati gli articoli <strong>"Corrispondenze da Lecce"</strong> (Fascicolo 72, Volume 3), <strong>"Auguri alla
              patria"</strong>(Fascicolo 157, Volume 7) e <strong>"Oracolo di Delfo"</strong> (Fascicolo 196, Volume 8). 
              Dagli stessi fascicoli sono state codificate le bibliografie <strong>Giacomo Zanella, Edvige, racconto. — Firenze, G. Barbèra</strong> (Fascicolo 157)
              e <strong>Cesira Siciliani, Una visita agli ossari di San Martino e Solferino</strong> (Fascicolo 196), mentre dal fascicolo 72 sono state codificate le 
              prime due <strong>notizie</strong> incluse. 
            </p>
            <p>
              Per quanto riguarda i fenomeni analizzati sono stati evidenziati nei testi <strong>luoghi, luoghi naturali, organizzazioni e persone</strong>
              nominate nel testo, ma anche <strong>epiteti, verba</strong>, definiti come concetti astratti relativi al tema dell'articolo codificato, e i <strong>temi</strong> dei
              testi stessi.
              Sono stati codificati, inoltre, elementi correlati in modo più definito all'ambito dell'editoria, quali <strong>date, opere, citazioni, 
              case editrici e riviste </strong> menzionate. 
            </p>
            <p>
              Per ulteriori informazioni, è possibile consulare un <strong>glossario</strong> dei termini evidenziati e delle categorie 
              analizzate.
            </p>
            <p> Per visualizzare le <strong>correzioni</strong> premi qui: </p>
          <button id="correzioni">Mostra/Nascondi Correzioni</button> 

          <xsl:apply-templates select="//tei:text"/>

          <div class="glossario" id="glossario">  <!--info nel glossario-->

    <h2>Glossario</h2>
    <ul>

    <li>
      <h3>Luoghi</h3>
      <ul>
        <xsl:for-each select="distinct-values(//tei:placeName)">
          <li><xsl:value-of select="."/></li>
        </xsl:for-each>
      </ul>
    </li>

    <li>
      <h3>Luoghi naturali</h3>
      <ul>
        <xsl:for-each select="distinct-values(//tei:geogName)">
          <li><xsl:value-of select="."/></li>
        </xsl:for-each>
      </ul>
    </li>

 
    <li>
      <h3>Persone</h3>
      <ul>
        <xsl:for-each select="distinct-values(//tei:persName[@type = 'reale'])">
          <li><xsl:value-of select="."/></li>
        </xsl:for-each>
      </ul>
    </li>
  
 
    <li>
      <h3>Personaggi</h3>
      <ul>
        <xsl:for-each select="distinct-values(//tei:persName[@type = 'immaginario'])">
          <li><xsl:value-of select="."/></li>
        </xsl:for-each>
      </ul>
    </li>
  
  
    <li>
      <h3>Date</h3>
      <ul>
        <xsl:for-each select="distinct-values(//tei:date)">
          <li><xsl:value-of select="."/></li>
        </xsl:for-each>
      </ul>
    </li>
  
    <li>
      <h3>Temi</h3>
      <ul>
        <xsl:for-each select="distinct-values(//tei:rs[@type='tema'])">
          <li><xsl:value-of select="."/></li>
       </xsl:for-each>
     </ul>
    </li>

  <li>
  <h3>Opere</h3>
  <ul>
    <xsl:for-each select="distinct-values(//tei:title[@type='opere'])">
      <li><xsl:value-of select="."/></li>
    </xsl:for-each>
  </ul>
  </li>

    <li>
    <h3>Concetti</h3>
    <ul>
      <xsl:for-each select="distinct-values(//tei:rs[@type='verbum'])">
        <li><xsl:value-of select="."/></li>
    </xsl:for-each>
  
  </ul>
    </li>

      <li>
      <h3>Organizzazioni</h3>
      <ul>
        <xsl:for-each select="distinct-values(//tei:orgName)">
          <li><xsl:value-of select="."/></li>
        </xsl:for-each>
      </ul>
     </li>

    <li>
    <h3>Lingua Straniera</h3>
    <ul>
        <xsl:for-each select="distinct-values(//tei:foreign)">
          <li><xsl:value-of select="."/></li>
    </xsl:for-each>
  </ul>
  </li>

    <li>
    <h3>Case Editrici</h3>
    <ul>
        <xsl:for-each select="distinct-values(//tei:publisher)">
          <li><xsl:value-of select="."/></li>
      </xsl:for-each>
    </ul>
    </li>
    
  <li>
  <h3>Riviste</h3>
  <ul>
    <xsl:for-each select="distinct-values(//tei:title[@level='j'])">
      <li><xsl:value-of select="."/></li>
    </xsl:for-each>
  </ul>
  </li>

  </ul>
    
</div>

<div class="meta-info" id="info">   <!--info bibliografiche da <fileDesc> e <sourceDesc>-->
      <h2>Informazioni bibliografiche</h2>
    

      <p><strong>Titolo:</strong> <xsl:value-of select="//tei:titleStmt/tei:title"/></p>
    

      <p><strong>Edizione:</strong> <xsl:value-of select="//tei:editionStmt/tei:edition/tei:date"/></p>
    

      <p><strong>A cura di:</strong>
        <xsl:for-each select="//tei:editionStmt/tei:respStmt[tei:resp[contains(.,'cura')]]/tei:name">
          <xsl:value-of select="."/><xsl:if test="position() != last()">, </xsl:if>
        </xsl:for-each>
      </p>
    

      <p><strong>Codificato da:</strong>
        <xsl:for-each select="//tei:editionStmt/tei:respStmt[tei:resp[contains(.,'Codificato')]]/tei:name">
          <xsl:value-of select="tei:forename"/> <xsl:value-of select="tei:surname"/>
          <xsl:if test="position() != last()">, </xsl:if>
        </xsl:for-each>
      </p>
    
  
      <p><strong>Pubblicato da:</strong>
        <xsl:value-of select="//tei:publicationStmt/tei:publisher"/>
        (<xsl:value-of select="//tei:publicationStmt/tei:date"/>)
      </p>
    

      <p><strong>Fonte:</strong> <xsl:value-of select="//tei:sourceDesc/tei:bibl/tei:title"/></p>
    

      <p><strong>Autori:</strong>
        <xsl:for-each select="//tei:sourceDesc/tei:bibl/tei:author/tei:persName">
          <xsl:value-of select="tei:forename"/> <xsl:value-of select="tei:surname"/>
          <xsl:if test="position() != last()">, </xsl:if>
        </xsl:for-each>
      </p>
    
    
      <p><strong>Luogo:</strong> 
        <xsl:value-of select="//tei:sourceDesc/tei:bibl/tei:pubPlace"/>
     </p>

      <p> <strong>Editore:</strong> 
        <xsl:value-of select="//tei:sourceDesc/tei:bibl/tei:publisher"/>
      </p>
    
    
      <p><strong>Date:</strong>
        <xsl:for-each select="//tei:sourceDesc/tei:bibl/tei:date">
          <xsl:value-of select="."/><xsl:if test="position() != last()"> – </xsl:if>
        </xsl:for-each>
      </p>
    </div>
    </main>

      
      </body>
    </html>
  </xsl:template>


<xsl:template match="tei:text">
  <section id="{@xml:id}">
    <xsl:for-each select="tei:body/tei:div">
      <xsl:variable name="page-img" select="tei:pb/@facs"/>
      <xsl:variable name="surface" select="//tei:surface[tei:graphic/@url = $page-img]"/>
      <xsl:variable name="map-id" select="$surface/@xml:id"/>

      <div class="page">
        <div class="image">
          <img src="{$page-img}" alt="Facsimile pagina"
              style="width: 502px; height:750px; border:1px solid #ccc"
              usemap="#map-{$map-id}"/>

          <map name="map-{$map-id}">
            <xsl:for-each select="$surface/tei:zone">
              <area shape="rect"
                    coords="{@ulx},{@uly},{@lrx},{@lry}"
                    href="#{@xml:id}"
                    alt="link to {@xml:id}"/>
            </xsl:for-each>
          </map>
        </div>

        <div class="text">
          <xsl:apply-templates/>
        </div>
      </div>
    </xsl:for-each>
  </section>
</xsl:template>

<xsl:template match="tei:surface">
  <div class="image-container">
    <img src="{tei:graphic/@url}" width="{tei:graphic/@width}" height="{tei:graphic/@height}" usemap="#{substring-after(@xml:id, '#')}"/>
    <map name="{substring-after(@xml:id, '#')}">
      <xsl:apply-templates select="tei:zone"/>
    </map>
  </div>
</xsl:template>
  
<xsl:template match="tei:zone">  <!--template per mappatura del testo-->
  <area shape="rect"
        coords="{@ulx},{@uly},{@lrx},{@lry}"
        id="{@xml:id}"
        href="#{@xml:id}"/>
</xsl:template>

<xsl:template match="tei:lb">
  <br/>
</xsl:template>


<!--template per i tag dei fenomeni codificati-->
<xsl:template match="tei:placeName">
  <placeName><xsl:apply-templates/></placeName>
</xsl:template>

<xsl:template match="tei:geogName">
  <geogName><xsl:apply-templates/></geogName>
</xsl:template>

<xsl:template match="tei:persName[@type = 'immaginario']">
  <persName data-type="immaginario"><xsl:apply-templates/></persName>
</xsl:template>

<xsl:template match="tei:persName[@type = 'reale']">
  <persName data-type="reale"><xsl:apply-templates/></persName>
</xsl:template>

<xsl:template match="tei:title[@type = 'opere']">
  <rs data-type="opere"><xsl:apply-templates/></rs>
</xsl:template>

<xsl:template match="tei:title[@level = 'j']">
  <rs data-type="j"><xsl:apply-templates/></rs>
</xsl:template>

<xsl:template match="tei:date">
  <date><xsl:apply-templates/></date>
</xsl:template>

<xsl:template match="tei:rs[@type = 'tema']">
  <rs data-type="tema"><xsl:apply-templates/></rs>
</xsl:template>

<xsl:template match="tei:rs[@type = 'verbum']">
  <rs data-type="verbum"><xsl:apply-templates/></rs>
</xsl:template>

<xsl:template match="tei:quote">  
<em><quote data-type="quote"><xsl:apply-templates/></quote></em>
</xsl:template>

<xsl:template match="tei:orgName">
  <orgName><xsl:apply-templates/></orgName>
</xsl:template>

<xsl:template match="tei:foreign">
  <foreign><xsl:apply-templates/></foreign>
</xsl:template>

<xsl:template match="tei:publisher">
<span data-type="publisher">
  <xsl:apply-templates/>
</span>
</xsl:template>

<xsl:template match="tei:addName">
  <addName><xsl:apply-templates/></addName>
</xsl:template>

<xsl:template match="tei:hi">
  <em><xsl:apply-templates/></em>
</xsl:template>

<xsl:template match="tei:choice">  <!--template per le correzioni nel testo-->
  <xsl:choose>
      <xsl:when test="tei:sic and tei:corr">
          <span class="choice correzione" id="{generate-id()}">
              <span class="sic visible">
                  <xsl:value-of select="tei:sic"/>
              </span>
              <span class="corr hidden" style="color: red;">
                  <xsl:value-of select="tei:corr"/>
              </span>
          </span>
      </xsl:when>
      <xsl:otherwise>
          <span class="choice" id="{generate-id()}">
              <xsl:apply-templates select="node()"/>
          </span>
      </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="tei:ab">  <!--per i paragrafii-->
  <div class="ab-block">
    <xsl:if test="@facs">
      <xsl:attribute name="id">
        <xsl:value-of select="substring-after(@facs, '#')"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:apply-templates/>
  </div>
</xsl:template>
  

<xsl:template match="tei:title">
  <strong><xsl:apply-templates/></strong>
</xsl:template>

<xsl:template match="text()">
  <xsl:value-of select="."/>
</xsl:template>


<xsl:template match="tei:q[@type='spoken']">  <!--template per codificare i dialoghi-->
  <span class="q-spoken">

    <xsl:choose>
      <xsl:when test="contains(@rend, 'PRE mdash')">— </xsl:when>
    </xsl:choose>

    <xsl:apply-templates/>
    <xsl:choose>
      <xsl:when test="contains(@rend, 'POST mdash')"> —</xsl:when>
    </xsl:choose>
  </span>
</xsl:template>


<xsl:template match="tei:title[@ref]"> <!--da titolo rassegna-->
  <h2 class="section-title">
    <xsl:apply-templates/>
  </h2>
</xsl:template>
  

<xsl:template match="tei:seg[@type='titolo']">
    <xsl:apply-templates/>
</xsl:template>

  <xsl:template match="bibl">   <!--template entrate bibliografiche-->
  <span class="bibl-entry">
    <xsl:apply-templates/>
  </span>
</xsl:template>



</xsl:stylesheet>