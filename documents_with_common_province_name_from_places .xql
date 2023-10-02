xquery version "3.1";

declare function local:documents_with_common_province_name_from_places() {
    for $place in doc("places.xml")/places/place
    let $placeProvince := $place/province/text()
      for $document in doc("documents.xml")/documents/document
      let $docTitle := $document/title/text()
      let $docProvince := $document/province/text()
      let $filteredDoc := $document where $placeProvince = $docProvince
      group by $filteredDoc
      order by $filteredDoc
      return $filteredDoc
};

local:documents_with_common_province_name_from_places()
