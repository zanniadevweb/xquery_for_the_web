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
