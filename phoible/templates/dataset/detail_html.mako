<%inherit file="../home_comp.mako"/>
<%namespace name="util" file="../util.mako"/>

<%def name="sidebar()">
    <%util:well title="Cite">
        ${h.newline2br(h.text_citation(request, ctx))|n}
        ${h.cite_button(request, ctx)}
    </%util:well>
</%def>

<h2>Welcome to PHOIBLE Online</h2>

<p>PHOIBLE Online is a repository of cross-linguistic phonological inventory data, which have been extracted from source documents and tertiary databases and compiled into a single searchable convenience sample. There are currently ${inventory_count} inventories that contain ${segment_count} segment types found in ${language_count} distinct languages.</p>

<p>References are provided for each source; note that some languages in PHOIBLE have multiple entries based on distinct sources that disagree about the number and/or identity of that language’s phonemes.</p>

<p>Two principles guide the development of PHOIBLE, though it has proved challenging both theoretically and technologically to abide by them:</p>

<ol>
<li>Be faithful to the language description in the source document (now often called ‘doculect’, for reasons indicated above)</li>
<li>Encode all character data in a consistent representation in Unicode IPA</li>
</ol>

<p>In addition to phoneme inventories, PHOIBLE includes distinctive feature data for every phoneme in every language. The feature system used was created by the PHOIBLE developers to be descriptively adequate cross-linguistically. In other words, if two phonemes differ in their graphemic representation, then they necessarily differ in their featural representation as well (regardless of whether those two phonemes coexist in any known doculect). The feature system is loosely based on the feature system in
${h.link(request, sources['hayes2009'], label="Hayes 2009")} with some additions drawn from ${h.link(request, sources['moisikesling2011'], label="Moisik & Esling 2011")}.
</p>

<p>However, the final feature system goes beyond both of these sources, and is potentially subject to change as new languages are added to PHOIBLE.</p>

##<p>For more information on the design, development, and challenges of PHOIBLE, see ${h.link(request, sources['moran2012a'], label="Moran 2012")}.</p>

<p>The current database includes inventories from the following contributors:</p>
<%util:table args="item" options="${dict(bFilter=False)}" items="${[c for c in contributors if c.contribution_assocs]}" class_="table-nonfluid table-striped">
    <%def name="head()">
        <th>Contributor</th>
        <th>Description</th>
        <th>Sources</th>
        <th>Number of inventories</th>
    </%def>
    <td>${item.name} (${item.id})</td>
    <td>${item.description|n}</td>
    <td>
        <ul class="unstyled inline">
            % for ref in item.references:
            <li>${h.link(request, ref.source)}</li>
            % endfor
        </ul>
    </td>
    <td class="right">${len(item.contribution_assocs)}</td>
</%util:table>

<p>The data set also includes additional genealogical and geographical information about each language from the Glottolog.</p>

<p>
    The PHOIBLE project also integrates the theoretical model of distinctive features from
    an extended phonological feature set based on International Phonetic Alphabet
    (${h.link(request, sources['ipa2005'])}) and on ${h.link(request, sources['hayes2009'])}.
    This is accomplished by creating a mapping relationship from each IPA segment to a set
    of features (Moran 2012). In this way, the IPA is a pivot for interoperability across
    all resources in PHOIBLE because their contents are encoded in Unicode IPA.
</p>

<p>For a detailed description of PHOIBLE, see
    ${h.link(request, sources['moran2012a'])}
    ${h.external_link("https://digital.lib.washington.edu/researchworks/handle/1773/22452", label=" ")}.
    For examples of some of the research we are doing with PHOIBLE, see:

    ${h.link(request, sources['moranetal2012'])},
    ${h.link(request, sources['cysouwetal2012'])},
    ${h.link(request, sources['mccloyetal2013'])}
    and Moran &amp; Blasi, Cross-linguistic comparison of complexity measures in phonological systems, forthcoming.
</p>




<h3>How to use PHOIBLE</h3>

<p>Users can browse or search PHOIBLE's inventories by clicking on the tabs <a href="${request.route_url('contributions')}">"Inventories"</a>, <a href="${request.route_url('languages')}">"Languages"</a> or <a href="${request.route_url('parameters')}">"Segments"</a> above. Data can be downloaded by clicking the download button <i class="icon icon-download-alt"> </i>. If you use PHOIBLE in your research, please cite appropriately, following our recommended citation format.</p>


<h3>How to cite PHOIBLE</h3>

<p>If you are citing the database as a whole, or making use of the phonological distinctive feature systems in PHOIBLE, please cite as follows:</p>

    <%util:well>
        ${h.newline2br(h.text_citation(request, ctx))|n}
        ${h.cite_button(request, ctx)}
    </%util:well>

<p>If you are citing phoneme inventory data for a particular language or languages, please use the name of the language as the title, and include the original data source as an element within PHOIBLE:<p>

    <%util:well>
        ${h.newline2br(h.text_citation(request, h.models.Contribution.get("441")))|n}
        ${h.cite_button(request, h.models.Contribution.get("441"))}
    </%util:well>
