xquery version "3.1";

declare function local:documents_and_people_in_range_of_dates() {
    let $rangeDate := (167,181) (: This range can be modified by hand :)
    let $dateBefore := head($rangeDate)
    let $dateAfter := tail($rangeDate)

    for $person in doc("people.xml")/people/person
        let $personDatingNotBefore := $person/datingnotbefore/text()
        let $personDatingNotAfter := $person/datingnotafter/text()
        let $filteredPerson := $person where $personDatingNotBefore >= $dateBefore and $personDatingNotAfter <= $dateAfter

    for $document in doc("documents.xml")/documents/document
        let $docDatingNotBefore := $document/datingnotbefore/text()
        let $docDatingNotAfter := $document/datingnotafter/text()
        let $filteredDoc := $document where $docDatingNotBefore >= $dateBefore and $docDatingNotAfter <= $dateAfter

    return ($filteredPerson,"",$filteredDoc)
};

local:documents_and_people_in_range_of_dates()
