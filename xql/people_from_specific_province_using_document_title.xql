xquery version "3.1";

declare function local:people_from_specific_province_using_document_title() {
    let $peopleProvince := 'Asia' (: This string value can be modified by hand :)

    for $document in doc("documents.xml")/documents/document
      let $docProvince := $document/province/text()
      let $filteredDoc := $document where $peopleProvince = $docProvince
      group by $filteredDoc
      order by $filteredDoc
      let $filteredDocTitle := $filteredDoc/title

      for $person in doc("people.xml")/people/person
        let $personName := $person/name/text()
        let $filteredPerson := $person where contains($filteredDocTitle, $personName)
        group by $filteredPerson
        order by $filteredPerson

    return $filteredPerson
};

local:people_from_specific_province_using_document_title()
