xquery version "3.1";

declare function local:fact($n as xs:integer) {
    if ($n eq 1) then
        $n
    else
        $n * local:fact($n - 1)
};
local:fact(6)

declare function local:search() {
    for $person in doc("people.xml")/people/person
       let $name := $person/name/text()
       return
          <document>
             <name>{$name}</name>
          </document>
};
local:search()

declare function prefix:function_name($parameter as datatype)
as returnDatatype
{
 ...function code here...
};


------------------------

xquery version "1.0";

for $place in doc("places.xml")/places/place
   let $name := $place/province/text()

for $document in doc("documents.xml")/documents/document
   let $title := $document/province/text()


return
  <document>
     <title>{$title}</title>
     <title>{$name}</title>
  </document>


  --------------------

  xquery version "3.1";

for $place in doc("places.xml")/places/place
   let $placeProvince := $place/province/text()
   let $nameDoc := $place/name/text()
   for $document in doc("documents.xml")/documents/document
   let $documentProvince := $document/province/text()
   where fn:not($placeProvince = $documentProvince)
    let $provinceName := $documentProvince

return
  <document>
     <name>{$nameDoc}</name>
     <title>{$provinceName}</title>
  </document>

  --------------
  xquery version "3.1";

  for $place in doc("places.xml")/places/place
     let $placeProvince := $place/province/text()
     let $nameDoc := $place/name/text()
     for $document in doc("documents.xml")/documents/document
     let $documentProvince := $document/province/text()
     where $placeProvince = $documentProvince
     let $provinceName := $documentProvince

      return
        <document>
           <name>{$nameDoc}</name>
           <title>{$provinceName}</title>
        </document>

  -----------
  xquery version "3.1";

let $count := 0
for $place in doc("places.xml")/places/place
   let $placeProvince := $place/province/text()
   let $placeName := $place/name/text()

   for $document in doc("documents.xml")/documents/document
   let $docTitle := $document/title/text()
   let $docProvince := $document/province/text()
   where $placeProvince = $docProvince
   let $provinceName := $docProvince
   let $count := $count + 1

    return
        if(contains($provinceName, 'Asia')) then
            <document>
             <it>{$count}</it>
             <docTitle>{$docTitle}</docTitle>
             <placeName>{$placeName}</placeName>
             <provinceName>{$provinceName}</provinceName>
            </document>
        else ()


------------

xquery version "3.1";

let $count := 0
for $place in doc("places.xml")/places/place
   let $placeProvince := $place/province/text()
   let $placeName := $place/name/text()

   for $document in doc("documents.xml")/documents/document
   let $docTitle := $document/title/text()
   let $docProvince := $document/province/text()
   let $docId := $document/id/text()
   where $placeProvince = $docProvince
   let $provinceName := $docProvince
   let $count := $count + 1

    let $items := ($docId,$docId)
    let $unique-items := distinct-values($items)
    return
       <result>

          <items>
          {
             for $item in $unique-items
             return <item>{$item}</item>
          }
          </items>

       </result>

    return
        if(contains($provinceName, 'Asia')) then
            <document>
             <docId>{$docId}</docId>
             <it>{$count}</it>
             <docTitle>{$docTitle}</docTitle>
             <placeName>{$placeName}</placeName>
             <provinceName>{$provinceName}</provinceName>
            </document>
        else ()


------------------

xquery version "3.1";

for $place in doc("places.xml")/places/place
   let $placeProvince := $place/province/text()
   let $placeName := $place/name/text()

   for $document in doc("documents.xml")/documents/document
   let $docTitle := $document/title/text()
   let $docProvince := $document/province/text()
   let $docId := $document/id/text()
   where $placeProvince = $docProvince
   let $provinceName := $docProvince
   let $i := 0
   let $count := $i + 1

    return
        if($count = 6) then (: $count = 1 :)
            'break;first IF'
        else(
            if(contains($provinceName, 'Asia')) then
                <document>
                 <it>{$count}</it>
                 <docId>{$docId}</docId>
                 <docTitle>{$docTitle}</docTitle>
                 <placeName>{$placeName}</placeName>
                 <provinceName>{$provinceName}</provinceName>
                </document>
            else (
                'break; second IF'
            )
        )


-------------------


xquery version "3.1";

declare function local:documents_with_common_province_name_from_places() {
    for $place in doc("places.xml")/places/place
       let $placeProvince := $place/province/text()
       let $placeName := $place/name/text()

       for $document in doc("documents.xml")/documents/document
       let $docTitle := $document/title/text()
       let $docProvince := $document/province/text()
       let $docId := $document/id/text()
       where $placeProvince = $docProvince
       let $provinceName := $docProvince
       let $i := 0
       let $count := $i + 1

        return
            if($count = 6) then (: $count = 1 :)
                'break;first IF'
            else(
                if(contains($provinceName, 'Asia')) then
                    <document>
                     <it>{$count}</it>
                     <docId>{$docId}</docId>
                     <docTitle>{$docTitle}</docTitle>
                     <placeName>{$placeName}</placeName>
                     <provinceName>{$provinceName}</provinceName>
                    </document>
                else (
                    'break; second IF'
                )
            )
};

local:documents_with_common_province_name_from_places()
