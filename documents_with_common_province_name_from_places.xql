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
       group by $docId
       order by $docId

        return
            if(contains($provinceName, 'Asia')) then
                <document>
                 <docId>{$docId}</docId>
                 <docTitle>
                     {
                         for $i in $docTitle
                         group by $j := $i
                         return
                            $j
                     }
                 </docTitle>
                 <placeName>
                     {
                         for $i in $placeName
                         group by $j := $i
                         return
                            $j
                     }
                 </placeName>
                 <provinceName>
                     {
                         for $i in $provinceName
                         group by $j := $i
                         return
                            $j
                     }
                 </provinceName>
                </document>
            else ('Nothing happens')
};

local:documents_with_common_province_name_from_places()
