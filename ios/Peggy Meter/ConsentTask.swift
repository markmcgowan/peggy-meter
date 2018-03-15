//
//  ConsentTask.swift
//  Peggy Meter
//
//  Created by Rustem Arzymbetov on 3/15/18.
//  Copyright © 2018 PeggyJo. All rights reserved.
//

import UIKit
import ResearchKit

public var ConsentTask: ORKOrderedTask {
    let Document = ORKConsentDocument()
    Document.title = "Peggy Meter Consent"
    
    let sectionTypes: [ORKConsentSectionType] = [
        .overview,
        .dataGathering,
        .privacy,
        .dataUse,
        //.timeCommitment,
        //.studySurvey,
        //.studyTasks,
        //.withdrawing
    ]
    
    let consentSections: [ORKConsentSection] = sectionTypes.map { contentSectionType in
        let consentSection = ORKConsentSection(type: contentSectionType)
        consentSection.summary = "Complete the study"
        consentSection.content = "This survey will ask you three questions and you will also measure your tapping speed by performing a small activity."
        return consentSection
    }
    
    Document.sections = consentSections
    /*
    Document.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "UserSignature"))
    */
    var steps = [ORKStep]()
    
    //Visual Consent
    /*
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsent", document: Document)
    steps += [visualConsentStep]
    */
    //Signature
    
    //let signature = Document.signatures!.first! as ORKConsentSignature
    let reviewConsentStep = ORKConsentReviewStep(identifier: "Review", signature: nil, in: Document)
    reviewConsentStep.text = "Review the consent"
    reviewConsentStep.reasonForConsent = "Consent to join the Research Study."
    
    steps += [reviewConsentStep]
    
    //Completion
    let completionStep = ORKCompletionStep(identifier: "CompletionStep")
    completionStep.title = "Welcome"
    completionStep.text = "Thank you for joining this study."
    steps += [completionStep]
    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}
